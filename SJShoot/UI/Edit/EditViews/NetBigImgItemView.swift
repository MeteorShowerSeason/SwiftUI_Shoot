//
//  NetBigImgItemView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/13.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct NetBigImgItemView: View {
    
    var url: String
    @Binding var showMenu: Bool
    
    var body: some View{
        ZStack {
            Color.init(hex: color_44558f)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                withAnimation{
                    self.showMenu.toggle()
                }
            }, label: {
                BigImage(attrs: ImageAttr(url: self.url, width: UIScreen.main.bounds.width))
            })
        }
    }
}
