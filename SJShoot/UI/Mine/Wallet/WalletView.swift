//
//  WalletView.swift
//  SJShoot
//
//  Created by limo on 2019/12/26.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI
import UIKit

struct WalletView: View {
    
    @State var txCount: Int = 9
    @State public var attrs: RefreshAttrs = autoRefreshAttr

    var body: some View {
        VStack {
            RefreshScrollView(attrs: self.$attrs, content: {
                VStack {
                    HStack(spacing: 0) {
                        
                        VStack(spacing: 40) {
                            WalletItemView(title: "今日收入", count: "100.0")
                            
                            WalletItemView(title: "昨日收入", count: "1300.4")
                            
                            WalletItemView(title: "前日收入", count: "205.67")
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                        VStack(spacing: 40){
                            WalletItemView(title: "当前余额", count: "1200.86")
                            
                            WalletItemView(title: "本月收入", count: "11100.0")
                            
                            WalletItemView(title: "累计收入", count: "108040.78")
                        }.frame(minWidth: 0, maxWidth: .infinity)
                    }.padding(.top, 40)
                    
                    Spacer()
                    
                    Text("你今天还有\(self.txCount)次提现机会")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: Detail2View(), label: {
                        Text("马上提现")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .background(Capsule().fill(Color.init(hex: color_ffe495)).frame(width: UIScreen.main.bounds.width-100, height: 40))
                            .frame(width: UIScreen.main.bounds.width-100, height: 40)
                    })
                }
            }, onRefresh: {

                print("refresh start")
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    
                    print("refresh over")
                    self.attrs.stopRefresh()
                })
            })
            //                .startRefresh()
            
            
            
        }
        .navigationBarTitle("钱包", displayMode: .inline)
        .navigationBarItems(trailing:
            NavigationLink(destination: WallertDetailView(), label: {
                Text("明细")
                    .font(.system(size: 18))
                    .foregroundColor(.blue)
            }))
    }
}

struct WalletItemView: View {
    
    @State var title: String
    @State var count: String
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Text(self.title)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .padding(.bottom, 10)
            
            Text("￥"+self.count)
                .font(.system(size: 20))
                .foregroundColor(.black)
                .fixedSize()
        }
    }
}

//struct TestField: UIViewRepresentable {
//
//    let keyboardType: UIKeyboardType
//    @Binding var text: String
//
//    func makeUIView(context: UIViewRepresentableContext<TestField>) -> UITextField {
//        let field = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//        field.backgroundColor = UIColor.gray
//        field.keyboardType = self.keyboardType
//        field.delegate = context.coordinator
//        field.becomeFirstResponder()
//
//        _ = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: field)
//            .compactMap{
//                guard let fd = $0.object as? UITextField else {
//                    return nil
//                }
//
//                return fd.text
//        }.sink {
//            self.text = $0
//        }
//
//        return field
//    }
//
//    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<TestField>) {
//
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, UITextFieldDelegate {
//
//        var parent: TestField
//
//        init(_ field: TestField) {
//            self.parent = field
//        }
//    }
//
//}

