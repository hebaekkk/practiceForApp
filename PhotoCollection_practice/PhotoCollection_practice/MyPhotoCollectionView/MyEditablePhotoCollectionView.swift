//
//  MyEditablePhotoCollectionView.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/28.
//

import Foundation
import UIKit
import SnapKit
import Photos
protocol MyEditablePhotoCollectionViewDelegate: class {
    func cameraDidClicked()
    func photoLibraryDidClicked()
}

class MyEditablePhotoCollectionView: MyPostPhotoCell,//BaseCell,
                                     UICollectionViewDelegateFlowLayout {
    let cellid = "cellid"
    let postEditorPhotoCameraCellId = "photoEditorPhotoCameraCellId"
    var contents: [PostContent]?
    let imageManager = PHCachingImageManager()
    var delegate: MyEditablePhotoCollectionViewDelegate?
    
    //Q. lazy 하면 delegate 된다.
    //But... 그냥 var 하면 delegate 안된다.
    //-> Lazy는 사용할 때 메모리에 할당된다.
    //아직 해결하지는 못했다.
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .brown
        //cv.dataSource = self
        cv.delegate = self
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override func setupViews() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints{ (make) in
            //collectionView를 사용할 뷰의 constraint맞추는 것이다.
            make.top.equalTo(self)
            make.trailing.equalTo(self)
            make.leading.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        collectionView.register(MyPostPhotoCell.self, forCellWithReuseIdentifier: cellid)
        collectionView.register(MyEditorPhotoCameraCell.self, forCellWithReuseIdentifier: postEditorPhotoCameraCellId)
        
    }
}


extension MyEditablePhotoCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if( indexPath.item == 0) {
            self.delegate?.photoLibraryDidClicked()
        }
        collectionView.deselectItem(at: indexPath, animated: false)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.item == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postEditorPhotoCameraCellId, for: indexPath) as! MyEditorPhotoCameraCell
            cell.altLabel.text = "카메라"
            cell.iconImageView.image = UIImage(named: "camera")?.withRenderingMode(.alwaysTemplate)
            return cell
        } else if (indexPath.item == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postEditorPhotoCameraCellId, for: indexPath) as! MyEditorPhotoCameraCell
            cell.altLabel.text = "라이브러리"
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
            return cell
        }
    }
}
