//
//  Detail2View.swift
//  SJShoot
//
//  Created by limo on 2019/12/19.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI

struct Detail2View: View {
    
    var testModel = DetailModel()
    
    var body: some View {
        
        VStack(spacing: 0) {

            NavigationLink(destination: MainDetailView(), label: {
                Text("界面").font(.title).foregroundColor(.black)
            }).padding()
            
            //            .background(Color(UIColor.secondarySystemBackground))
        }.navigationBarTitle("Detail2", displayMode: .inline)
    }
}

struct DetailContentView: View {
    
    @EnvironmentObject var model: DetailModel
    
    var body: some View {
        
//        NavigationView {
            VStack {
                NavigationLink(destination: MainDetailView(), label: {
                    Text("主界面").font(.title).foregroundColor(.black)
                }).padding()
                
                Text(self.model.text).font(.largeTitle).foregroundColor(.black)
            }
//            .navigationBarHidden(true)
//        }
    }
}

class DetailModel: ObservableObject {
    @Published var text: String = "刷新前内容"
}




