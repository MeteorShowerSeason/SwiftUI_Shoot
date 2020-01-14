//
//  ModifyPhoneView.swift
//  SJShoot
//
//  Created by limo on 2019/12/30.
//  Copyright © 2019 limo. All rights reserved.
//
// 更换手机号

import SwiftUI

struct ModifyPhoneView: View {
    
    var onDismiss: () -> ()
    
    @State private var name: String = ""
    @State private var code: String = ""
    @State var clickNums = 60
    
    @State var toastAttr: ToastAttr = ToastAttr()
    
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
        NavigationView {
        VStack{
            HStack {
                TextField("请输入手机号", text: self.$name)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width-130, height: 40)
            }
            .background(Capsule().stroke(Color.init(hex: line), lineWidth: 1)
            .frame(width: UIScreen.main.bounds.width-100, height: 40))
            .frame(width: UIScreen.main.bounds.width-100, height: 40)
            
            HStack {
                TextField("请输入验证码", text: self.$code)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                
                Button(action: {
                    if self.clickNums <= 0 || self.clickNums == 60{
                        self.clickNums = 60
                        self.timer.fire()
                    }
                }, label: {
                    if self.clickNums == 60 {
                        Text("获取验证码")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .padding(8)
                            .background(Capsule().fill(Color.init(hex: color_ffe495)))
                    } else if self.clickNums < 60 && self.clickNums > 0 {
                        Text("\(self.clickNums)s后重新获取")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .padding(8)
                            .background(Capsule().fill(Color.init(hex: color_ffe495)))
                    } else {
                        Text("重新获取验证码")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .padding(8)
                            .background(Capsule().fill(Color.init(hex: color_ffe495)))
                    }
                })
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
            }
            .background(Capsule().stroke(Color.init(hex: line), lineWidth: 1)
            .frame(width: UIScreen.main.bounds.width-100, height: 40))
            .frame(width: UIScreen.main.bounds.width-100, height: 40)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            Button(action: {
                self.toastAttr.isShowing = true
                self.toastAttr.message = "修改成功"
            }, label: {
                Text("确定")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .background(Capsule().fill(Color.init(hex: color_ffe495))
                    .frame(width: UIScreen.main.bounds.width-100, height: 40))
                    .frame(width: UIScreen.main.bounds.width-100, height: 40)
            })
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 30, trailing: 0))
            
        }.navigationBarTitle("更换手机号")
            .navigationBarItems(leading:
                Button(action: {
                    self.onDismiss()
                }, label: {
                    Image("nav_back")
                        .renderingMode(.original)
                })
            )
        .toast(attr: self.$toastAttr)
        }
    }
}
