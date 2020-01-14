//
//  MainDetailView.swift
//  SJShoot
//
//  Created by limo on 2019/12/19.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI
import Photos

struct MainDetailView: View {
    
    //取得的资源结果，用于存放PHAsset
    @State var assetsFetchResults: PHFetchResult<PHAsset> = PHFetchResult<PHAsset>()
    
    @State var loadStatus: LoadStatus = LoadStatus(isShowing: true)
    
    let albumHelper: AlbumUtils = AlbumUtils()
    
    var body: some View {
        
        LoadingView(loadStatus: self.$loadStatus){
            VStack {
                
//                if self.assetsFetchResults != nil {
                    FlowStack(columns: 3, numItems: self.assetsFetchResults.count, alignment: .leading) { index, colWidth in
                        
                        Image(uiImage: self.assetsFetchResults[index].getUIImage(colWidth: colWidth, colHeight: colWidth, contentMode: .aspectFit))
                            .resizable()
                            .frame(width: colWidth, height: colWidth)
                            .aspectRatio(contentMode: .fit)
                    }
//                }
                
            }
            .navigationBarTitle("Detail", displayMode: .inline)
            .navigationBarItems(trailing:
                HStack {
                                        NavigationLink(destination: Detail2View(), label: {
                                            Image("logo").resizable().frame(width: 30, height: 30)
                                        })
                }
            ).onAppear(){//加载相册
                PHPhotoLibrary.requestAuthorization({
                    (status) in
                    if status != .authorized {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        
                        self.assetsFetchResults = self.albumHelper.getAllPhotos()
                        
                        self.loadStatus.isShowing = false
                    }
                })
            }
        }
    }
}

//                    Text(" \(index) ").frame(width: colWidth)

//                    self.imageManager!.requestImage(for:  self.assetsFetchResults![index], targetSize: CGSize(width: colWidth, height: colWidth), contentMode: PHImageContentMode.aspectFill, options: nil, resultHandler: { (image, nfo) in
//                        Image(image ?? UIImage(imageLiteralResourceName: "logo"))
//                              .resizable()
//                              .frame(width: colWidth, height: colWidth)
//                              .aspectRatio(contentMode: .fit)
//                        })


//            RefreshList(showRefreshView: $showRefreshView, pullStatus: $pullStatus, action: {
//                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
//                    self.numbers.removeAll()
//
//                    for num in 0...30 {
//                        self.numbers.append(num)
//                    }
//
//                    self.showRefreshView = false
//                })
//            }, content: {
//                ForEach(self.numbers, id: \.self) {_ in
//
//                    NavigationLink(destination: Detail2View(), label: {
//                        ItemView()
//                    })
//
//                }
//            })
