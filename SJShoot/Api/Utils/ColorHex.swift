//
//  ColorHex.swift
//  SJShoot
//
//  Created by limo on 2019/12/18.
//  Copyright © 2019 limo. All rights reserved.

//  十六进制颜色
//

import SwiftUI

let ui_bgs = "F7F8F9"
let line = "E5E5E5"

let color_ffe495 = "FFE495"
let color_eaf2fc = "EAF2FC"
let color_4a4a4a = "4A4A4A"
let color_44558f = "44558F"

let uiColor_ffe495 = UIColor(red: 1.0, green: 0.89, blue: 0.58, alpha: 1.0)
let uiColor_44558f = UIColor(red: 0.27, green: 0.33, blue: 0.56, alpha: 1.0)

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff


        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)

    }
}

//extension UIColor {
//
//    public convenience init?(hex: String){
//
//        let color = "#"+hex
//        print("color: \(color)")
//
//        let r,g,b,a: CGFloat
//
//        if color.hasPrefix("#") {
//            let start = color.index(color.startIndex, offsetBy: 1)
//            let hexColor = String(color[start...])
//
//            print("hexColor: \(hexColor)")
//
//            if hexColor.count == 8 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//                
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    a = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    print("red: \(r) green: \(g) blue: \(b) alpha: \(a)")
//
//                    self.init(red: r, green: g, blue: b, alpha: a)
//
//                    return
//                }
//            }
//        }
//
//        return nil
//    }
//}
