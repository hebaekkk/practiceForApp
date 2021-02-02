//
//  DynmicHeightCollectionView.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/02.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {
    
    var isDynamcSizeRequired = false
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {//사이즈가 같지 않다면 괄호 안으로 들어간다
            if self.intrinsicContentSize.height > frame.size.height {
                //Call this when something changes in your custom view that invalidates its intrinsic content size. This allows the constraint-based layout system to take the new intrinsic content size into account in its next layout pass.
                self.invalidateIntrinsicContentSize()
            }
            if isDynamcSizeRequired {
                self.invalidateIntrinsicContentSize()
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
