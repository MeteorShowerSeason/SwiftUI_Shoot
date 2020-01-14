//
//  LoadingView.swift
//  SJShoot
//
//  Created by limo on 2019/12/19.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI
import UIKit

struct LoadingView<Content>: View where Content: View {
    
    @Binding var loadStatus: LoadStatus
    
    var content: () -> Content
//    @State private var chromaShift = false
//    @State private var slide = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                self.content()
                    .disabled(self.loadStatus.isShowing)
                    .blur(radius: self.loadStatus.isShowing ? 3 : 0)
                
                VStack {
                    Button(action: {
                        self.loadStatus.isShowing = false
                    }, label: {
                        HStack{
                            
                            LoadingIndicator(isAnimating: self.$loadStatus.isShowing, style: UIActivityIndicatorView.Style.medium)
                            
                            Text(self.loadStatus.loadText)
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                        }
                    })
                    
                }
                .frame(width: geometry.size.width - 100,
                       height: geometry.size.height / 7)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .opacity(self.loadStatus.isShowing ? 1 : 0)
                
            }
        }
    }
}

struct LoadingIndicator: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<LoadingIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoadingIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct LoadStatus {
    var isShowing: Bool = false
    var loadText: String = "正在加载..."
}

//struct ActivityIndicator: UIViewRepresentable {
//
//    @Binding var shouldAnimate: Bool
//    // Code will go here
//    func makeUIView(context: Context) -> UIActivityIndicatorView {
//        // Create UIActivityIndicatorView
//        return UIActivityIndicatorView()
//    }
//
//    func updateUIView(_ uiView: UIActivityIndicatorView,
//                      context: Context) {
//        // Start and stop UIActivityIndicatorView animation
//        if self.shouldAnimate {
//            uiView.startAnimating()
//        } else {
//            uiView.stopAnimating()
//        }
//    }
//}

//动画效果
//@State private var spin = false
//@State private var fillRect = true
//@State private var rotateRect = false;
////                    ActivityIndicator(isAnimating: .constant(true), style: .large)
//                    Image("logo")
//                        .rotationEffect(.radians(self.spin ? .pi/2 : 0))
//                        .animation(Animation.linear.repeatForever(autoreverses: false).speed(1.0))
//                        .onAppear() {
//                            self.spin.toggle()
//                    }

//                    ZStack {
//                        Rectangle().frame(width:100, height: 150)
//                            .scaleEffect(x: 1, y: self.fillRect ? 0.05 : 1, anchor: .bottom)
//                            .foregroundColor(Color.init(hex: color_ffe495))
//                            .border(Color.init(hex: color_ffe495), width: 5)
//                        .cornerRadius(10)
//                            .onAppear() {
//                                withAnimation(Animation.easeInOut(duration: 2)
//                                    .repeatForever(autoreverses: false)
//                                    .speed(0.5)) {
//                                        self.fillRect.toggle()
//                                }
//                        }
//                    }.rotationEffect(.degrees(self.rotateRect ? 0 : 15), anchor: .bottom)
//                        .animation(Animation
//                            .spring(response: 1, dampingFraction: 0.3, blendDuration: 0)
//                            .repeatForever(autoreverses: false))
//                        .shadow(radius: 0.2)
//                        .scaleEffect(0.5)
//                        .onAppear() {
//                            self.rotateRect.toggle()
//                    }



//                        Rectangle()
//                            .foregroundColor(.white)
//                            .frame(maxWidth: 200, maxHeight: 40)
//                            .rotationEffect(.degrees(0), anchor: .trailing)
//                            .opacity(0.5)
//                            .scaleEffect(x: self.slide ? 0 : 1, y: 1, anchor: .trailing)
//                            .animation(Animation.easeInOut(duration: 4)
//                                .repeatForever(autoreverses: false)
//                                .speed(2))
//                            .onAppear() {
//                                self.slide.toggle()
//                        }
