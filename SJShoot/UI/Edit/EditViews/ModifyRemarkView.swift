//
//  ModifyRemarkView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/13.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct ModifyRemarkView: View {
    
    @State var remark: String = ""
    
    var onRemark: (_ remark: String) -> ()
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("请输入备注", text: $remark)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
//                    .keyboardType(.numberPad)
                
                Divider().padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                
                Button(action: {
                    self.onRemark(self.remark)
                }, label: {
                    Text("确定")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .background(Capsule().fill(Color.init(hex: color_ffe495))
                            .frame(width: UIScreen.main.bounds.width-100, height: 40))
                        .frame(width: UIScreen.main.bounds.width-100, height: 40)
                }).padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                
            }.navigationBarTitle("写备注")
        }.onTapGesture {
            dissmissKeyboard()
        }
    }
}
