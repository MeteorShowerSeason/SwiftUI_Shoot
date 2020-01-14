//
//  ListRefresh.swift
//  SJShoot
//
//  Created by Solo on 2020/1/3.
//  Copyright © 2020 limo. All rights reserved.
//

//
//  WallertDetailView.swift
//  SJShoot
//
//  Created by limo on 2019/12/30.
//  Copyright © 2019 limo. All rights reserved.
//
// 钱包明细

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct RefreshList<Content: View>: View {
    
    @Binding var attrs: RefreshAttrs
    let content: () -> Content
    let onRefresh: () -> ()
    
    @State var refreshing: Bool = false //刷新状态
    
    var body: some View {
        VStack {
            List{
                GeometryReader { g -> DefaultHeaderView in

                    let frame = g.frame(in: CoordinateSpace.global)

                    let moveY = frame.origin.y
                    
                    self.attrs.dragY = moveY
                    
                    if self.attrs.offsetY == 0.0 && self.attrs.dragType == .NORMAL {
                        self.attrs.offsetY = -50
                        print("offsetY : \(self.attrs.offsetY)")
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
                        print("normal")
                    }

                    return DefaultHeaderView(attrs: self.$attrs)
                }
                
                self.content()
                
//                GeometryReader { g -> Text in
//
//                    let frame = g.frame(in: CoordinateSpace.global)
//
//                    print("frame Y2 : \(frame.origin.y)")
//                    //                    if frame.origin.y > 250 {
//                    //                        return Text("Loading")
//                    //                    } else {
//                    return Text("")
//                    //                    }
//                }
            }
//            .offset(x: 0, y: self.attrs.offsetY)
            
            
        }.navigationBarTitle("明细", displayMode: .inline)
    }
}
//
//struct RefreshItemView: View {
//
//    @State var position: Int
//
//    var body: some View {
//
//        VStack(spacing: 0) {
//
//            Text("2019-01-12 收款 \(self.position)")
//                .font(.system(size: 20))
//                .foregroundColor(.black)
//                .padding(EdgeInsets(top: 15, leading: 15, bottom: 8, trailing: 0))
//
//            Text("爱哭的鱼向你支付了25元")
//                .font(.system(size: 14))
//                .foregroundColor(.black)
//                .padding(EdgeInsets(top: 7, leading: 15, bottom: 15, trailing: 0))
//
//        }.background(Color.white)
//    }
//}
//
