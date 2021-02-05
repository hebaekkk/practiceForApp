//
//  MyBaseCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/05.
//

import UIKit

class MyBaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
}
