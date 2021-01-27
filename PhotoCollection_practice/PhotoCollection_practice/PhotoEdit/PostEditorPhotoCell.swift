//
//  PostEditorPhotoCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/27.
//

import Foundation
import UIKit
import SnapKit
import Photos

protocol PostEditorPhotoCellDelegate : class {
    func deletePhotoCell(_ sender: PostEditorPhotoCell)
    func editPhotoCell(_ sender: PostEditorPhotoCell)
}

class PostEditorPhotoCell : BaseCell {
    var content : PostContent? {
        didSet{
            
        }
    }
    var representedAssetIdentifier : String?
    weak var delegate : PostEditorPhotoCellDelegate?
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
    let editPhotoButton : UIButton = {
        let b = UIButton()
        let image = UIImage(named: "edit")?.withRenderingMode(.alwaysTemplate)
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
        addSubview(editPhotoButton)
        addSubview(deletePhotoButton)
        editPhotoButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-10)
            make.trailing.equalTo(self).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        deletePhotoButton.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        editPhotoButton.addTarget(self, action: #selector(editAction), for: UIControl.Event.touchUpInside)
        deletePhotoButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
    }
    @objc func editAction(_ sender: UIButton){
        delegate?.editPhotoCell(self)
    }
    @objc func deleteAction(_ sender: UIButton){
        delegate?.deletePhotoCell(self)
    }
    
}
