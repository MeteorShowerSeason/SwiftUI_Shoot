//
//  AlbumUtils.swift
//  SJShoot
//
//  Created by limo on 2019/12/25.
//  Copyright © 2019 limo. All rights reserved.
//

import SwiftUI
import Photos

class AlbumUtils {
    
    func getAllPhotos() -> PHFetchResult<PHAsset> {
        //获取所有资源
        let allPhototsOptions = PHFetchOptions()
        //按照创建时间倒序排列
        allPhototsOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        //只获取图片
        allPhototsOptions.predicate = NSPredicate(format: "mediaType=%d", PHAssetMediaType.image.rawValue)

        //取得的资源结果，用于存放PHAsset
        let assetsFetchResults = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: allPhototsOptions)
        
        self.resetCacheAssets()
        
        return assetsFetchResults
    }
    
    //重置缓存
    func resetCacheAssets(){
        //初始化和重置缓存
//        var imageManager = PHCachingImageManager()
        PHCachingImageManager().stopCachingImagesForAllAssets()
    }
}

extension PHAsset {
    
    func getUIImage(colWidth: CGFloat, colHeight: CGFloat, contentMode: PHImageContentMode) -> UIImage {
        var thumbnail = UIImage()
        let options: PHImageRequestOptions = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.isSynchronous = true
        
        let imageManager = PHCachingImageManager()
        
        imageManager.requestImage(for: self, targetSize: CGSize(width: colWidth, height: colHeight), contentMode: contentMode, options: options, resultHandler: {
            image, info in
            if image != nil {
                thumbnail = image!
            }
        })
        
        return thumbnail
    }
    
    func getUIImage(contentMode: PHImageContentMode) -> UIImage {
        var thumbnail = UIImage()
        let options: PHImageRequestOptions = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.isSynchronous = true
        
        let imageManager = PHCachingImageManager()
        
        imageManager.requestImage(for: self, targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight), contentMode: contentMode, options: options, resultHandler: {
            image, info in
            if image != nil {
                thumbnail = image!
            }
        })
        
//        thumbnail.imageWidthColor(tintColor: uiColor_44558f)
        
        return thumbnail
    }
}
