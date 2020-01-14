//
//  MoreAboutView.swift
//  SJShoot
//
//  Created by limo on 2019/12/30.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI

struct MoreAboutView: View {
    var body: some View {
        VStack{
            Image("logo")
            .cornerRadius(10)
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            
            Text("始记摄影")
                .font(.system(size: 20))
                .foregroundColor(.black)
            
            Text("版本 v1.0")
                .font(.system(size: 14))
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
            
            Text("客服微信：shijiyunpan")
                .font(.system(size: 14))
                .foregroundColor(.black)
                .fixedSize(horizontal: true, vertical: false)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
            
            Text("广州本易互联网科技有限公司")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        
            Text("@2015-2019")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
        .navigationBarTitle("关于始记", displayMode: .inline)
    }
}

struct MoreAboutView_Previews: PreviewProvider {
    static var previews: some View {
        MoreAboutView()
    }
}
