//
//  MyPostEditorPhotoCollectionView.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/29.
//

import Foundation
import UIKit
import SnapKit
import Photos

class MyPostEditorPhotoCollectionView : BaseCell, UICollectionViewDelegateFlowLayout {
    let cellid = "cellId"
    var contents : [PostContent]?
    let imageManager = PHCachingImageManager()
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
       // cv.dataSource = self
        cv.delegate = self
        cv.showsHorizontalScrollIndicator = false
//        cv.isPagingEnabled = true
        return cv
    }()
    override func setupViews() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.trailing.equalTo(self)
            make.leading.equalTo(self)
            make.bottom.equalTo(self)
        }
        collectionView.register(MyPostEditorPhotoCell.self, forCellWithReuseIdentifier: cellid)
    }
}

extension MyPostEditorPhotoCollectionView {
    func grabPhotos(){
        DispatchQueue.global(qos: .background).async {
            let fetchOptions = PHFetchOptions()
            fetchOptions.fetchLimit = 10
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = true
            requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.fastFormat
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]

            let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
            self.contents = [PostContent]()
            if fetchResult.count > 0 {
                for i in 0..<fetchResult.count {
                    let asset = fetchResult.object(at: i)
                    let postContent = PostContent(type : .asset)
                    postContent.asset = asset
                    self.contents?.append(postContent)
                }
            }

            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}


