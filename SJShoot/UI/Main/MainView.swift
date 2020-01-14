//
//  MainView.swift
//  SJShoot
//
//  Created by limo on 2019/12/19.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI
import Photos

struct MainView: View {
    
    @State var loadStatus: LoadStatus = LoadStatus(isShowing: true)
    
    //取得的资源结果，用于存放PHAsset
    //    @State var assets = [ImageInfo]()
    
    @State var arrayDates: [ImgDateModel] = [] //日期数组
    
    let albumHelper: AlbumUtils = AlbumUtils()
    
    @State var refreshAttr = autoRefreshAttr
    
    @State var checkCount: Int = 0 //选中总数
    
    var body: some View {
        LoadingView(loadStatus: self.$loadStatus){
            NavigationView {
                VStack(spacing: 0) {
                    
                    //                    HStack {
                    //                        Spacer()
                    //                        NavigationLink(destination: MainDetailView(), label: {
                    //                            Image("ic_folder").renderingMode(.original).frame(width: 34, height: 34)
                    //                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 3, trailing: 10))
                    //                        })
                    //                    }
                    
                    if self.arrayDates.count > 0 {
                        
                        GridStack(columns: 3, arrayList: self.$arrayDates, content: { index, width, info in
                            
                            MainItemView(columns: 3, index: index, width: width, info: info, count: self.$checkCount, content: { position, itemWidth, imgInfo, dateInfo in
                                
                                AlbumItemView(itemWidth: itemWidth, info: imgInfo, index: position, count: self.$checkCount, dateInfo: dateInfo)
                            })
                        }).padding(EdgeInsets(top: 10, leading: 13, bottom: 0, trailing: 13))
                    }
                    
                    MainBottomView(checkCount: self.$checkCount)
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(
                    leading:
                    
                    NavigationLink(destination: MineView(), label: {
                        CircleImage(attrs: ImageAttr(url: TEST_AVATAR_URL, width: 36))
                    })
                    , trailing:
                    
                    NavigationLink(destination: ShootListView(), label: {
                        Image("nav_list").resizable().frame(width: 20, height: 20).foregroundColor(.black).padding(8)
                    })
                )
                    .background(NavigationConfigurator{nc in
                        nc.navigationBar.barTintColor = uiColor_ffe495
                        //                    nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
                    })
                    .onAppear(){
                        if self.arrayDates.count > 0 {
                            return
                        }
                        
                        PHPhotoLibrary.requestAuthorization({
                            (status) in
                            if status != .authorized {
                                return
                            }
                            
                            DispatchQueue.main.async {
                                print("加载相册内容中...")
                                let assetsFetchResults = self.albumHelper.getAllPhotos()
                                
                                var dateTime: String = ""
                                var itemInfo: ImgDateModel?
                                var imageTime: String = ""
                                
                                assetsFetchResults.enumerateObjects({
                                    (asset, index, stop) in
                                    
                                    let date = asset.creationDate
                                    if date != nil {
                                        let dateFormatter = DateFormatter()
                                        dateFormatter.dateFormat = "yyyy-MM-dd"
                                        imageTime = dateFormatter.string(from: date!)
                                    }
                                    
                                    let item = ImageInfo(asset: asset, imageTime: imageTime)
                                    
                                    if dateTime == imageTime && !dateTime.isEmpty{
                                        itemInfo!.arrays.append(item)
                                    } else {
                                        if !dateTime.isEmpty {
                                            self.arrayDates.append(itemInfo!)
                                            //                                            print("\(dateTime) ** \(itemInfo!.arrays.count)")
                                        }
                                        dateTime = imageTime
                                        itemInfo = ImgDateModel(createTime: dateTime)
                                        itemInfo!.arrays.append(item)
                                    }
                                })
                                
                                //添加末尾日期
                                if itemInfo != nil {
                                    self.arrayDates.append(itemInfo!)
                                }
                                
                                self.loadStatus.isShowing = false
                                print("加载相册内容完毕!!!")
                                self.refreshAttr.stopRefresh()
                            }
                        })
                }
                
                
            }
        }
    }
}

//                    Rectangle()
//                        .fill(Color.black)
//                        .frame(width: 200, height: 200)
//
//                    RoundedRectangle(cornerRadius: 25, style: .continuous)
//                        .fill(Color.red)
//                        .frame(width: 200, height: 200)
//
//                    Capsule()
//                        .fill(Color.green)
//                        .frame(width: 100, height: 50)
//
//                    Ellipse()
//                        .fill(Color.blue)
//                        .frame(width: 100, height: 50)
//
//                    Circle()
//                        .fill(Color.white)
//                        .frame(width: 100, height: 50)


//@State private var currentPosition: CGSize = .zero
//@State private var newPosition: CGSize = .zero
//                        VStack{
//                            Text("手势拖动").font(.system(size: 18))
//                        }.frame(height: 100)
//                            .background(Color.red)
//                            .offset(x: self.currentPosition.width, y: self.currentPosition.height)
//                            .gesture(DragGesture().onChanged{
//                                value in
//                                self.currentPosition = CGSize(width: .zero, height: value.translation.height + self.newPosition.height)
//                            }.onEnded { value in
//                                self.currentPosition = CGSize(width: .zero, height: value.translation.height + self.newPosition.height)
//                                print(self.newPosition.height)
//                                self.newPosition = self.currentPosition
//                            })


//                                        self.assets.append(item)

//                                        if self.arrayDates.count == 0 {
//                                            var dateItem = ImageDateInfo(createTime: imageTime)
//                                            dateItem.arrays.append(item)
//
//                                            self.arrayDates.append(dateItem)
//                                        } else {
//                                            var dateItem = self.arrayDates.last!
//                                            if dateItem.createTime == imageTime {
//                                                dateItem.arrays.append(item)
//
//                                                print("as \(dateItem.createTime) ** \(dateItem.arrays.count)")
//                                            } else {
//                                                var dateNewItem = ImageDateInfo(createTime: imageTime)
//                                                dateNewItem.arrays.append(item)
//
//                                                self.arrayDates.append(dateNewItem)
//                                            }
//                                        }


