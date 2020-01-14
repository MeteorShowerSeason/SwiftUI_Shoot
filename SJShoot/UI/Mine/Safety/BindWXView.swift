//
//  BindWXView.swift
//  SJShoot
//
//  Created by limo on 2019/12/31.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI

struct BindWXView: View {
    
    var onDismiss: () -> ()
    
    var onBindSuccess: () -> ()
    
    var maxWidth = UIScreen.main.bounds.width - 80
    var maxHeight = (UIScreen.main.bounds.width - 80) / 588 * 277
    
    var body: some View {
        VStack(spacing: 0) {
            Image("bind_wx_top")
                .renderingMode(.original)
                .resizable()
                .frame(width: maxWidth, height: maxHeight)
            
            VStack {
                Text("绑定微信号")
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
                
                Text("消费者的付款方可存入您的微信零钱中")
                    .font(.system(size: 14))
                    .foregroundColor(Color.init(hex: color_4a4a4a))
                
                Button(action: {
                    self.onBindSuccess()
                }, label: {
                    Image("bind_wx")
                        .renderingMode(.original)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0))
                })
                
                Button(action: {
                    self.onDismiss()
                }, label: {
                    Text("返回")
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                }).padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            }
            .frame(width: maxWidth)
            .background(Color.init(hex: color_eaf2fc))
            .cornerRadius(5)
            .padding(EdgeInsets(top: -6, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
