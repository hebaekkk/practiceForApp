//
//  Contents.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/27.
//

import Foundation
import Photos
import UIKit

enum PostContentType {
    case asset
    case image
}

class PostContent : NSObject {
    var asset : PHAsset?
    var selectedNumber : Int?
    var image : UIImage?
    let type : PostContentType
    init(type : PostContentType) {
        self.type = type
    }
}
