//
//  MyContents.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/05.
//

import Foundation
import Photos
import UIKit

enum MyPostContentType {
    case asset
    case image
}

class MyPostContent : NSObject {
    var asset : PHAsset?
    var selectedNumber : Int?
    var image : UIImage?
    let type : PostContentType
    init(type : PostContentType) {
        self.type = type
    }
}

