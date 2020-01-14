//
//  MainBottomView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/7.
//  Copyright © 2020 limo. All rights reserved.
//
// 主页选中底部栏

import SwiftUI

struct MainBottomView: View {
    
    @Binding var checkCount: Int
    
    var body: some View {
        
        return ZStack {
            HStack {
                Image("nav_del")
                    .renderingMode(.original)
                    .frame(width: 60, height: 40)
                
                Spacer()
                
                Image("native_check")
                    .renderingMode(.original)
                    .background(Capsule().fill(Color.init(hex: color_ffe495))
                        .frame(width: 100, height: 40))
                    .frame(width: 100, height: 40)
                    .padding([.top, .bottom], 10)
                
                Spacer()
                
                Image("ic_cancel")
                    .renderingMode(.original)
                    .frame(width: 60, height: 40)
            }
            
            RedDotView(count: self.$checkCount)
                .padding(EdgeInsets(top: 0, leading: 80, bottom: 25, trailing: 0))
        }
        .background(Color.white)
    }
}
