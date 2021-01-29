//
//  BasicCollectionViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/28.
//

import UIKit
import SnapKit
import Photos

class BasicCollectionViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, PostEditorPhotoPickerControllerDelegate {
    
    func postEditorPhotoPickerController(_ picker: PostEditorPhotoPickerController, didFinishPickingContents contents: [PostContent]?) {
        //
    }
    

    let imageManager = PHCachingImageManager()
    let cellid = "cellid"
    
    //사진 저장할곳
    var photoSelectedPostContents : [PostContent]?
    
    lazy var postEditorPhotoCollectionView : PostEditorPhotoCollectionView = {
        let cv = PostEditorPhotoCollectionView()
        cv.collectionView.delegate = self
        cv.collectionView.dataSource = self
        return cv
    }()


    @IBAction func check(_ sender: Any) {
        photoLibraryDidClicked()
    }
    
    func photoLibraryDidClicked() {
        let postEditorPhotoPickerController = PostEditorPhotoPickerController()
        postEditorPhotoPickerController.photoSelectedPostContents = self.photoSelectedPostContents
        postEditorPhotoPickerController.delegate = self
        let navController = UINavigationController(rootViewController: postEditorPhotoPickerController)
        DispatchQueue.main.async {
            self.present(navController, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(postEditorPhotoCollectionView)
        postEditorPhotoCollectionView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(200)
        }
    }



}
extension BasicCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let content = photoSelectedPostContents?[indexPath.item], let asset = content.asset{
            let pixcelWidth = asset.pixelWidth
            let pixcelHeight = asset.pixelHeight
            let height : CGFloat = 200 - 20
            let width = height * ( CGFloat(pixcelWidth) / CGFloat(pixcelHeight) )
            return CGSize(width: width, height: height)
        }
        return CGSize(width: 200, height: 200-20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension BasicCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoSelectedPostContents?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! PostEditorPhotoCell
//cell.delegate = postEditorPhotoCollectionView//
        
        if let content = photoSelectedPostContents?[indexPath.item], let asset = content.asset {
            cell.content = content
            cell.delegate = self
            cell.representedAssetIdentifier = asset.localIdentifier
            let pixcelWidth = asset.pixelWidth
            let pixcelHeight = asset.pixelHeight
            let height : CGFloat = 200 - 20
            let width = height * ( CGFloat(pixcelWidth) / CGFloat(pixcelHeight) )
            let targetSize = CGSize(width: width , height : height )
            imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: nil) { (image, _) in
                if (cell.representedAssetIdentifier == asset.localIdentifier){
                    cell.thumbnailImageView.image = image
                }
            }
        }
        
        return cell
        
    }
}

extension BasicCollectionViewController : PostEditorPhotoCellDelegate {
    func deletePhotoCell(_ sender: PostEditorPhotoCell) {
        guard let tappedIndexPath = self.postEditorPhotoCollectionView.collectionView.indexPath(for: sender) else { return }
        photoSelectedPostContents?.remove(at: tappedIndexPath.item)
        self.postEditorPhotoCollectionView.collectionView.deleteItems(at: [tappedIndexPath])
        //showOrHidePhotoPreviewCollectionView()
    }
    
    func editPhotoCell(_ sender: PostEditorPhotoCell) {
        //TODO
    }
    
}
