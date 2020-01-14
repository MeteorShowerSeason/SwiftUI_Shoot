//
//  LoginView.swift
//  SJShoot
//
//  Created by limo on 2019/12/19.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @Binding var viewState: ContentState
    @State var clickNums = 60
    @State private var name: String = ""
    @State private var code: String = ""
    @State private var isRead = true
    @State var showWebAgree: Bool = false
    @State var showWebOnly: Bool = false
   
    var timer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            _ in

            if self.clickNums < 0 {
                self.timer.fireDate = Date.distantFuture
                self.timer.invalidate()
            } else {
                self.clickNums -= 1
            }
        })
    }
           
   var body: some View {
        ZStack {
            Color.white
            //隐藏键盘,只要有键盘弹出,点击空白出就会隐藏键盘
            
            NavigationView {
                    
                        VStack {
                            
                            Text("始记摄影欢迎您使用！")
                                .font(.body)
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 100, leading: 0, bottom: 150, trailing: 0))
                            
                          TextField("请输入手机号", text: $name)
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                                .keyboardType(.numberPad)
                            
                            Divider().padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                            HStack {
                                TextField("请输入验证码", text: $code)
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                                    .keyboardType(.numberPad)
                                Spacer()
                                Button(action: {
                                    if self.clickNums <= 0 || self.clickNums == 60{
                                        self.clickNums = 60
                                        self.timer.fire()
                                    }
                                }, label: {
                                    if self.clickNums == 60 {
                                        Text("获取验证码")
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                                            .background(Capsule().fill(Color.init(hex: color_ffe495)))
                                    } else if self.clickNums < 60 && self.clickNums > 0 {
                                        Text("\(self.clickNums)s后重新获取")
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                                            .background(Capsule().fill(Color.init(hex: color_ffe495)))
                                    } else {
                                        Text("重新获取验证码")
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                                            .background(Capsule().fill(Color.init(hex: color_ffe495)))
                                    }
                                })
                                
                            }.padding(EdgeInsets(top: 20, leading: 50, bottom: 0, trailing: 50))
                            Divider().padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                            
                            Button(action: {
                                self.viewState = ContentState.STATE_MAIN
                            }, label: {
                                Text("登录")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .background(Capsule().fill(Color.init(hex: color_ffe495))
                                    .frame(width: UIScreen.main.bounds.width-100, height: 40))
                                    .frame(width: UIScreen.main.bounds.width-100, height: 40)
                            }).padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                            
                            Spacer()
                            Text("始记云盘出品")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                            
                            HStack {
                                Image(self.isRead ? "pact_fill" : "pact_normal")
                                
                                Button(action: {
                                    self.isRead = !self.isRead
                                }, label: {
                                    Text("您已详细阅读并同意").font(Font.custom("name-of-font", size: 12)).foregroundColor(.black)
                                })
                                
            //                    SJ_AGREE_URL
                                Button(action: {
                                    self.showWebAgree = true
                                }, label: {
                                    Text("用户协议").font(Font.custom("name-of-font", size: 12)).foregroundColor(.blue)
                                }).sheet(isPresented: self.$showWebAgree) {
                                    WebCommonView(url: "https://www.baidu.com", title: "用户协议", showFlag: self.$showWebAgree)
                                }
                                
                                Text("和").font(Font.custom("name-of-font", size: 12)).foregroundColor(.black)
                                
                                //SJ_ONLY_URL https://www.toutiao.com/
                                Button(action: {
                                   self.showWebOnly = true
                               }, label: {
                                   Text("隐私协议").font(Font.custom("name-of-font", size: 12)).foregroundColor(.blue)
                               }).sheet(isPresented: self.$showWebOnly) {
                                    WebCommonView(url: "https://www.toutiao.com/", title: "隐私协议", showFlag: self.$showWebOnly)
                               }
                            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        }
                        .navigationBarTitle("登录")
                        .navigationBarHidden(true)
                        .edgesIgnoringSafeArea(.all)
            }
            .onTapGesture {
                    dissmissKeyboard()
            }
        }
   }
}

//       VStack {
//           Text("登录界面")
//
//            Divider()
//
//           Button(action: {
//               self.viewState = ContentState.STATE_MAIN
//           }, label: {
//               Text("启动主界面").font(.title).foregroundColor(.white)
//           })
//           .background(Color.black)

//            Button(action: {
//                if self.clickNums <= 0 || self.clickNums == 60{
//                    self.clickNums = 60
//                    self.timer.fire()
//                }
//            }, label: {
//                if self.clickNums == 60 {
//                    Text("获取验证码").font(.title).foregroundColor(.white)
//                } else if self.clickNums < 60 && self.clickNums > 0 {
//                    Text("\(self.clickNums)s后重新获取").font(.title).foregroundColor(.white)
//                } else {
//                    Text("重新获取验证码").font(.title).foregroundColor(.white)
//                }
//            }).background(Color.gray)

