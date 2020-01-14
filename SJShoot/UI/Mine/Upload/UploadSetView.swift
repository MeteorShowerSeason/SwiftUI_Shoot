//
//  UploadSetView.swift
//  SJShoot
//
//  Created by limo on 2019/12/30.
//  Copyright © 2019 limo. All rights reserved.
//
// 上传设置

import SwiftUI

struct UploadSetView: View {
    
    @State var toggerAutoUpload: Bool = false
    
    var body: some View {
        if self.toggerAutoUpload {
            print("自动备份选中")
        } else {
            print("取消自动备份")
        }
        
        return VStack(spacing: 0) {
            HStack {
                Text("移动网络自动备份")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                
                Spacer()
                
                Toggle(isOn: self.$toggerAutoUpload){
                    Text("");
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                
            }.background(Color.white)
            
            Spacer()
        }
        .background(Color.init(hex: ui_bgs))
        .navigationBarTitle("上传设置", displayMode: .inline)
    }
}
