//
//  MoreView.swift
//  SJShoot
//
//  Created by limo on 2019/12/30.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI

struct MoreView: View {
    
    @State var showWebAgree: Bool = false
    @State var showWebOnly: Bool = false
    
    var body: some View {
        VStack(spacing: 0)  {
            Button(action: {
                self.showWebAgree = true
            }, label: {
                MenuItemView(value: "用户协议")
            }).sheet(isPresented: self.$showWebAgree) {
                WebCommonView(url: "https://www.baidu.com", title: "用户协议", showFlag: self.$showWebAgree)
            }
            
            Divider()
            
            Button(action: {
                self.showWebOnly = true
            }, label: {
                MenuItemView(value: "隐私协议")
            }).sheet(isPresented: self.$showWebOnly) {
                WebCommonView(url: "https://www.toutiao.com/", title: "隐私协议", showFlag: self.$showWebOnly)
            }
            
            Divider()
            
            NavigationLink(destination: MoreAboutView(), label: {
                
                MenuItemView(value: "关于始记")
            }).padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
        }
        .background(Color.init(hex: ui_bgs))
        .navigationBarTitle("更多", displayMode: .inline)
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
