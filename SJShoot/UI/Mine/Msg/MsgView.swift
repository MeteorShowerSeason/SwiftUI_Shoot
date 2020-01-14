//
//  MsgView.swift
//  SJShoot
//
//  Created by limo on 2019/12/28.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI

struct MsgView: View {
    
    @State public var showRefreshView: Bool = false
    @State public var pullStatus: CGFloat = 0
    @State var showToast: Bool = false
    
    @State var refreshAttrs: RefreshAttrs = autoRefreshAttr
    
    var body: some View {
        VStack {
            RefreshList(attrs: self.$refreshAttrs, content: {
                ForEach((0...30).reversed(), id: \.self){ index in
                    MsgItemView()
                }
            }, onRefresh: {
                DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                    self.refreshAttrs.stopRefresh()
                })
            })
        }.background(Color.init(hex: ui_bgs))
        .navigationBarTitle("消息", displayMode: .inline)
    }
}

struct MsgItemView: View {
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Text("2019-01-12 收款")
                .font(.system(size: 20))
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 8, trailing: 0))
            
            Text("爱哭的鱼向你支付了25元")
                .font(.system(size: 14))
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 7, leading: 15, bottom: 15, trailing: 0))
            
        }.background(Color.white)
    }
}
