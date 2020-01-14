//
//  MineInfoView.swift
//  SJShoot
//
//  Created by limo on 2019/12/27.
//  Copyright © 2019 limo. All rights reserved.
//
//个人信息

import SwiftUI

struct MineInfoView: View {
    
    @State var uidData = InfoItemData(title: "UID", name: "29939", showArrow: false)
    @State var avatarData = InfoItemData(title: "头像修改", name: TEST_AVATAR_URL)
    @State var nickData = InfoItemData(title: "昵称", name: "阿萨德蛮")
    @State var sexData = InfoItemData(title: "性别", name: "女", sex: 2)
    @State var cityData = InfoItemData(title: "城市")
    @State var callData = InfoItemData(title: "联系方式", nameColor: .blue)
    
    var body: some View {
        VStack(spacing: 0){
            
            VStack(spacing: 0){
                //UID
                InfoItemView(data: self.$uidData)
                
                Divider()
                
                //头像修改
                Button(action: {
                    self.avatarData.showSheet = true
                }, label: {
                    HStack {
                        
                        Text(self.avatarData.title)
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                        
                        Spacer()
                        
                        CircleImage(attrs: ImageAttr(url: self.avatarData.name, width: 50))
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 15))
                    }.background(Color.white)
                }).sheet(isPresented: self.$avatarData.showSheet, content: {
                    MineView()
                })
                
                Divider()
                
                //昵称
                Button(action: {
                    self.nickData.showSheet = true
                }, label: {
                    InfoItemView(data: self.$nickData)
                }).sheet(isPresented: self.$nickData.showSheet, content: {
                    ModifyNickView(nick: self.$nickData.name, onDismiss: {
                        self.nickData.showSheet = false
                    }, onEnter: { nick in
                        self.nickData.showSheet = false
                        self.nickData.name = nick
                    })
                })
                
            }
            
            VStack(spacing: 0){
                
                Divider()
                //性别
                Button(action: {
                    self.sexData.showSheet = true
                }, label: {
                    InfoItemView(data: self.$sexData)
                }).sheet(isPresented: self.$sexData.showSheet, content: {
                    ModifySexView(sex: self.sexData.sex, onDismiss: {
                        self.sexData.showSheet = false
                    }, onCheckSex: { sex in
                        self.sexData.showSheet = false
                        self.sexData.sex = sex
                        self.sexData.name = sex == 2 ? "女" : "男"
                    })
                })
                
                Divider()
                
                //城市
                Button(action: {
                    self.cityData.showSheet = true
                }, label: {
                    InfoItemView(data: self.$cityData)
                }).sheet(isPresented: self.$cityData.showSheet, content: {
                    ModifyCityView(nick: self.$cityData.name, onDismiss: {
                        self.cityData.showSheet = false
                    }, onEnter: { nick in
                        self.cityData.showSheet = false
                        self.cityData.name = nick
                    })
                })
                
                Divider()
                
                //联系方式
                Button(action: {
                    self.callData.showSheet = true
                }, label: {
                    InfoItemView(data: self.$callData)
                }).sheet(isPresented: self.$callData.showSheet, content: {
                    ModifyCallView(call: self.$callData.name, onDismiss: {
                        self.callData.showSheet = false
                    }, onCallClick: { call in
                        self.callData.showSheet = false
                        self.callData.name = call.isEmpty ? "填写联系方式" : call
                        self.callData.nameColor = call.isEmpty ? .blue : .gray
                    })
                })
            }
            
            Spacer()
            
        }
        .background(Color.init(hex: ui_bgs))
            
        .navigationBarTitle("我的信息", displayMode: .inline)
    }
}

struct InfoItemView: View {
    
    @Binding var data: InfoItemData
    
    var body: some View {
        
        HStack {
            
            Text(self.data.title)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
            
            Spacer()
            
            if self.data.nameColor == .blue {
                Text("填写联系方式")
                    .font(.system(size: 14))
                    .foregroundColor(self.data.nameColor)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: self.data.showArrow ? 5 : 15))
            } else {
                Text(self.data.name)
                    .font(.system(size: 14))
                    .foregroundColor(self.data.nameColor)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: self.data.showArrow ? 5 : 15))
            }
            
            if self.data.showArrow {
                Image("arrow_right_gray")
                    .renderingMode(.original)
                    .frame(width: 11, height: 19)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
            }
        }.background(Color.white)
    }
}

struct InfoItemData {
    var title: String
    var name: String = ""
    var showArrow: Bool = true
    var nameColor: Color = .gray
    var showSheet: Bool = false //是否显示此项下的Sheet View
    var sex: Int = 2;//2是女，1是男
}
