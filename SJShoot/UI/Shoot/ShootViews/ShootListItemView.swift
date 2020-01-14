//
//  ShootListItemView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/13.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct ShootListItemView: View {
    var width: CGFloat = UIScreen.main.bounds.width - 60
    @State var numItems: Int = 3
    @State var columns: Int = 3
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack {
                VStack(alignment: .leading) {
                    Text("11月29日 10：52")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    
                    Text("广州市越秀区太和岗路26号")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image("nav_del")
                    .renderingMode(.original)
            }.padding(15)
            
            if self.numItems > 0 {
                //                    VStack(alignment: .leading, spacing: 0) {
                
                HStack(spacing: 0) {
                    ForEach(0 ..< self.numItems, id: \.self) { column in
                        
                        RectImage(attrs: ImageAttr(
                            url: TEST_AVATAR_URL,
                            width: self.width/CGFloat(self.columns),
                            height: self.width/CGFloat(self.columns))
                        )
                        .frame(width: self.width/CGFloat(self.columns),height: self.width/CGFloat(self.columns))
                            .padding(.leading, column > 0 ? 2 : 0)
                    }
                }.padding([.leading, .trailing], 15)
                
                //                    }
            }
            
            HStack{
                
                Text("照片：161")
                    .font(.system(size: 10))
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("￥3.0")
                    .font(.system(size: 10))
                    .foregroundColor(.red)
                
                Text("每满15张减5.00元")
                    .font(.system(size: 10))
                    .foregroundColor(.red)
                
            }.padding(15)
            
        }.background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(EdgeInsets(top: 2, leading: 15, bottom: 3, trailing: 15))
    }
}

