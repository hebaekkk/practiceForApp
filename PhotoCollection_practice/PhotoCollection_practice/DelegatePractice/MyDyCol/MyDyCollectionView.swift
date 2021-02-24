//
//  MyDyCollectionView.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/24.
//

import UIKit

class MyDyCollectionView: UICollectionView {

    var isDynamicSizeRequired = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            if self.intrinsicContentSize.height > frame.size.height {
                self.invalidateIntrinsicContentSize()
            }
            if isDynamicSizeRequired {
                self.invalidateIntrinsicContentSize()
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
