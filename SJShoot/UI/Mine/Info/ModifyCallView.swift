//
//  ModifyCallView.swift
//  SJShoot
//
//  Created by limo on 2019/12/27.
//  Copyright © 2019 limo. All rights reserved.
//
// 修改联系方式

import SwiftUI

struct ModifyCallView: View {
    @Binding var call: String
    
    var onDismiss: () -> ()
    
    var onCallClick: (_ call: String) -> ()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack{
                Button(action: {
                    self.onDismiss()
                }, label: {
                    Image("nav_back")
                        .renderingMode(.original)
                        .frame(width:38, height: 38)
                })
                
                Spacer()
                
                Text("修改联系方式")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                
                Spacer()
                
                Button(action: {
                    self.onCallClick(self.call)
                }, label: {
                    Text("确定")
                        .font(.system(size: 18))
                        .foregroundColor(.blue)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                })
            }.background(Color.white)
            
            Divider()
            
            HStack {
                Text("联系方式")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 20))
                
                TextField("请输入联系方式", text: self.$call)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 0))
                
                Spacer()
            }.background(Color.white)
            
            Spacer()
        }
        .background(Color.init(hex: ui_bgs))
        .onTapGesture {
            dissmissKeyboard()
        }
    }
}

