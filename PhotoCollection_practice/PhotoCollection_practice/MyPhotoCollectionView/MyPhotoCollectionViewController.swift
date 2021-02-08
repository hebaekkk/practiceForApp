//
//  MyPhotoCollectionViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/27.
//

import UIKit
import SnapKit
import Photos

class MyPhotoCollectionViewController: UIViewController {

    @IBAction func picker(_ sender: Any) {
        photoLibraryDidClicked()
    }
    
    
    let cellid = "cellId"
    
    lazy var postEditorPhotoCollectionView : MyPostEditorPhotoCollectionView = {
        let cv = MyPostEditorPhotoCollectionView()
        cv.collectionView.delegate = self
        cv.collectionView.dataSource = self
        return cv
    }()
    
    let imageManager = PHCachingImageManager()
    
    var photoSelectedPostContents: [MyPostContent]?
    func setupViews() {
        view.addSubview(postEditorPhotoCollectionView)
        postEditorPhotoCollectionView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view).offset(64)
            make.trailing.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.height.equalTo(200)
        }
        photoSelectedPostContents = [MyPostContent]()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        setupViews()
        
    }

}

extension MyPhotoCollectionViewController: UICollectionViewDelegate {
    
}
extension MyPhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let content = photoSelectedPostContents?[indexPath.item],
           let asset = content.asset {
            let pixelWidth = asset.pixelWidth
            let pixelHeight = asset.pixelHeight
            //let height: CGFloat = 200 - 20
            let height: CGFloat = 100
            //let width = height * ( CGFloat(pixelWidth) / CGFloat(pixelHeight))
            let width: CGFloat = 100
            return CGSize(width: width, height: height)
        }
        return CGSize(width: 200, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension MyPhotoCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoSelectedPostContents?.count ?? 0
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! MyPostEditorPhotoCell
        
        if let content = photoSelectedPostContents?[indexPath.item],
           let asset = content.asset {
            cell.content = content
            cell.delegate = self
            
            cell.representedAssetIdentifier = asset.localIdentifier
            let pixcelWidth = asset.pixelWidth
            let pixcelHeight = asset.pixelHeight
            let height: CGFloat = 200 - 20
            let width = height * ( CGFloat(pixcelWidth) * CGFloat(pixcelHeight))
            let targetSize = CGSize(width: width, height: height)
            imageManager.requestImage(for: asset,
                                      targetSize: targetSize,
                                      contentMode: .aspectFill,
                                      options: nil) { (image, _) in
                if (cell.representedAssetIdentifier == asset.localIdentifier) {
                    cell.thumbnailImageView.image = image
                }
            }
        }
        return cell
    }
}

extension MyPhotoCollectionViewController: MyPostEditorPhotoCellDelegate {
    func deletePhotoCell(_ sender: MyPostEditorPhotoCell) {
        guard let tappedIndexPath = self.postEditorPhotoCollectionView.collectionView.indexPath(for: sender) else { return }
        photoSelectedPostContents?.remove(at: tappedIndexPath.item)
        self.postEditorPhotoCollectionView.collectionView.deleteItems(at: [tappedIndexPath])
    }
    
    func editPhotoCell(_ sender: MyPostEditorPhotoCell) {
        print("Clicked")
    }
}


extension MyPhotoCollectionViewController {
    //registerForKeyboard
}

extension MyPhotoCollectionViewController { //MyPostEditorPhotoPreviewCollectionViewDelegate {
    
     func cameraDidclicked(){
     }
     
    func photoLibraryDidClicked()  {
        let postEditorPhotoPickerController = MyPostEditorPhotoPickerController()
        postEditorPhotoPickerController.photoSelectedPostContents = self.photoSelectedPostContents
  
        
        postEditorPhotoPickerController.selectedPhotoNum = 2
        
        postEditorPhotoPickerController.delegate = self
        let navController = UINavigationController(rootViewController: postEditorPhotoPickerController)
        DispatchQueue.main.async {
            self.present(navController, animated: true, completion: nil)
        }
     }
}

extension MyPhotoCollectionViewController: MyPostEditorPhotoPickerControllerDelegate {
    func postEditorPhotoPickerController(_ picker: MyPostEditorPhotoPickerController, didFinishPickingContents contents: [MyPostContent]?) {
        if let contents = contents {
                photoSelectedPostContents?.append(contentsOf: contents)
                DispatchQueue.main.async {
                    self.postEditorPhotoCollectionView.collectionView.reloadData()
                }
        }

        
        self.dismiss(animated: true, completion: nil)
    }
}

extension MyPhotoCollectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
        UIImageWriteToSavedPhotosAlbum(image,
                                       self,
                                       #selector(didFinishedImageSave(_:didFinishedSavingWithError:contextInfo:)), nil)
        self.dismiss(animated: true, completion: nil)
    }
}

extension MyPhotoCollectionViewController {
    @objc func didFinishedImageSave(_ image: UIImage?, didFinishedSavingWithError error : Error?, contextInfo : UnsafeMutableRawPointer) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.fetchLimit = 1
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.fastFormat
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        
        if fetchResult.count > 0 {
            let asset = fetchResult.object(at: 0)
            let postContent = MyPostContent(type: .asset)
            postContent.asset = asset
            
            DispatchQueue.main.async {
                self.interSelectedPostContent(content: postContent)
            }
        }
    }
    
    func interSelectedPostContent(content: MyPostContent) {
        self.insertPostContent(content: content)
    }
    
    func fetchedPostContent() {
        self.postEditorPhotoCollectionView.collectionView.reloadData()
    }
}


extension MyPhotoCollectionViewController {
    func insertPostContent(content: MyPostContent) {
        photoSelectedPostContents?.insert(content, at: 0)
        if let index = photoSelectedPostContents?.firstIndex(of: content) {
            let indexPath = IndexPath(row: index, section: 0)
            postEditorPhotoCollectionView.collectionView.insertItems(at: [indexPath])
        }
    }
}
