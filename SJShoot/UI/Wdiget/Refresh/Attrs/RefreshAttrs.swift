//
//  RefreshAttrs.swift
//  SJShoot
//
//  Created by Solo on 2020/1/6.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI

struct RefreshAttrs {
    
    var offsetY: CGFloat = 0.0
    var dragType: DragDirection = DragDirection.NORMAL //拖动类型
    var refreshText: String = ""
    var loading: Bool = false
    
    var dragY: CGFloat = 0.0 {
        willSet(newValue) {
            
            switch dragType {
            case .NORMAL:
                if self.dragY < newValue && self.dragY > 0.0{
                    if self.dragType != DragDirection.PULL_DOWN {
                        self.dragType = DragDirection.PULL_DOWN
                        self.refreshText = "下拉刷新"
//                        print("pull normal pullDown: \(self.dragType == .PULL_DOWN) ** pullUP: \(self.dragType == .PULL_UP) ** refresh: \(self.dragType == .PULL_REFRESH)")
                    }
                }
            case .PULL_DOWN:
                if(self.dragY > 100.0) {
                    if self.dragType != DragDirection.PULL_UP {
                        self.dragType = DragDirection.PULL_UP
                        self.refreshText = "松开刷新"
//                        print("pull down pullDown: \(self.dragType == .PULL_DOWN) ** pullUP: \(self.dragType == .PULL_UP) ** refresh: \(self.dragType == .PULL_REFRESH)")
                    }
                }
            case .PULL_UP:
                if self.dragY > newValue && self.dragY < 100 {
                    self.startRefresh()
                    
//                    print("pull up pullDown: \(self.dragType == .PULL_DOWN) ** pullUP: \(self.dragType == .PULL_UP) ** refresh: \(self.dragType == .PULL_REFRESH)")
                }
            default:
                return
            }
        }
    }
    
    public mutating func startRefresh(){
        self.refreshText = "正在刷新..."
        self.loading = true
        self.dragType = .PULL_REFRESH
        self.offsetY = 0.0
    }
    
    public mutating func stopRefresh() {
        self.dragType = .NORMAL
        self.offsetY = -50.0
        self.refreshText = ""
        self.loading = false
    }
}

enum DragDirection {
    case PULL_DOWN
    case PULL_UP
    case PULL_REFRESH
    case NORMAL
}

//自动刷新 参数
let autoRefreshAttr : RefreshAttrs = RefreshAttrs(offsetY: 0.0, dragType: .PULL_REFRESH, refreshText: "正在刷新...", loading: true)
