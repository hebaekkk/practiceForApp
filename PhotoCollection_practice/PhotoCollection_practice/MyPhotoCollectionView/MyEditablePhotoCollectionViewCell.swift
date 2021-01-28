//
//  MyEditablePhotoCollectionViewCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/28.
//

import UIKit
protocol MyEditPhotoCellDelegate: class {
    func deletePhotoCell(_sender: MyEditablePhotoCollectionViewCell)
}

class MyEditablePhotoCollectionViewCell: BaseCell {
    var content: PostContent? {
        didSet {
            
        }
    }
    var representedAssetIdentifier: String?
    weak var delegate: MyEditPhotoCellDelegate?
    
    let thumbnailImageView : UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "dora")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    let deletePhotoButton : UIButton = {
        let b = UIButton()
        let image = UIImage(named: "clear")?.withRenderingMode(.alwaysTemplate)
        b.tintColor = UIColor.white
        b.setImage(image, for: UIControl.State.normal)
        b.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        b.layer.cornerRadius = 15
        b.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        return b
    }()
    
    override func setupViews() {
        addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.bottom.equalTo(self)
            make.trailing.equalTo(self)
        }
        addSubview(deletePhotoButton)

        deletePhotoButton.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }

        deletePhotoButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
    }

    @objc func deleteAction(_ sender: UIButton){
        delegate?.deletePhotoCell(_sender: self)
    }
}
