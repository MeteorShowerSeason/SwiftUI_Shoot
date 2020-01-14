//
//  ImgInfo.swift
//  SJShoot
//
//  Created by Solo on 2020/1/9.
//  Copyright © 2020 limo. All rights reserved.
//

import Foundation
import Photos

struct ImgDateModel {
    var id: UUID = UUID()
    var createTime: String
    var checkAll: Bool = false
    var arrays: [ImageInfo] = []
    
    func itemCount() -> Int {
        return arrays.count
    }
    
    func itemResult() -> Int {
        return self.itemCount()/3 * 3
    }
    
    //更新全选状态
   public mutating func updateCheckAll(check: Bool){
        
        print("updateCheckAll: \(check)")
    
//        for var item: ImageInfo in self.arrays {
//            item.updateChecked(check: check)
//        }
    
        for i in self.arrays.indices {
            self.arrays[i].checked = check
        }
    
//    self.arrays.map({ (item) -> ImageInfo in
//
//        var value = item
//        value.updateChecked(check: check)
//        return value
//    })
     
        for value: ImageInfo in self.arrays{
            print("update All : \(value.checked)")
        }
    }
    
//    mutating func updateItemCheck(index: Int){
//        if self.arrays.count > index {
//            let item = self.arrays[index]
//            print("update before : \(item.checked)")
//            item.updateChecked(check: !item.checked)
//            print("update over : \(item.checked)")
//        }
//        
//        self.checkAll = self.arrays.count == getCheckCount()
//    }
    
    //获取选中总数
    func getCheckCount() -> Int{
        var count = 0
        for item: ImageInfo in self.arrays {
            if item.checked {
                count += 1
            }
        }
        return count
    }
}

struct ImageInfo {
    var id: UUID = UUID()
    var asset: PHAsset
    var checked: Bool = false
    var imageTime: String
    
   public mutating func updateChecked(check: Bool){
        print("update before : \(self.checked)")
        self.checked = check
        print("update over : \(self.checked)")
    }
}
