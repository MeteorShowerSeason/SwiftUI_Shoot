//
//  MineView.swift
//  SJShoot
//
//  Created by limo on 2019/12/26.
//  Copyright © 2019 limo. All rights reserved.
//
// 个人中心

import SwiftUI

struct MineView: View {
    
    @State var showCameraRead: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                //头部
                HStack{
                    Spacer()
                    
                    NavigationLink(destination: MineInfoView(), label: {
                        VStack {
                            
                            CircleImage(attrs: ImageAttr(url: TEST_AVATAR_URL, width: 100))
                                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                            
                            Text("阿萨德蛮")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 6, leading: 0, bottom: 10, trailing: 0))
                        }
                    })
                    
                    Spacer()
                }.background(Color.init(hex: color_ffe495))
                //内容
                NavigationLink(destination: WalletView(), label: {
                    MenuItemView(value: "钱包")
                }).padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                
                NavigationLink(destination: MsgView(), label: {
                    MenuItemView(value: "消息")
                }).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
                NavigationLink(destination: DeliverPhotoView(), label: {
                    MenuItemView(value: "已收款照片")
                }).padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
                
                //                NavigationLink(destination: Detail2View(), label: {
                //                    MenuItemView(value: "摄影师必读")
                //                })
                Button(action: {
                    self.showCameraRead = true
                }, label: {
                    MenuItemView(value: "摄影师必读")
                }).sheet(isPresented: self.$showCameraRead) {
                    WebCommonView(url: "https://www.toutiao.com/", title: "摄影师必读", showFlag: self.$showCameraRead)
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
                NavigationLink(destination: UploadSetView(), label: {
                    
                    MenuItemView(value: "上传设置")
                }).padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
                
                NavigationLink(destination: SafetySetView(), label: {
                    
                    MenuItemView(value: "安全设置")
                }).padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
                
                NavigationLink(destination: MoreView(), label: {
                    
                    MenuItemView(value: "更多")
                }).padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
            }
                
            .background(Color.init(hex: ui_bgs))
            .navigationBarTitle("个人中心", displayMode: .inline)
            //            .edgesIgnoringSafeArea([.top, .bottom])
            //            .background(NavigationConfigurator{nc in
            //                nc.navigationBar.barTintColor = uiColor_ffe495
            //                //                    nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            //            })
        }
    }
}

struct MenuItemView: View {
    
    @State var value: String
    
    var body: some View {
        HStack {
            Text(self.value)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
            
            Spacer()
            
            Image("arrow_right_gray")
                .renderingMode(.original)
                .frame(width: 11, height: 19)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
        }.background(Color.white)
    }
}
