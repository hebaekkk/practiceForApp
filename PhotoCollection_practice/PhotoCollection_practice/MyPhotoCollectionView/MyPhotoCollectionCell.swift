//
//  MyPhotoCollectionCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/27.
//

import Foundation
import UIKit
import SnapKit
import Photos
//참고
//class BaseCell : UICollectionViewCell {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    func setupViews() {
//
//    }
//}

class MyPostPhotoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    func setupViews() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
}

class MyPostPhotoCollectionViewCell: MyPostPhotoCell {
    var content: PostContent? {
        didSet {
            
        }
    }
    var representedAssetIdentifier: String?
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    override func setupViews() {
        super.setupViews()
        addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self)
        }
    }
}
