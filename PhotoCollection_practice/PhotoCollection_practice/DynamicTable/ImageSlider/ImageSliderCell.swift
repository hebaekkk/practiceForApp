//
//  ImageSliderCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/09.
//

import UIKit

class ImageSliderCell: UICollectionViewCell {
    static let identifier = "ImageSliderCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "star.fill")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints{ make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            
        }
   
    }
}
