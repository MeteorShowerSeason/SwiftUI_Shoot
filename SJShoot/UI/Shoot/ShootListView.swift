//
//  ShootListView.swift
//  SJShoot
//
//  Created by MeteorShower on 2020/1/9.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct ShootListView: View {
    
    @State public var attrs: RefreshAttrs = autoRefreshAttr
    
    @State var arrayList: [Int] = []
    
    var body: some View {
        VStack {
            RefreshScrollView(attrs: self.$attrs, content: {
                
                ForEach(0 ..< self.arrayList.count, id: \.self) { index in
                    NavigationLink(destination: ShootDetailView(), label: {
                        ShootListItemView()
                    })
                }
            }, onRefresh: {
                DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                    self.arrayList.removeAll()
                    for index in 0 ..< 10 {
                        self.arrayList.append(index)
                    }
                    
                    self.attrs.stopRefresh()
                })
            }).padding(.top, 10)
        }.navigationBarTitle("", displayMode: .inline)
            .background(Color.init(hex: ui_bgs))
    }
}

