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
    func editPhoto(postContent: MyPostContent?) -> Void;
}

class MyPostEditPhotoCell: BaseCell {
    override var isSelected: Bool {
        didSet{
            blackView.layer.opacity = isSelected ? 0.5 : 0
            photoImageView.layer.borderWidth = isSelected ? 2 : 0
            photoCountLabel.isHidden = isSelected ? false : true
            editButton.isHidden = isSelected ? false : true
        }
    }
    weak var delegate: MyEditPhotoProtocol?
    var postContent: MyPostContent? {
        didSet {
            
        }
    }
    var selectedNumber: Int? {
        willSet(newVal) {
            photoCountLabel.text = String(newVal ?? 0)
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

//[  ]v이건 어디서 쓰는걸까?
class MyPostCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
    weak var delegate: MyEditPhotoProtocol?
    
    let cellId = "cellId"
    
    func checkPhotoLibraryPermission() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            grabPhotos()
            break
        case .restricted, .denied:
            break
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                switch status {
                case .authorized:
                    break
                case .restricted, .denied:
                    break
                case .notDetermined:
                    break
                case .limited:
                    break
                }
            }
        case .limited:
            print("limited")
            break
        }
    }
    
    func grabPhotos() {
        DispatchQueue.global(qos: .background).async {
            print("background")
            let fetchOptions = PHFetchOptions()//A set of options that affect the filtering, sorting, and management of results that Photos returns when you fetch asset or collection objects.
            
            let smartAlbums = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.smartAlbum,
                                                                      subtype: PHAssetCollectionSubtype.any, options: fetchOptions)
            let imageManager = PHImageManager.default()
            
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = true
            requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.fastFormat
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            
            let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
            self.contents = [MyPostContent]()
            if fetchResult.count > 0 {
                for i in 0..<fetchResult.count {
                    let asset = fetchResult.object(at: i)
                    let postContent = MyPostContent(type: .asset)
                    postContent.asset = asset
                    self.contents?.append(postContent)
                }
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }

    }
    
    override func setupViews() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints{ (make) in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.bottom.equalTo(self)
        }
        collectionView.register(MyPostEditorPhotoCell.self, forCellWithReuseIdentifier: cellId)
        checkPhotoLibraryPermission()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyPostEditPhotoCell
        
        if let content = contents?[indexPath.item], let asset = content.asset {
            cell.postContent = content
            cell.representedAssetIdentifier = asset.localIdentifier
            let targetSize = DeviceInfo.Orientation.isPortrait ? CGSize(width: frame.width/3 - 1, height: frame.width/3 - 1) : CGSize(width: frame.width/6 - 1, height: frame.width/6 - 1)
            imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: nil) { (image, _) in
                if (cell.representedAssetIdentifier == asset.localIdentifier) {
                    cell.photoImageView.image = image
                }
            }
            cell.delegate = self.delegate
            cell.selectedNumber = content.selectedNumber
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layou collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if DeviceInfo.Orientation.isPortrait {
            return CGSize(width: frame.width/3 - 1, height: frame.width/3 - 1)
        } else {
            return CGSize(width: frame.width/6 - 1, height: frame.width/6 - 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let count = collectionView.indexPathsForSelectedItems?.count ?? 0
        if (count >= 8 ) {
            return false
        } else {
            return true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MyPostEditPhotoCell
        let count = collectionView.indexPathsForSelectedItems?.count ?? 0
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        cell.photoImageView.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8)
                       },
                       completion: { bool in
                        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
                            cell.photoImageView.layer.transform = CATransform3DIdentity
                            cell.photoImageView.layer.borderWidth = 3
                            cell.blackView.layer.opacity = 0.5
                        }, completion: nil)
                       })
        if let content = contents?[indexPath.item] {
            content.selectedNumber = count
        }
        cell.selectedNumber = count
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MyPostEditPhotoCell
        
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        cell.photoImageView.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8)
                        
                       }, completion: { bool in
                        UIView.animate(withDuration: 0, delay: 0, options: .curveEaseIn, animations: {
                            cell.photoImageView.layer.transform = CATransform3DIdentity
                            cell.photoImageView.layer.borderWidth = 0
                            cell.blackView.layer.opacity = 0
                        }, completion: nil)
                       })
        
        let indexPaths = collectionView.indexPathsForSelectedItems?.sorted {
            if ( contents?[$0.item].selectedNumber ?? 0 < contents?[$1.item].selectedNumber ?? 0) {
                return true
            } else {
                return false
            }
        }
        
        if let indexPaths = indexPaths {
            for ( index, indexPath) in indexPaths.enumerated() {
                if let cell = collectionView.cellForItem(at: indexPath) as? MyPostEditPhotoCell {
                    cell.selectedNumber = index + 1
                }
                if let content = contents?[indexPath.item] {
                    content.selectedNumber = index + 1
                }
            }
        }
        
    }
    
}

