//
//  ModifySexView.swift
//  SJShoot
//
//  Created by limo on 2019/12/27.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI

struct ModifySexView: View {
    
    @State var sex: Int

    @State var check: Bool = false
    
    var onDismiss: () -> ()
    
    var onCheckSex: (_ sex: Int) -> ()
    
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
                
                Text("修改性别")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                
                Spacer()
                
                Button(action: {
//                    if !self.nick.isEmpty {
                        self.onCheckSex(1)
//                    }
                }, label: {
                    Text("确定")
                        .font(.system(size: 18))
                        .foregroundColor(.blue)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                })
            }.background(Color.white)
            
            Divider().onAppear(){
                self.check = (self.sex == 2)
            }
            
            Button(action: {
                self.check.toggle()
            }, label: {
                SexItemView(title: "男", checked: self.$check, negate: true)
            })
            
            Divider()
            
            Button(action: {
                self.check.toggle()
            }, label: {
                SexItemView(title: "女", checked: self.$check)
            })
            
            Spacer()
        }
        .background(Color.init(hex: ui_bgs))
        .onTapGesture {
            dissmissKeyboard()
        }
    }
}

struct SexItemView: View {
    
    var title: String
    @Binding var checked: Bool
    var negate: Bool = false //是否取反操作
    
    var body: some View {
        HStack {
            Text(self.title)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 20))
            
            
            Spacer()
            
            if self.negate ? !self.checked : self.checked {
                Image("native_check")
                    .renderingMode(.original)
                    .frame(width: 60, height: 42)
            }
        }.background(Color.white)
    }
}

