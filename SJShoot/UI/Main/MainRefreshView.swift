//
//  MainRefreshView.swift
//  SJShoot
//
//  Created by Solo on 2020/1/9.
//  Copyright © 2020 limo. All rights reserved.
//

import SwiftUI
import Photos

struct MainRefreshView: View {
    
    //取得的资源结果，用于存放PHAsset
    //    @State var assets = [ImageInfo]()
    
    @State var arrayDates: [ImgDateModel] = [] //日期数组
    
    let albumHelper: AlbumUtils = AlbumUtils()
    
    @State var refreshAttr = autoRefreshAttr
    
    @State var checkCount: Int = 0 //选中总数
    
    var body: some View {
        VStack(spacing: 0) {
            
//            RefreshGridStack(columns: 3, refreshAttr: self.$refreshAttr, arrayList: self.$arrayDates, content: { index, width, info in
//
//                MainItemView(columns: 3, index: index, width: width, info: info, content: { position, itemWidth, imgInfo, checkAll in
//
//                    AlbumItemView(itemWidth: itemWidth, info: imgInfo, index: position, count: self.$checkCount, checkAll: checkAll)
//                })
//            }, onRefresh: {
//                PHPhotoLibrary.requestAuthorization({
//                    (status) in
//                    if status != .authorized {
//                        return
//                    }
//
//                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//                        print("加载相册内容中...")
//                        let assetsFetchResults = self.albumHelper.getAllPhotos()
//
//                        var dateTime: String = ""
//                        var itemInfo: ImageDateInfo?
//                        var imageTime: String = ""
//
//                        assetsFetchResults.enumerateObjects({
//                            (asset, index, stop) in
//
//                            let date = asset.creationDate
//                            if date != nil {
//                                let dateFormatter = DateFormatter()
//                                dateFormatter.dateFormat = "yyyy-MM-dd"
//                                imageTime = dateFormatter.string(from: date!)
//                            }
//
//                            let item = ImageInfo(asset: asset, imageTime: imageTime)
//
//                            if dateTime == imageTime && !dateTime.isEmpty{
//                                itemInfo!.arrays.append(item)
//                            } else {
//                                if !dateTime.isEmpty {
//                                    self.arrayDates.append(itemInfo!)
//                                    //                                            print("\(dateTime) ** \(itemInfo!.arrays.count)")
//                                }
//                                dateTime = imageTime
//                                itemInfo = ImageDateInfo(createTime: dateTime)
//                                itemInfo!.arrays.append(item)
//                            }
//                        })
//
//                        //添加末尾日期
//                        if itemInfo != nil {
//                            self.arrayDates.append(itemInfo!)
//                        }
//
//                        //                            self.loadStatus.isShowing = false
//                        print("加载相册内容完毕!!!")
//                        self.refreshAttr.stopRefresh()
//                    }
//                })
//            }).padding(EdgeInsets(top: 10, leading: 13, bottom: 0, trailing: 13))
//
            
            MainBottomView(checkCount: self.$checkCount)
        }
        .navigationBarTitle("刷新测试", displayMode: .inline)
    }
}
