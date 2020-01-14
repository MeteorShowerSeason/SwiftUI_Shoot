//
//  ScrollRefresh.swift
//  SJShoot
//
//  Created by MeteorShower on 2020/1/4.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct RefreshScrollView<Content: View>: View {
    
    @Binding var attrs: RefreshAttrs
    let content: () -> Content
    let onRefresh: () -> ()
    
    @State var refreshing: Bool = false //刷新状态
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0){
                GeometryReader { g -> DefaultHeaderView in
                    
                    let frame = g.frame(in: CoordinateSpace.global)
                    
                    let moveY = frame.origin.y
                    
                    self.attrs.dragY = moveY
                    
                    if self.attrs.offsetY == 0.0 && self.attrs.dragType == .NORMAL {
                        self.attrs.offsetY = -50
//                        print("offsetY : \(self.attrs.offsetY)")
                    }
                    
                    switch self.attrs.dragType {
                    case .PULL_REFRESH:
                        if !self.refreshing {
                            self.refreshing = true
                            self.onRefresh()
                        }
                    default:
                        if self.refreshing {
                            self.refreshing = false
                        }
//                        print("normal")
                    }
                    
                    return DefaultHeaderView(attrs: self.$attrs)
                }.frame(height: 50)
                
                self.content()
            }
            .offset(x: 0, y: self.attrs.offsetY)
        }.background(Color.init(hex: ui_bgs))
    }
}


