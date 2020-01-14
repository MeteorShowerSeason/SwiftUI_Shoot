//
//  ShootQRView.swift
//  SJShoot
//
//  Created by MeteorShower on 2020/1/12.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct ShootDetailView: View {
    
    @State var currentItem: Int = 0
    
    @State var viewControllers: [UIHostingController<NetBigImgItemView>] = []
    
    @State var showMenu: Bool = true
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.init(hex: color_44558f)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                if viewControllers.count > 0 {
                    PageViewController(controllers: viewControllers, currentItem: $currentItem)
                }
            }
            
            if self.showMenu {
                NetBigImgBottomView()
            }
            
        }.navigationBarTitle("\(currentItem+1)/10", displayMode: .inline)
            .onAppear() {
                
                var views: [NetBigImgItemView] = []
                
                for _ in (0...10).reversed() {
                    views.append(NetBigImgItemView(url: TEST_AVATAR_URL, showMenu: self.$showMenu))
                }
                
                print("views size : \(views.count)")
                
                self.viewControllers = views.map({UIHostingController(rootView: $0)})
        }
    }
    
}

