//
//  ImageUtils.swift
//  SJShoot
//
//  Created by MeteorShower on 2019/12/29.
//  Copyright © 2019 limo. All rights reserved.
//
// 扩展Images

import SwiftUI

extension Image {
   init(_ name: String, defaultImage: String) {
       if let img = UIImage(named: name) {
           self.init(uiImage: img)
       } else {
           self.init(defaultImage)
       }
   }
   
   init(_ name: String, defaultSystemImage: String) {
       if let img = UIImage(named: name) {
           self.init(uiImage: img)
       } else {
           self.init(systemName: defaultSystemImage)
       }
   }
}
