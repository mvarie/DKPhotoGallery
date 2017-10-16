//
//  DKPhotoLocalImagePreviewVC.swift
//  DKPhotoGallery
//
//  Created by ZhangAo on 08/09/2017.
//  Copyright © 2017 ZhangAo. All rights reserved.
//

import UIKit

class DKPhotoLocalImagePreviewVC: DKPhotoBaseImagePreviewVC {

    private var image: UIImage?
    
    // MARK: - DKPhotoBasePreviewDataSource
    
    override func photoPreviewWillAppear() {
        super.photoPreviewWillAppear()
        
        if let image = self.item.image {
            self.image = image
        } else if let URL = self.item.imageURL {
            try! self.image = UIImage(data: Data(contentsOf: URL as URL))
        } else {
            assert(false)
        }
    }
    
    override func hasCache() -> Bool {
        return true
    }
    
    override func fetchContent(withProgressBlock progressBlock: @escaping ((_ progress: Float) -> Void), completeBlock: @escaping ((_ data: Any?, _ error: Error?) -> Void)) {
        completeBlock(self.image, nil)
    }
}
