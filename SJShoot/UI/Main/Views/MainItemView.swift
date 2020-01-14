//
//  MainItemView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/8.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct MainItemView<Content:View>: View {
    
    @State var columns: Int
    @State var index: Int
    @State var width: CGFloat
    @State var info: ImgDateModel
    @Binding var count: Int
    
    let content: (Int, CGFloat, Binding<ImageInfo>, Binding<ImgDateModel>) -> Content
    
    var body: some View {
        
        VStack(alignment: .leading ,spacing: 0){
            
            AlbumTitleView(info: self.$info, count: self.$count)
            
            ForEach(0 ..< (self.info.itemCount() / self.columns), id: \.self) { row in
                
                // HStacks are our columns
                HStack(spacing: 0) {
                    ForEach(0 ... (self.columns - 1), id: \.self) { column in
                        
                        self.content(
                            (row * self.columns) + column,
                            self.width,
                            self.$info.arrays[(row * self.columns) + column],
                            self.$info
                        )
                            .frame(width: self.width)
                    }
                }
            }
            
            HStack(spacing: 0) {
                ForEach(0 ..< (self.info.itemCount() % self.columns), id: \.self) { column in
                    
                    self.content(self.info.itemResult() + column,
                                     self.width,
                                     self.$info.arrays[self.info.itemResult() + column],
                                     self.$info
                    )
                        .frame(width: self.width)
                }
            }
            
        }
    }
}
