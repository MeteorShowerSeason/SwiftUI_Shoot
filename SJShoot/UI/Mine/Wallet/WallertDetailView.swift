//
//  WallertDetailView.swift
//  SJShoot
//
//  Created by limo on 2019/12/30.
//  Copyright © 2019 limo. All rights reserved.
//
// 钱包明细

import SwiftUI

struct WallertDetailView: View {
    
    @State var refreshAttr: RefreshAttrs = autoRefreshAttr
    
    var body: some View {
        VStack {
            RefreshScrollView(attrs: self.$refreshAttr, content: {
                List{
                    ForEach((0...30).reversed(), id: \.self){ index in
                        WallertDetailItemView()
                    }
                }
            }, onRefresh: {
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    self.refreshAttr.stopRefresh()
                })
            })
        }.background(Color.init(hex: ui_bgs))
        .navigationBarTitle("明细", displayMode: .inline)
    }
}

struct WallertDetailItemView: View {
    
    @State var flag: Bool = false
    
    var body: some View {
        
        HStack {
            
            Image(self.flag ? "income" : "cash_out")
            
            VStack(alignment: .leading) {
                
                Text(self.flag ? "入账" : "出账")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                
                Text("2020-01-13  14:14")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("1.80")
                .font(.system(size: 20))
                .foregroundColor(.black)
            
            Text("")
                .frame(width: 3, height: 20)
                .fixedSize(horizontal: false, vertical: true)
                .background(Color.init(hex: color_ffe495))
        }
    }
}
