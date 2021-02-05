//
//  BaseCollectionViewCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/02.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        self.setupViews()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViews()
        
    }
    
    func setupViews(){
        
    }
}
