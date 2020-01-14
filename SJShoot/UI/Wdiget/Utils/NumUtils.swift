//
//  NumUtils.swift
//  SJShoot
//
//  Created by Solo on 2020/1/13.
//  Copyright © 2020 limo. All rights reserved.
//

import Foundation
import SwiftUI

extension CGFloat {
    
    init(_ text: String) {
        
        if text.isEmpty {
            self = 0.0
            return
        }
        
        guard let number = Double(text) else {
            self = 0.0
            return
        }
        
        self = CGFloat(number)
    }
}
