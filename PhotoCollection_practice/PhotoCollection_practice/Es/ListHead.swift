//
//  ListHead.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/17.
//

import UIKit

class ListHead: UICollectionViewListCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("ERROR AT LIST HEAD! ")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
    }
    

}
