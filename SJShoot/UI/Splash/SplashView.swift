//
//  SplashView.swift
//  SJShoot
//
//  Created by limo on 2019/12/19.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI
import UIKit

struct SplashView: View {
    
    @Binding var viewState: ContentState
    var isLogin = UserDefaults.standard.bool(forKey: "isLogin")
    
    func delayExecution(){
        self.viewState = ContentState.STATE_LOGIN
    }

    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Spacer()
                Image("logo").renderingMode(.original)
                
                Text("轻松赚到零花钱").font(.subheadline).padding()
                
                Spacer()
                Spacer()
                Text("始记云盘出品")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    
                    
                Text("").onAppear(perform: {
                  if self.isLogin {
                        var loginAttr = LoginAttr()
                        loginAttr.account = UserDefaults.standard.string(forKey: "account")!
                        
                        LoginRequest(requestLogin: {
                            json in
                            
                        }, failture: {(baseResponse) in
                            self.viewState = ContentState.STATE_LOGIN
                            print("fail : \(baseResponse.msg) ** code： \(baseResponse.code)")
                        })
                        .setLoginAttr(loginAttr: loginAttr)
                        .setType(type: LoginRequest.LOGIN_TOKEN_TYPE)
                        .executePost()
                    } else {
                        print("Timer is Starting ")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                   self.delayExecution()
                        }
                    }
                })
                
            }
        }
    }
}
