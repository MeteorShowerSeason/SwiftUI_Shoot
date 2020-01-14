//
//  ContentView.swift
//  SJShoot
//
//  Created by limo on 2019/12/18.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    @State var viewState: ContentState = ContentState.STATE_SPLASH
    
    var body: some View {
        VStack {
            if viewState == ContentState.STATE_LOGIN {
                LoginView(viewState: self.$viewState).transition(.move(edge: .trailing))
            } else if viewState == ContentState.STATE_MAIN {
//                MainView(viewState: self.$viewState).transition(.move(edge: .trailing))
                MainView()
            } else {
                SplashView(viewState: self.$viewState)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone X")
    }
}

public enum ContentState: Int{
    case STATE_SPLASH = 1
    case STATE_LOGIN = 2
    case STATE_MAIN = 3
}

//关闭键盘
func dissmissKeyboard(){
    let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    keyWindow?.endEditing(true)
}
