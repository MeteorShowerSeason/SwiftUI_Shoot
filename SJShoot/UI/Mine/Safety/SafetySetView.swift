//
//  SafetySetView.swift
//  SJShoot
//
//  Created by limo on 2019/12/30.
//  Copyright © 2019 limo. All rights reserved.
//
// 安全设置

import SwiftUI

struct SafetySetView: View {
    
    @State var isBindWX: Bool = false
    @State var showCancelBind: Bool = false//显示取消绑定提醒框
    @State var showModifyPhoneView: Bool = false//显示修改手机号
    @State var showBindWXView: Bool = false//显示绑定微信
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("185****0920")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                
                Spacer()
                
                Button(action: {
                    self.showModifyPhoneView = true
                }, label: {
                    Text("更换")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .background(Capsule().fill(Color.init(hex: color_ffe495)).frame(width: 60, height: 30))
                        .frame(width: 60, height: 30)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                })
                    .sheet(isPresented: self.$showModifyPhoneView, content: {
                        ModifyPhoneView(onDismiss: {
                            self.showModifyPhoneView = false
                        })
                    })
                
            }.background(Color.white)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            
            HStack {
                Text("微信")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                
                Spacer()
                
                if self.isBindWX {
                    
                    Button(action: {
                        self.showCancelBind = true
                    }, label: {
                        Text("解绑")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .background(Capsule().fill(Color.init(hex: color_ffe495)).frame(width: 60, height: 30))
                            .frame(width: 60, height: 30)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                    }).alert(isPresented: self.$showCancelBind, content: {
                        Alert(title: Text("温馨提示"),
                              message:
                            Text("解绑后，您将无法收到消费者的付款")
                                .font(.system(size: 14))
                                .foregroundColor(.gray),
                              
                              primaryButton: .default(Text("仍要解绑"), action: {
                                self.isBindWX = false
                              }),
                              secondaryButton: .cancel(
                                Text("取消解绑")
                            ))
                    })
                } else {
                    
                    Button(action: {
                        self.showBindWXView = true
                    }, label: {
                        Text("绑定")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                    })
                        .sheet(isPresented: self.$showBindWXView, content: {
                            BindWXView(onDismiss: {
                                self.showBindWXView = false
                            }, onBindSuccess: {
                                self.isBindWX = true
                            })
                        })

                    Image("arrow_right_gray")
                        .renderingMode(.original)
                        .frame(width: 11, height: 19)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                }
                
            }.background(Color.white)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            
            if !self.isBindWX {
                Divider()
                
                HStack {
                    Text("始记摄影采用微信支付技术向您提供服务，在没有捆绑您微信账户的情况下，您无法收到消费者支付的款项")
                        .foregroundColor(.blue)
                        .font(.system(size: 12))
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                }.background(Color.white)
            }
            
            Spacer()
            
        }
        .background(Color.init(hex: ui_bgs))
        .navigationBarTitle("安全设置", displayMode: .inline)
    }
}
