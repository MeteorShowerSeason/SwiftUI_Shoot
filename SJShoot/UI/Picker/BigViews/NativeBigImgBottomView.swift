//
//  NativeBigImgBottomView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/10.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI
import Photos

struct NativeBigImgBottomView: View {
    
    @Binding var dateInfo: ImgDateModel
    @Binding var checkCount: Int
    @Binding var currentItem: Int
    
    @State var showDelAlert: Bool = false
    @State var toastAttr: ToastAttr = ToastAttr()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                
                Button(action: {
                    self.showDelAlert = true
                }, label: {
                    Image("big_img_del")
                        .renderingMode(.original)
                    .padding(15)
                }).alert(isPresented: self.$showDelAlert, content: {
                    Alert(title: Text("温馨提示"),
                      message:
                    Text("确定从手机删除？")
                        .font(.system(size: 14))
                        .foregroundColor(.black),
                      
                      primaryButton: .default(Text("确定"), action: {
                            self.showDelAlert = false
                        
                            self.delNativePhoto(assert: self.itemModel().asset)
                      }),
                      secondaryButton: .cancel(
                        Text("取消")
                    ))
                })
                
                Spacer()
                
                Text("\(self.itemModel().asset.pixelWidth)*\(self.itemModel().asset.pixelHeight)")
                    .foregroundColor(.white)
                    .font(.system(size: 10))
                
                Button(action: {
                    self.dateInfo.arrays[self.currentItem].checked.toggle()
                    if self.itemModel().checked {
                        self.checkCount += 1
                    } else {
                        if self.checkCount > 0 {
                            self.checkCount -= 1
                        }
                    }
                }, label: {
                    Image(itemModel().checked ? "big_img_check" : "big_img_normal")
                        .renderingMode(.original)
                        .padding(15)
                })
            }.background(Color.init(hex: color_44558f))
        }
        .toast(attr: self.$toastAttr)
    }
    
    func itemModel() -> ImageInfo {
        return self.dateInfo.arrays[self.currentItem]
    }
    
    func delNativePhoto(assert: PHAsset){
        delNativePhoto(asserts: [assert])
    }
    
    func delNativePhoto(asserts: [PHAsset]) {
        PHPhotoLibrary.shared().performChanges({
            
            PHAssetChangeRequest.deleteAssets(asserts as NSArray)
            
        }, completionHandler: { (success, error) in
            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                self.toastAttr.isShowing = true
                self.toastAttr.message = success ? "删除成功" : "删除失败"
                if success {
                    if self.itemModel().checked {
                        self.checkCount -= 1
                    }
                    self.dateInfo.arrays.remove(at: self.currentItem)
                    if self.currentItem > 0 {
                        self.currentItem -= 1
                    }
                }
            })
        })
    }
}
