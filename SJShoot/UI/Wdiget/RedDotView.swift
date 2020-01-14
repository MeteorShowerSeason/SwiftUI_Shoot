//
//  RedDotView.swift
//  SJShoot
//
//  Created by MeteorShower on 2020/1/7.
//  Copyright © 2020 limo. All rights reserved.
//
// 红点

import SwiftUI

struct RedDotView: View {
    
    @Binding var count: Int
    
    @State var length: Int = 1
    @State var width: CGFloat = 24.0
    
    var body: some View {
        
        let newCount = String(self.count).count
        if newCount != self.length {
            self.length = newCount
        }
        
        if self.length > 1{
            let newWidth = CGFloat(self.length) * 14.0 + 10.0
            if newWidth != width {
                self.width = newWidth
            }
        }
        
        return VStack{
            if self.count > 0 {
                if self.count > 1 {
                    Text("\(self.count)")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .background(
                            Capsule().fill(Color.red).frame(width: self.width, height: 24)
                    )
                } else {
                    Text("\(self.count)")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .background(
                            Circle().fill(Color.red).frame(width: 24, height: 24)
                    )
                }
            } else {
                Text("")
            }
        }
    }
}
