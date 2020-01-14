//
//  SetFavourableView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/13.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct SetFavourableView: View {
    
    @Binding var showing: Bool
    
    @State var number: String = "15"
    @State var cut: String = "2.0"
    
    @State var toastAttr: ToastAttr = ToastAttr()
    
    let onFavour: (Int, CGFloat) -> ()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack{
                Text("满")
                    .font(.system(size: 22))
                    .foregroundColor(.black)
                
                TextField("", text: self.$number)
                    .font(.system(size: 22))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 150)
                    .keyboardType(.numberPad)
                
                Text("张")
                    .font(.system(size: 22))
                    .foregroundColor(.black)
            }
            
            Text("")
                .frame(width: 150, height: 2)
                .background(Color.init(hex: color_ffe495))
            
            HStack{
                Text("减")
                    .font(.system(size: 22))
                    .foregroundColor(.black)
                
                TextField("", text: self.$cut)
                    .font(.system(size: 22))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(width: 150)
                    .keyboardType(.numberPad)
                
                Text("元")
                    .font(.system(size: 22))
                    .foregroundColor(.black)
            }.padding(.top, 25)
            
            Text("")
                .frame(width: 150, height: 2)
                .background(Color.init(hex: color_ffe495))
            
            Button(action: {
                let num = Int(self.number) ?? 0
                if num > 0 {
                    let cutPrice = CGFloat(self.cut)
                    if cutPrice > 0 {
                        self.onFavour(num, cutPrice)
                    } else {
                        self.toastAttr.isShowing = true
                        self.toastAttr.message = "请输入满减金额"
                    }
                } else {
                    self.toastAttr.isShowing = true
                    self.toastAttr.message = "请输入满减张数"
                }
            }, label: {
                Text("使用该优惠")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .background(Capsule().fill(Color.init(hex: color_ffe495))
                        .frame(width: UIScreen.main.bounds.width-100, height: 40))
                    .frame(width: UIScreen.main.bounds.width-100, height: 40)
            }).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            
            Button(action: {
                self.showing = false
            }, label: {
                Text("不优惠")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .background(Capsule().stroke(Color.init(hex: color_ffe495), lineWidth: 1)
                        .frame(width: UIScreen.main.bounds.width-100, height: 40))
                    .frame(width: UIScreen.main.bounds.width-100, height: 40)
            }).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            
        }.toast(attr: self.$toastAttr)
    }
}
