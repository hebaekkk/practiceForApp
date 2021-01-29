//
//  EditPhotoViewcontroller.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/27.
//

import UIKit
import SnapKit
import Photos

class EditPhotoViewController: UIViewController {

    let placeholder = "무슨 일이 일어나고 있나요?"
    let scrollView : UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    let textView : UITextView = {
        let tv = UITextView()
        tv.isScrollEnabled = false
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return tv
    }()
    let placeHolderLabel : UILabel = {
        let label = UILabel()
        label.text = "무슨 일이 일어나고 있나요?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.lightGray
        label.sizeToFit()
        return label
    }()
    let toolBar : UIToolbar = {
       let tb = UIToolbar()
        return tb
    }()
    
    lazy var postEditorPhotoCollectionView : PostEditorPhotoCollectionView = {
        let cv = PostEditorPhotoCollectionView()
        cv.collectionView.delegate = self
        cv.collectionView.dataSource = self
        return cv
    }()
    
    
    lazy var postEditorPhotoPreviewCollectionView : PostEditorPhotoPreviewCollectionView = {
        let cv = PostEditorPhotoPreviewCollectionView()
        cv.delegate = self
        cv.grabPhotos()
        return cv
    }()
    
    @objc func actionPhoto(sender: AnyObject){
        
    }
    
    let cellid = "cellid"
    
    let imageManager = PHCachingImageManager()
    var keyboardHeightConstraint : Constraint?
    var textViewHeightConstraint : Constraint?
    var postEditorPhotoPreviewCollectionViewConstraint : Constraint?
    var photoSelectedPostContents : [PostContent]?
    func setUpView(){
        view.addSubview(toolBar)
        view.addSubview(scrollView)
        view.addSubview(postEditorPhotoPreviewCollectionView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.bottom.equalTo(self.toolBar.snp.top)
            
        }
        photoSelectedPostContents = [PostContent]()
        scrollView.isScrollEnabled = true
        scrollView.addSubview(textView)
        textView.delegate = self
        scrollView.delegate = self
        scrollView.bounces = true
        view.backgroundColor = UIColor.gray
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView)
            make.trailing.equalTo(scrollView)
            make.leading.equalTo(scrollView)
            make.width.equalTo(scrollView)
          textViewHeightConstraint =  make.height.equalTo(200).constraint
        }
        scrollView.addSubview(postEditorPhotoCollectionView)
       postEditorPhotoCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(textView.snp.bottom)
            make.trailing.equalTo(scrollView)
            make.leading.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(200)
            make.bottom.equalTo(scrollView)
        }
        scrollView.backgroundColor = UIColor.white
        scrollView.alwaysBounceVertical = true
        textView.addSubview(placeHolderLabel)
        placeHolderLabel.frame.origin = CGPoint(x: 15, y: 10 )
        self.textViewDidChange(textView)
        
       
        let photoBarButtonItem =
            UIBarButtonItem(image: UIImage(named: "camera")?.withRenderingMode(.alwaysTemplate), style: UIBarButtonItem.Style.plain, target: self, action: #selector(actionPhoto))
        
        toolBar.setItems([photoBarButtonItem], animated: true)
        toolBar.tintColor = Constants.primaryColor
        toolBar.snp.makeConstraints { (make) in
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            keyboardHeightConstraint = make.bottom.equalTo(bottomLayoutGuide.snp.top).constraint
            
        }
        
        postEditorPhotoPreviewCollectionView.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.top.equalTo(self.toolBar.snp.bottom).priority(.low)
            postEditorPhotoPreviewCollectionViewConstraint = make.bottom.equalTo(self.toolBar.snp.top).constraint
            make.height.equalTo(100)
        }
        view.bringSubviewToFront(toolBar)
        
    }
    
    override func viewDidLoad() {
        setUpView()
        setUpNavigationBar()
      //  grabPhotos()
    }
    override func viewDidAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    func setUpNavigationBar(){
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = "글쓰기"
        //let dissmissButon = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.close, target: self, action: #selector(actionDismiss))
    
        //self.navigationItem.leftBarButtonItem = dissmissButon
        
    }
    @objc func actionDismiss(sender : Any){
       // self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    


}

extension EditPhotoViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
        placeHolderLabel.isHidden = !textView.text.isEmpty
        let size = CGSize(width: view.frame.width, height: CGFloat.infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textViewHeightConstraint?.update(offset: max(50, estimatedSize.height))
        showOrHidePhotoPreviewCollectionView()
    }
}
extension EditPhotoViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView{
            textView.resignFirstResponder()
        }
    }
}
extension EditPhotoViewController : UICollectionViewDelegate {
   

    
    
}
extension EditPhotoViewController : UICollectionViewDelegateFlowLayout {
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

extension EditPhotoViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoSelectedPostContents?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! PostEditorPhotoCell
        // cell.delegate = postEditorPhotoCollectionView
        
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

extension EditPhotoViewController : PostEditorPhotoCellDelegate {
    func deletePhotoCell(_ sender: PostEditorPhotoCell) {
        guard let tappedIndexPath = self.postEditorPhotoCollectionView.collectionView.indexPath(for: sender) else { return }
        photoSelectedPostContents?.remove(at: tappedIndexPath.item)
        self.postEditorPhotoCollectionView.collectionView.deleteItems(at: [tappedIndexPath])
        showOrHidePhotoPreviewCollectionView()
    }
    
