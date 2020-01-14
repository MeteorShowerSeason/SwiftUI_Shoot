//
//  AlbumItemView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/7.
//  Copyright © 2020 limo. All rights reserved.
//
//

import SwiftUI
import Photos

struct AlbumItemView: View {
    
    @State var itemWidth: CGFloat
    @Binding var info: ImageInfo
    @State var index: Int
    @Binding var count: Int
    @Binding var dateInfo: ImgDateModel
    
    var body: some View {
        
       ZStack {
            
        NavigationLink(destination: NativeBigImgView(dateInfo: self.$dateInfo, currentItem: self.index, checkCount: self.$count), label: {
                ZStack {
                    Image(uiImage: self.info.asset.getUIImage(colWidth: itemWidth, colHeight: itemWidth, contentMode: .aspectFit))
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: itemWidth-1, height: itemWidth-1)
                        .aspectRatio(contentMode: .fit)
                        .padding(EdgeInsets(top: 0.5, leading: 1, bottom: 0.5, trailing: 1))
                    
                    if self.info.checked {
                        VStack {
                            
                            Text("")
                            
                        }.frame(width: self.itemWidth-1, height: self.itemWidth-1)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.init(hex: color_44558f), lineWidth: 5.0)
                                    .background(Color.black)
                                    .opacity(0.65)
                        )
                        .padding(EdgeInsets(top: 0.5, leading: 1, bottom: 0.5, trailing: 1))
                    }
                }
            })
            
            Button(action: {
                self.info.checked = !self.info.checked
                
                if self.info.checked {
                    self.count += 1
                } else {
                    if self.count > 0 {
                        self.count -= 1
                    }
                }
            }, label: {
                Image(self.info.checked ? "checked" : "uncheck")
                    .renderingMode(.original)
                    .frame(width: 40, height: 40)
            })
                .padding(EdgeInsets(top: 0, leading: self.itemWidth - 50, bottom: self.itemWidth - 50, trailing: 0))
            
        }.frame(width: itemWidth, height: itemWidth)
    }
}
