//
//  AlbumTitleView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/8.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct AlbumTitleView: View {
    
    @Binding var info: ImgDateModel
    @Binding var count: Int
    
    var body: some View {
        
        print("\(self.info.createTime) ** \(self.info.checkAll)")
        
       return HStack {
            HStack{
                Text(self.info.createTime)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(.leading, 8)
                
                Image("arrow_right_gray")
                    .renderingMode(.original)
                    .frame(width: 11, height: 19)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
            }
            .background(
                Capsule()
                    .fill(Color.init(hex: color_ffe495))
                    .frame(width: 110, height: 30))
            .frame(width: 110, height: 30)
            
            Spacer()
            
            Button(action: {
                self.info.checkAll = !self.info.checkAll
                let choose = self.info.getCheckCount()
                self.info.updateCheckAll(check: self.info.checkAll)
                if self.info.checkAll {
                    self.count += (self.info.itemCount() - choose)
                } else {
                    self.count -= self.info.itemCount()
                }
                print("Button \(self.info.createTime) ** \(self.info.checkAll)")
            }, label: {
                Text(self.info.checkAll ? "取消全选" : "全选")
                    .font(.system(size: 16))
                    .foregroundColor(self.info.checkAll ? .gray : .black)
            })
        }
        .padding(EdgeInsets(top: 25, leading: 0, bottom: 10, trailing: 0))
    }
}
