//
//  DefaultHeaderView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/6.
//  Copyright © 2020 limo. All rights reserved.
//
// 默认刷新头部

import SwiftUI

struct DefaultHeaderView: View {
    
     @Binding var attrs: RefreshAttrs
    
    var body: some View {
        HStack {
            
            if self.attrs.loading {
                LoadingIndicator(isAnimating: self.$attrs.loading, style: UIActivityIndicatorView.Style.medium)
            }
            
            Text(self.attrs.refreshText)
                .font(.system(size: 16))
                .foregroundColor(.black)
        }.frame(width: UIScreen.main.bounds.width, height: 50)
    }
}
