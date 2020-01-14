//
//  Toast.swift
//  SJShoot
//
//  Created by limo on 2019/12/30.
//  Copyright © 2019 limo. All rights reserved.
//
// Toast 提醒

import SwiftUI

struct Toast<Content: View>: View {
    
    let content: () -> Content
    @Binding var attr: ToastAttr
    
    var body: some View {
        if self.attr.isShowing {
            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                self.attr.isShowing = false
            })
        }
        return GeometryReader { geometry in
            
            ZStack(alignment: .center) {
                
                self.content().blur(radius: self.attr.isShowing ? 1 : 0)
                
                VStack {
                    Text(self.attr.message)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .fixedSize(horizontal: self.attr.height > 36.0 ? false : true,
                                   vertical: self.attr.height > 36.0 ? true : false)
                        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                }.frame(width: self.attr.width, height: self.attr.height)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                    .transition(.slide)
                    .opacity(self.attr.isShowing ? 1 : 0)
            }
        }
    }
}

//计算width
func mathWidth(width: CGFloat, text: String) -> CGFloat {
    
    let length = text.count
    let textWdith = CGFloat(length) * 14.0
    
    let maxWidth = width - 100.0;
    
    if textWdith > maxWidth {
        return maxWidth + 30.0
    } else {
        return textWdith + 30.0
    }
}

//计算height
func mathHeight(width: CGFloat, text: String) -> CGFloat{
    let length = text.count
    
    let maxWidth = width - 100.0;
    
    var line: Int = 1
    
    let maxCountLine = Int(maxWidth/14.0)
    
    if length > maxCountLine {
        let yu = length % maxCountLine
        line = Int(length / maxCountLine)
        if yu > 0 {
            line += 1
        }
    }
    
    return CGFloat(line) * 16.0 + 20.0
}

extension View {
    
    func toast(attr: Binding<ToastAttr>) -> some View {
        Toast(content: {
            self
        }, attr: attr)
    }
}

struct ToastAttr {
    var isShowing: Bool = false
    var message: String = " " {
        willSet(axis) {
            self.width = mathWidth(width: UIScreen.main.bounds.width, text: axis)
            self.height = mathHeight(width: UIScreen.main.bounds.width, text: axis)
            print("width: \(width) ** height: \(height)")
        }
    }
    
    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
}
