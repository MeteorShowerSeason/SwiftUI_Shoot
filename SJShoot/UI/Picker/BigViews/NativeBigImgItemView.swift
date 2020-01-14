//
//  NativeBigImgItemView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/13.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct NativeBigImgItemView: View {
    
    var info: ImageInfo
    
    @Binding var showMenu: Bool
    
    var body: some View{
        ZStack {
            
            Color.init(hex: color_44558f)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                withAnimation {
                    self.showMenu.toggle()
                }
            }, label: {
                Image(uiImage: self.info.asset.getUIImage(contentMode: .aspectFit))
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            })
        }
    }
    
    
}
