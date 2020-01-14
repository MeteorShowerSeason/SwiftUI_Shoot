//
//  NaviteBigImgView.swift
//  SJShoot
//
//  Created by MeteorShower on 2020/1/9.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI
import Photos

struct NativeBigImgView: View {
    
    @Binding var dateInfo: ImgDateModel
    @State var currentItem: Int
    @Binding var checkCount: Int
    
    @State var viewControllers: [UIHostingController<NativeBigImgItemView>] = []
    
    @State var showMenu: Bool = true
    
    var body: some View {
        ZStack {
            Color.init(hex: color_44558f)
                .edgesIgnoringSafeArea(.all)
            
            if viewControllers.count > 0 {
                PageViewController(controllers: viewControllers, currentItem: $currentItem)
            }
            
            if self.showMenu {
                NativeBigImgBottomView(dateInfo: self.$dateInfo, checkCount: self.$checkCount, currentItem: self.$currentItem)
            }
        }.navigationBarTitle(self.checkCount > 0 ? "已选\(self.checkCount)张" : "", displayMode: .inline)
            .onAppear() {

                for item in self.dateInfo.arrays {
                    self.viewControllers.append(UIHostingController(rootView: NativeBigImgItemView(info: item, showMenu: self.$showMenu)))
                }
        }
    }
}

