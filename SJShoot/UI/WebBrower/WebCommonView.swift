//
//  WebCommonView.swift
//  SJShoot
//
//  Created by limo on 2019/12/19.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI
import WebKit

struct WebCommonView: View {
    
    @State var url: String
    @State var title: String
    @Binding var showFlag: Bool
    
    var body: some View {
            VStack {
                HStack {
                    
                    Button(action: {
                        self.showFlag = false
                    }, label: {
                        Image("nav_back")
                            .renderingMode(.original)
                            .frame(width: 40, height: 40)
                    })

                    Spacer()

                    Text(title).font(.system(size: 18))

                    Spacer()

                    Text("    ").frame(width: 40, height: 40)
//                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                }
                
                
                WebView(url: url)
            }
    }
        
}

//struct WebCommonView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebCommonView(url: "https://www.toutiao.com/", title: "标题")
//        .previewDevice("iPhone X")
//    }
//}
