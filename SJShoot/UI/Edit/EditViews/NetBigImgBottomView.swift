//
//  NetBigImgBottomView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/13.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct NetBigImgBottomView: View {
    
    @State var showModifyRemark: Bool = false
    @State var showModifyPrice: Bool = false
    
    @State var remark: String = ""
    
    var body: some View {
        VStack(spacing: 0){
            
            if !self.remark.isEmpty {
                Text(self.remark)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .padding(.top, 15)
            }
            
            HStack{
                Image("qr_add")
                    .renderingMode(.original)
                    .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 10))
                
                Button(action: {
                    self.showModifyRemark = true
                }, label: {
                    Image("qr_remark")
                        .renderingMode(.original)
                        .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 15))
                })
                    .sheet(isPresented: self.$showModifyRemark, content: {
                        ModifyRemarkView(onRemark: { remark in
                            self.showModifyRemark = false
                            self.remark = remark
                        })
                    })
                
                Spacer()
                
                RectImage(attrs: ImageAttr(url: TEST_QR_URL, width: 100, height: 100))
                    .padding([.bottom, .top], 15)
                
                Spacer()
                
                Image("qr_share")
                    .renderingMode(.original)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 10))
                
                Button(action: {
                    self.showModifyPrice = true
                }, label: {
                    Image("qr_price")
                        .renderingMode(.original)
                        .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 25))
                })
                    .sheet(isPresented: self.$showModifyPrice, content: {
                        PriceFavourView(count: 11, showing: self.$showModifyPrice, setPrice: { price in
                            self.showModifyPrice = false
                            print("价格: \(price)")
                        }, setFavour: { price, num, cut in
                            self.showModifyPrice = false
                            print("价格：\(price) ** 满\(num)减\(cut)元")
                        })
                    })
                
            }
        }.background(Color.white)
    }
}