    func editPhotoCell(_ sender: PostEditorPhotoCell) {
        //TODO
    }
    
}
extension EditPhotoViewController {
    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    func unregisterForKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func handleKeyboardNotification(notification: NSNotification) {
        
        if let userInfo = notification.userInfo {
            
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillHideNotification//NSNotification.Name.UIResponder.keyboardWillShowNotification
            
            
            UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.keyboardHeightConstraint?.update(offset: isKeyboardShowing ? -keyboardFrame!.height : 0)
                self.view.layoutIfNeeded()
                
            }, completion: { (completed) in
                //
                //                if isKeyboardShowing {
                //                    let indexPath = NSIndexPath(forItem: self.messages!.count - 1, inSection: 0)
                //                    self.collectionView?.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
                //                }
                
            })
        }
    }
    
}

extension EditPhotoViewController : PostEditorPhotoPreviewCollectionViewDelegate {
    func cameraDidClicked() {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            DispatchQueue.main.async {
             self.present(imagePicker, animated: true, completion: nil)
            }
        }
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
    
    func photoContentDidClicked(_ content: PostContent) {
        self.insertPostContent(content: content)
        
    }
    
    
}
extension EditPhotoViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(didFinishedImageSave(_:didFinishedSavingWithError:contextInfo:)), nil)

        self.dismiss(animated: true, completion: nil)
    }
}

extension EditPhotoViewController {
    @objc func didFinishedImageSave(_ image : UIImage?, didFinishedSavingWithError error : Error?, contextInfo : UnsafeMutableRawPointer){
        let fetchOptions = PHFetchOptions()
        fetchOptions.fetchLimit = 1
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.fastFormat
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        if fetchResult.count > 0 {
            let asset = fetchResult.object(at: 0)
            let postContent = PostContent(type : .asset)
            postContent.asset = asset
            
            DispatchQueue.main.async {
                self.insertSelectedPostContent(content: postContent)
            }
        }
        
    }
    func insertSelectedPostContent(content : PostContent){
        self.insertPostContent(content: content)
    }
    func fetchedPostContent(){
        self.postEditorPhotoCollectionView.collectionView.reloadData()
    }
}
extension EditPhotoViewController {
        func grabPhotos(){
            DispatchQueue.global(qos: .background).async {
                let fetchOptions = PHFetchOptions()
                fetchOptions.fetchLimit = 10
                let requestOptions = PHImageRequestOptions()
                requestOptions.isSynchronous = true
                requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.fastFormat
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]

                let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
                self.photoSelectedPostContents = [PostContent]()
                if fetchResult.count > 0 {
                    for i in 0..<fetchResult.count {
                        let asset = fetchResult.object(at: i)
                        let postContent = PostContent(type : .asset)
                        postContent.asset = asset
                        self.photoSelectedPostContents?.append(postContent)
                        print(postContent)
                    }
                }

                DispatchQueue.main.async {
                   self.postEditorPhotoCollectionView.collectionView.reloadData()
                }
            }
        }
}
//
extension EditPhotoViewController : PostEditorPhotoPickerControllerDelegate {
    func postEditorPhotoPickerController(_ picker: PostEditorPhotoPickerController, didFinishPickingContents contents: [PostContent]?) {
        if let contents = contents {
            photoSelectedPostContents?.append(contentsOf: contents)
            DispatchQueue.main.async {
                self.postEditorPhotoCollectionView.collectionView.reloadData()
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
}

extension EditPhotoViewController {
    func insertPostContent(content : PostContent){
        //        contents?.append(content)
        photoSelectedPostContents?.insert(content, at: 0)
        if let index = photoSelectedPostContents?.firstIndex(of: content){
            let indexPath = IndexPath(row: index, section: 0)
            postEditorPhotoCollectionView.collectionView.insertItems(at: [indexPath])
        }
        showOrHidePhotoPreviewCollectionView()
    }
}

/////////아직 필요 업슴
extension EditPhotoViewController {
    func showOrHidePhotoPreviewCollectionView(){
        if (!textView.text.isEmpty || photoSelectedPostContents?.count != 0) {
            if (postEditorPhotoPreviewCollectionViewConstraint?.isActive == true){
                UIView.animate(withDuration: 0.3) {
                    self.postEditorPhotoPreviewCollectionViewConstraint?.deactivate()
                    self.view.layoutIfNeeded()
                }
            }
        }else {
            if (postEditorPhotoPreviewCollectionViewConstraint?.isActive == false){
                UIView.animate(withDuration: 0.3) {
                    self.postEditorPhotoPreviewCollectionViewConstraint?.activate()
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
   
}

