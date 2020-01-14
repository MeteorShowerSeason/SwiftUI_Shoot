//
//  NetImageView.swift
//  SJShoot
//
//  Created by limo on 2019/12/26.
//  Copyright © 2019 limo. All rights reserved.
// Image 的图片异步加载
//.renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))//在Button嵌套中保持本色

import SwiftUI
import KingfisherSwiftUI
import UIKit


//矩形图片
struct BigImage: View {
    
    @State var attrs: ImageAttr
    
    var body: some View {
            KFImage(URL(string: self.attrs.url)!)
                .onFailure(perform: {
                    _ in
                    Image(self.attrs.placeholder)
                })
                .placeholder({
                    Image(self.attrs.placeholder)
                })
                .renderingMode(.original)//在Button嵌套中保持本色
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: self.attrs.width)
                .cornerRadius(self.attrs.cornerRadius)
                .shadow(radius: self.attrs.radius)
    }
}

//矩形图片
struct RectImage: View {
    
    @State var attrs: ImageAttr
    
    var body: some View {
        VStack{
            KFImage(URL(string: self.attrs.url)!)
                .onFailure(perform: {
                    _ in
                    Image(self.attrs.placeholder).resizable().frame(width: self.attrs.width, height: self.attrs.height)
                })
                .placeholder({
                    Image(self.attrs.placeholder).resizable().frame(width: self.attrs.width, height: self.attrs.height)
                })
                .renderingMode(.original)//在Button嵌套中保持本色
                .resizable()
                .frame(width: self.attrs.width, height: self.attrs.height)
                .cornerRadius(self.attrs.cornerRadius)
                .shadow(radius: self.attrs.radius)
        }
    }
}

//圆形图片
struct CircleImage: View {
    
    @State var attrs: ImageAttr
    
    var body: some View {
        VStack {
            KFImage(URL(string: self.attrs.url)!)
                .onFailure(perform: {
                    e in
                    print("\(e)")
                    Image(self.attrs.placeholder).resizable().frame(width: self.attrs.width, height: self.attrs.width)
                })
                .placeholder({
                    Image(self.attrs.placeholder).resizable().frame(width: self.attrs.width, height: self.attrs.width)
                })
                .renderingMode(.original)//在Button嵌套中保持本色
                .resizable()
                .frame(width: self.attrs.width, height: self.attrs.width)
                .clipShape(Circle())
                .shadow(radius: self.attrs.radius)
        }
    }
}

struct ImageAttr {
    var url: String
    var width: CGFloat = 30
    var height: CGFloat = 30
    var placeholder: String = "default_rect"
    var cornerRadius: CGFloat = 0.0
    var radius: CGFloat = 0
}

extension UIImage {
    
    func imageWidthColor(tintColor: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context.clip(to: rect, mask: self.cgImage!)
        tintColor.setFill()
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
