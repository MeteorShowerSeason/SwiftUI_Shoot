//
//  PriceFavourView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/13.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct PriceFavourView: View {
    
    @State var count: Int
    
    @State var showSetFavour: Bool = false
    
    @Binding var showing: Bool
    @State var price: String = ""
    
    var setPrice: (_ price: String) -> ()
    
    var setFavour: (String, Int, CGFloat) -> ()
    
    var body: some View {
        NavigationView{
            VStack{
                if !self.showSetFavour{
                    ModifyPriceView(count: self.count, showFavour: self.$showSetFavour, price: self.$price, onEnter: { price in
                        self.setPrice(price)
                    })
                } else {
                    SetFavourableView(showing: self.$showing, onFavour: { num, cut in
                        self.setFavour(self.price, num, cut)
                    })
                }
            }
            .navigationBarTitle(self.showSetFavour ? "设置优惠" : "设置单价")
        }.onTapGesture {
            dissmissKeyboard()
        }
    }
}
