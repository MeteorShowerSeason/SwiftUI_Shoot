//
//  RefreshGridView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/6.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct RefreshGridView<Content:View>: View {
    
    @Binding var attr: GridAttr
    
    @Binding var refreshAttr: RefreshAttrs
    
    public let content: (Int, CGFloat) -> Content
    
    let onRefresh: () -> ()
    
    @State var refreshing: Bool = false //刷新状态
    
    public init(
        attr: Binding<GridAttr>,
        refreshAttr: Binding<RefreshAttrs>,
        @ViewBuilder content: @escaping (Int, CGFloat) -> Content,
                     onRefresh: @escaping () -> ()) {
        self._attr = attr
        self._refreshAttr = refreshAttr
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
                    
                    if self.attr.numItems > 0 {
                        VStack(alignment: self.attr.alignment, spacing: 0) {
                            
                            ForEach(0 ..< (self.attr.numItems / self.attr.columns), id: \.self) { row in
                                
                                // HStacks are our columns
                                HStack(spacing: 0) {
                                    ForEach(0 ... (self.attr.columns - 1), id: \.self) { column in
                                        self.content(
                                            (row * self.attr.columns) + column,
                                            (geometry.size.width/CGFloat(self.attr.columns))
                                        )
                                            .frame(width: geometry.size.width/CGFloat(self.attr.columns))
                                    }
                                }
                            }
                            
                            HStack(spacing: 0) {
                                ForEach(0 ..< (self.attr.numItems % self.attr.columns), id: \.self) { column in

                                    self.content(self.attr.result + column, (geometry.size.width/CGFloat(self.attr.columns)))
                                        .frame(width: geometry.size.width/CGFloat(self.attr.columns))
                                }
                            }
                            
                        }
                    }
                }//VStack
                    .offset(y: self.refreshAttr.offsetY)
            }//ScrollView
        }//GeometryReader
        
    }
}

struct GridAttr {
    // The number of columns we want to display
    var columns: Int = 0
    // The total number of items in the stack
    var numItems: Int = 0 {
        willSet {
            self.result = (newValue / self.columns) * self.columns
            print("numItems: \(newValue) ** result: \(self.result)")
        }
    }
    // The alignment of our columns in the last row
    // when they don't fill all the column slots
    var alignment: HorizontalAlignment = .leading
    
    var result: Int = 0
}
