//
//  ModifyPriceView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/13.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct ModifyPriceView: View {
    
    @State var count: Int
    @Binding var showFavour: Bool
    
    @Binding var price: String
    
    var onEnter: (_ price: String) -> ()
    
    @State var toastAttr: ToastAttr = ToastAttr()
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack{
                    Text("￥")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .bold()
                    
                    TextField("", text: self.$price)
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .keyboardType(.numbersAndPunctuation)
                        .frame(minWidth: 50, maxWidth: 100)
                }
                
                Divider().padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 100))
                
                Text("历史价格")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding([.top, .bottom], 15)
                
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            self.price = "5.00"
                        }, label: {
                            Text("5.00")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width/3, height: 45)
                                .border(Color.gray, width: 1)
                                .cornerRadius(5)
                        })
                        
                        Button(action: {
                            self.price = "3.00"
                        }, label: {
                            Text("3.00")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width/3, height: 45)
                                .padding(.leading, 2)
                                .border(Color.gray, width: 1)
                                .cornerRadius(5)
                        })
                    }
                    
                    HStack {
                        Button(action: {
                            self.price = "15.00"
                        }, label: {
                            Text("15.00")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width/3, height: 45)
                                .border(Color.gray, width: 1)
                                .cornerRadius(5)
                        })
                        
                        Button(action: {
                            self.price = "6.00"
                        }, label: {
                            Text("6.00")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width/3, height: 45)
                                .padding(.leading, 2)
                                .border(Color.gray, width: 1)
                                .cornerRadius(5)
                        })
                    }.padding(.top, 6)
                }
                
                Button(action: {
                    let value = CGFloat(self.price)
                    if value <= 0.0 {
                        self.toastAttr.isShowing = true
                        self.toastAttr.message = "请输入价格"
                        return
                    }
                    if self.createEnter() {
                        self.showFavour = true
                    } else {
                        self.onEnter(self.price)
                    }
                }, label: {
                    Text(self.createEnter() ? "下一步" : "确定")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .background(Capsule().fill(Color.init(hex: color_ffe495))
                            .frame(width: UIScreen.main.bounds.width-100, height: 40))
                        .frame(width: UIScreen.main.bounds.width-100, height: 40)
                }).padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            }.toast(attr: self.$toastAttr)
        }
    }
    
    func createEnter() -> Bool {
        
        if self.price.isEmpty {
            return false
        }
        
        if self.count >= 10 {
            let value = CGFloat(self.price)
            print("value : \(value)")
            if value >= 1.0{
                return true
            }
        }
        
        return false
    }
}
