//
//  MyPostEditPhotoCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/05.
//

import Foundation
import UIKit
import Photos
import SnapKit

protocol MyEditPhotoProtocol: NSObjectProtocol {
    func editPhoto(postContent: MyPostContent?) -> Void
}

class MyPostEditPostCell: BaseCell {
    override var isSelected: Bool {
        didSet{
            
        }
    }
    weak var delegate: MyEditPhotoProtocol?
    var postContent: MyPostContent? {
        didSet {
            
        }
    }
    var selectedNumber: Int? {
        willSet(newVal) {
            //
        }
    }
    
    let editButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "edit")?.withRenderingMode(.alwaysTemplate)
        button.tintColor = UIColor.white
        button.setImage(image, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.isHidden = true
        return button
    }()
    
    @objc func editPhotoAction(sender: UIButton) {
        delegate?.editPhoto(postContent: self.postContent)
    }
    let blackView: UIView = {
        let v = UIView()
        v.layer.backgroundColor = UIColor.black.cgColor
        v.layer.opacity = 0
        return v
    }()
    
    let photoCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.layer.cornerRadius = 30 / 2
        label.layer.masksToBounds = true
        label.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    var representedAssetIdentifier: String?
    let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "land")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).cgColor
        return iv
    }()
    
    override func setupViews() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.bottom.equalTo(self)
        }
        photoImageView.addSubview(blackView)
        blackView.snp.makeConstraints{ (make) in
            make.top.equalTo(photoImageView)
            make.leading.equalTo(photoImageView)
            make.trailing.equalTo(photoImageView)
            make.bottom.equalTo(photoImageView)
        }
        addSubview(photoCountLabel)
        photoCountLabel.snp.makeConstraints{ (make) in
            make.center.equalTo(self)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        addSubview(editButton)
        editButton.snp.makeConstraints{ (make) in
            make.trailing.equalTo(self)
            make.bottom.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        editButton.addTarget(self, action: #selector(editPhotoAction), for: .touchUpInside)
    }
}

class MyPostCell: BaseCell, UICollectionViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegate {
    static let identifier = "MyPostCell"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        cv.allowsMultipleSelection = true
        return cv
    }()
    
    let imageManager = PHCachingImageManager()
    var contents: [MyPostContent]?
    weak var delegate = MyEditPhotoProtocol?
    
    func checkPhotoLibraryPermission() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            
        case .restricted, .denied:
            
        case .notDetermined:
        }
    }
    
    func grabPhotos() {
        DispatchQueue.global(qos: .background).async {
            print("background")
        }
    }
    
}

