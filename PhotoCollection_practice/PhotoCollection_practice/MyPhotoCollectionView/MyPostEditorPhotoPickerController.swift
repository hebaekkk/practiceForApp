//
//  MyPostEditorPhotoPickerController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/05.
//

import Foundation
import UIKit
import SnapKit
import Photos

protocol MyPostEditorPickerControllerDelegate: class {
    func postEditorPhotoPickerController(_ picker: MyPostEditorPhotoPickerController, didFinishPickingContents contents: [MyPostContent]?)
}

class MyPostEditorPhotoPickerController: UIViewController {
    weak var delegate: MyPostEditorPickerControllerDelegate?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        //cv.dataSource = self
        //cv.delegate = self
        cv.allowsMultipleSelection = true
        return cv
    }()
    
    let imageManager = PHCachingImageManager()
    var contents: [MyPostContent]?
    var photoSelectedPostContents: [MyPostContent]?
    let cellId = "cellId"
    
    func grabPhotos() {
        DispatchQueue.global(qos: .background).async {
            let fetchOptions = PHFetchOptions()
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = true
            requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.fastFormat
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            
            let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
            self.contents = [MyPostContent]()
            
            if fetchResult.count > 0 {
                for i in 0..<fetchResult.count {
                    let asset = fetchResult.object(at: i)
                    print(asset)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupViews()
        //setUpNavigationBar()
        //grabPhotos()
    }
    
    func setupViews() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        
        collectionView.register(MyPostEditorPhotoCell.self, forCellWithReuseIdentifier: MyPostEditorPhotoCell.identifier)
        
    }
    
    func setUpNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = "사진"
        let dissmissionButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(actionDismiss))
        self.navigationItem.leftBarButtonItem = dissmissionButton
        
        let okButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(actionFinish))
        self.navigationItem.rightBarButtonItem = okButton
        
    }
    @objc func actionDismiss(_ sender : Any){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func actionFinish(_ sender: Any) {
        let indexPath = collectionView.indexPathsForSelectedItems
        var pickingContents = [MyPostContent]()
        indexPath?.forEach({ (indexPath) in
            if let content = contents?[indexPath.item]{
                pickingContents.append(content)
            }
        })
        
        self.delegate?.postEditorPhotoPickerController(self, didFinishPickingContents: pickingContents)
    }
    
}

extension MyPostEditorPhotoPickerController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
}
extension MyPostEditorPhotoPickerController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPostEditorPhotoCell.identifier, for: indexPath) as! MyPostEditorPhotoCell
        
        if let content = contents?[indexPath.item], let asset = content.asset {
            cell.po
        }
    }
}
