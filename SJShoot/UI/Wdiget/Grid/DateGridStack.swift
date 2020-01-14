////
////  DateGridStack.swift
////  SJShoot
////
////  Created by Solo on 2020/1/8.
////  Copyright © 2020 limo. All rights reserved.
////
//
//import SwiftUI
//
////@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//struct DateGridStack<Content, ItemView>: View where Content: View, ItemView: View {
//    // The number of columns we want to display
//    var columns: Int
//    
//    public let titleContent: (Int, ImageDateInfo) -> Content
//    
//    public let itemContent: (Int, CGFloat, ImageInfo) -> ItemView
//    
//    @Binding var arrayList: [ImageDateInfo]
//    
//    public init(
//        columns: Int,
//        arrayList: Binding<[ImageDateInfo]>,
//        @ViewBuilder titleContent: @escaping (Int, ImageDateInfo) -> Content,
//                     @ViewBuilder itemContent: @escaping (Int, CGFloat, ImageInfo) -> ItemView) {
//        
//        self.columns = columns
//        self._arrayList = arrayList
//        self.titleContent = titleContent
//        self.itemContent = itemContent
//    }
//    
//    public var body : some View {
//        
//        GeometryReader {  geometry -> GridContentView<Content, ItemView> in
//            
//            return GridContentView(
//                columns: self.columns,
//                itemWidth: geometry.size.width/CGFloat(self.columns),
//                titleContent: self.titleContent,
//                itemContent: self.itemContent,
//                arrayList: self.$arrayList
//            )
//        }
//        
//    }
//}
//
//struct GridContentView<Content: View, ItemView: View>: View {
//    
//    @State var columns: Int
//    @State var itemWidth: CGFloat
//    
//    public let titleContent: (Int, ImageDateInfo) -> Content
//    
//    public let itemContent: (Int, CGFloat, ImageInfo) -> ItemView
//    
//    @Binding var arrayList: [ImageDateInfo]
//    
//    var body: some View {
//        ScrollView(Axis.Set.vertical) {
//            
//            ForEach(0 ..< self.arrayList.count, id: \.self) { index in
//                
//                GridItemView(
//                    attrs: GridItemAttr(
//                        index: index,
//                        columns: self.columns,
//                        itemWidth: self.itemWidth,
//                        numItems: self.arrayList[index].itemCount(),
//                        result: self.arrayList[index].itemResult()),
//                    itemInfo: self.$arrayList[index],
//                    titleContent: self.titleContent,
//                    itemContent: self.itemContent
//                )
//            }
//        }
//    }
//}
//
//struct GridItemView<Content: View, ItemView: View>: View {
//    
//    @State var attrs: GridItemAttr
//    
//    @Binding var itemInfo: ImageDateInfo
//    
//    public let titleContent: (Int, ImageDateInfo) -> Content
//    
//    public let itemContent: (Int, CGFloat, ImageInfo) -> ItemView
//    
//    
//    init(attrs: GridItemAttr,
//         itemInfo: Binding<ImageDateInfo>,
//         @ViewBuilder titleContent: @escaping (Int, ImageDateInfo) -> Content,
//         @ViewBuilder itemContent: @escaping (Int, CGFloat, ImageInfo) -> ItemView){
//        
//        self.attrs = attrs
//        self._itemInfo = itemInfo
//        self.titleContent = titleContent
//        self.itemContent = itemContent
//    }
//    
//    var body: some View {
//        
//       VStack(spacing: 0) {
//            
//            self.titleContent(self.attrs.index, self.itemInfo)
//            
//            ForEach(0 ..< (self.attrs.numItems / self.attrs.columns), id: \.self) { row in
//                
//                // HStacks are our columns
//                HStack(spacing: 0) {
//                    ForEach(0 ... (self.attrs.columns - 1), id: \.self) { column in
//                        
//                        self.itemContent(
//                            (row * self.attrs.columns) + column,
//                            (self.attrs.itemWidth),
//                            self.itemInfo.arrays[(row * self.attrs.columns) + column]
//                        )
//                            .frame(width: self.attrs.itemWidth)
//                    }
//                }
//            }
//            
//            HStack(spacing: 0) {
//                ForEach(0 ..< (self.attrs.numItems % self.attrs.columns)) { column in
//                    
//                    self.itemContent(self.attrs.result + column,
//                                     self.attrs.itemWidth,
//                                     self.itemInfo.arrays[self.attrs.result + column])
//                        .frame(width: self.attrs.itemWidth)
//                }
//            }
//            
//        }
//    }
//}
//
//struct GridItemAttr {
//    var index: Int
//    var columns: Int
//    var itemWidth: CGFloat
//    var numItems: Int
//    var result: Int
//}
