//
//  GridStack.swift
//  SJShoot
//
//  Created by Solo on 2020/1/8.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct GridStack<Content>: View where Content: View {
    
    var columns: Int
    
    public let content: (Int, CGFloat, ImgDateModel) -> Content
    
    @Binding var arrayList: [ImgDateModel]
    
    public init(
        columns: Int,
        arrayList: Binding<[ImgDateModel]>,
        @ViewBuilder content: @escaping (Int, CGFloat, ImgDateModel) -> Content) {
        
        self.columns = columns
        self._arrayList = arrayList
        self.content = content
    }
    
    public var body : some View {
        
        GeometryReader {  geometry in
            
            ScrollView(Axis.Set.vertical) {
                
                ForEach(0 ..< self.arrayList.count, id: \.self) { index in
                    self.content(index, geometry.size.width/CGFloat(self.columns), self.arrayList[index])
                }
            }
        }
        
    }
}

