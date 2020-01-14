//
//  PageView.swift
//  SJShoot
//
//  Created by MeteorShower on 2020/1/9.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    @Binding var currentItem: Int
    
    var viewControllers: [UIHostingController<Page>] = []
    
    init(_ views: [Page], currentItem: Binding<Int>){
       
        self.viewControllers = views.map({UIHostingController(rootView: $0)})
        self._currentItem = currentItem
    }
    
    var body: some View {
//        ZStack(alignment: .bottomTrailing){
//            PageViewController(controllers: viewControllers, currentItem: $currentItem)
            PageViewController(controllers: viewControllers, currentItem: $currentItem)
//            PageControl(numberOfPages: viewControllers.count, currentPage: $currentItem)
//            .padding(.trailing)
//        }
    }
}

