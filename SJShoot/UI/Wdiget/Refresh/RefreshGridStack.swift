//
//  RefreshGridStack.swift
//  SJShoot
//
//  Created by Solo on 2020/1/9.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct RefreshGridStack<Content>: View where Content: View {
    
    var columns: Int
    
    @Binding var refreshAttr: RefreshAttrs
    
    public let content: (Int, CGFloat, ImgDateModel) -> Content
    
    @Binding var arrayList: [ImgDateModel]
    
    let onRefresh: () -> ()
    
    @State var refreshing: Bool = false //刷新状态
    
    public init(
        columns: Int,
        refreshAttr: Binding<RefreshAttrs>,
        arrayList: Binding<[ImgDateModel]>,
        @ViewBuilder content: @escaping (Int, CGFloat, ImgDateModel) -> Content,
                     onRefresh: @escaping () -> ()) {
        
        self.columns = columns
        self._refreshAttr = refreshAttr
        self._arrayList = arrayList
        self.content = content
        self.onRefresh = onRefresh
    }
    
    public var body : some View {
        
        GeometryReader {  geometry in
            
            ScrollView(Axis.Set.vertical) {
                
                VStack {
                    GeometryReader { g -> DefaultHeaderView in
                        
                        let frame = g.frame(in: CoordinateSpace.global)
                        
                        let moveY = frame.origin.y
                        
                        self.refreshAttr.dragY = moveY
                        
                        if self.refreshAttr.offsetY == 0.0 && self.refreshAttr.dragType == .NORMAL {
                            self.refreshAttr.offsetY = -50
                        }
                        
                        switch self.refreshAttr.dragType {
                        case .PULL_REFRESH:
                            if !self.refreshing {
                                self.refreshing = true
                                self.onRefresh()
                            }
                        default:
                            if self.refreshing {
                                self.refreshing = false
                            }
                        }
                        
                        return DefaultHeaderView(attrs: self.$refreshAttr)
                    }
                    
                    ForEach(0 ..< self.arrayList.count, id: \.self) { index in
                        self.content(index, geometry.size.width/CGFloat(self.columns), self.arrayList[index])
                    }
                }.offset(y: self.refreshAttr.offsetY)
            }
        }
        
    }
}

