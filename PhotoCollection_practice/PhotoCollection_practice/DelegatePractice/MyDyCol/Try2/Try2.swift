//
//  Try2.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/05.
//

import UIKit

class Try2: UICollectionView {
    
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
    
    override var intrinsicContentSize: CGSize{
        return contentSize
    }

}
