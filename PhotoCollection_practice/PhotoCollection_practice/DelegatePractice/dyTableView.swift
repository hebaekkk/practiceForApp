//
//  dyTableView.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/23.
//

import UIKit

class dyTableView: UITableView {

    var isDynamicSizeRequried = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            if self.intrinsicContentSize.height > frame.size.height {
                self.invalidateIntrinsicContentSize()
            }
            if isDynamicSizeRequried {
                self.invalidateIntrinsicContentSize()
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }

}
