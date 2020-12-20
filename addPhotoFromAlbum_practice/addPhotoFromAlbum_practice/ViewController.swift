import UIKit
import BSImagePicker
import Photos

//  [  ] imagePicker 열 때 Modal 두개 안나오게하기 . Album이랑 imagePickerSource랑 연결하기
class ViewController: UIViewController {
    
    var SelectedAssets = [PHAsset]()
    var photoArray = [UIImage]()
    
    let View: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    //scrollView : Height 60
    //imageView : 40
    lazy var img: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = .yellow
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = UIImage(systemName: "pencil")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var img1: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = .blue
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = UIImage(systemName: "scribble")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var img2: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = .black
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = UIImage(systemName: "highlighter")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var img3: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = .black
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = UIImage(systemName: "highlighter")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var img4: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = .black
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = UIImage(systemName: "highlighter")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var img5: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = .black
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = UIImage(systemName: "highlighter")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var img6: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = .black
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = UIImage(systemName: "highlighter")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var img7: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = .black
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.image = UIImage(systemName: "highlighter")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    lazy var imageArr = [img, img1, img2, img3, img4, img5, img6, img7]
    
    func setScroll() {
        let imgWidth = img.frame.width + CGFloat(10)
        scroll.showsHorizontalScrollIndicator  = false
        scroll.showsVerticalScrollIndicator = false
        scroll.isPagingEnabled = true
        scroll.contentSize = CGSize(width: imgWidth * CGFloat(imageArr.count), height: 100)
        for i in 0..<imageArr.count {
            scroll.addSubview(imageArr[i])
            imageArr[i].frame = CGRect(x: imgWidth * CGFloat(i), y: 0, width: imgWidth, height: img.frame.height)
        }
        scroll.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddPhotoView()
        view.addSubview(View)
        View.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        View.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        View.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        View.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        view.addSubview(scroll)
//        setScroll()
//        //scroll.backgroundColor = .blue
//        scroll.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//        scroll.heightAnchor.constraint(equalToConstant: img.frame.height).isActive = true
//
//
//
        //collectionView setting입니다
//        view.addSubview(collectionView)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.backgroundColor = .blue
//        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func selectImg(_ sender: Any) {
        let imagePicker = ImagePickerController()
        imagePicker.settings.selection.max = 5
        imagePicker.settings.theme.selectionStyle = .numbered
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
        imagePicker.settings.selection.unselectOnReachingMax = true

//      [  ] imagePicker 열 때 Modal 두개 안나오게하기 . Album이랑 imagePickerSource랑 연결하기
    
        self.presentImagePicker(imagePicker, select: { (asset) in
            self.initImageViewArr()
            
            //[ O ]resize the scrollView Alloc the image total Length !
            
            print("Selected: \(asset)\n")
        }, deselect: { (asset) in
            print("Deselected: \(asset)\n")
        }, cancel: { (assets) in
            print("Canceled with selections: \(assets)\n")
        }, finish: { (assets) in
            self.SelectedAssets = assets
            
            print("Finished with selections: \(assets)\n")

            let cnt = assets.count
            self.resizeTheScroll(cnt: cnt)
            for i in 0..<cnt{
                var selectedImage = assets[i]
                self.imageArr[i].isHidden = false
                self.imageArr[i].image = self.getAsset(asset: selectedImage)
            }

        }, completion: {
               
        })
    
    }
    
    @IBAction func selectImages(_ sender: Any) {
        
        let imagePicker = ImagePickerController()
        imagePicker.settings.selection.max = 5
        imagePicker.settings.theme.selectionStyle = .numbered
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
        imagePicker.settings.selection.unselectOnReachingMax = true

        
        let start = Date()
        self.presentImagePicker(imagePicker, select: { (asset) in
            self.initImageViewArr()
            
            //[ O ]resize the scrollView Alloc the image total Length !
            
            print("Selected: \(asset)\n")
        }, deselect: { (asset) in
            print("Deselected: \(asset)\n")
        }, cancel: { (assets) in
            print("Canceled with selections: \(assets)\n")
        }, finish: { (assets) in
            self.SelectedAssets = assets
            
            print("Finished with selections: \(assets)\n")
//            if assets.count == 1 {
//                var selectedImg = assets.first
//                self.img.image = self.getAsset(asset: selectedImg!)
//            }
            let cnt = assets.count
            self.resizeTheScroll(cnt: cnt)
            for i in 0..<cnt{
                var selectedImage = assets[i]
                self.imageArr[i].isHidden = false
                self.imageArr[i].image = self.getAsset(asset: selectedImage)
            }
            
            
        }, completion: {
            let finish = Date()
            print("\(finish.timeIntervalSince(start))\n")
               
        })
    
    }
    func initImageViewArr() {
        for i in 0..<imageArr.count {
            imageArr[i].isHidden = true
        }
    }
    func resizeTheScroll(cnt: Int) {
        
        scroll.contentSize = CGSize(width: (img.frame.width) * CGFloat(cnt), height: 100)
        scroll.delegate = self
    }
    

    func getAsset(asset: PHAsset) -> UIImage {
    var image = UIImage()
        let imgManager = PHImageManager.default()
                   let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        imgManager.requestImage(for: asset, targetSize: CGSize(width: 300.0, height: 300.0), contentMode: PHImageContentMode.aspectFit, options: requestOptions, resultHandler: { (img, _) in
                    image = img!
                   })
    return image
    }

    func setAddPhotoView(){
        let camBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        camBtn.translatesAutoresizingMaskIntoConstraints = false
        camBtn.setImage(UIImage(systemName: "camera"), for: .normal)
        camBtn.contentMode = .scaleAspectFit
        camBtn.layer.borderWidth = 1
        camBtn.layer.borderColor = UIColor.gray.cgColor
        
        camBtn.addTarget(self, action: #selector(selectImg(_:)), for: .touchUpInside)
        
        View.addSubview(camBtn)
        camBtn.leftAnchor.constraint(equalTo: View.leftAnchor, constant: 5).isActive = true
        camBtn.topAnchor.constraint(equalTo: View.topAnchor, constant: 4).isActive = true
        camBtn.bottomAnchor.constraint(equalTo: View.bottomAnchor, constant: -4).isActive = true
        
        View.addSubview(scroll)
        scroll.leftAnchor.constraint(equalTo: camBtn.rightAnchor, constant: 10).isActive = true
        scroll.rightAnchor.constraint(equalTo: View.rightAnchor, constant: -10).isActive = true
        scroll.topAnchor.constraint(equalTo: View.topAnchor, constant: 4).isActive = true
        scroll.bottomAnchor.constraint(equalTo: View.bottomAnchor, constant: -4).isActive = true
        setScroll()
        
    }
}
//extension PHAsset {
//func getAssetImage() -> UIImage {
//    let manager = PHImageManager.default()
//    let option = PHImageRequestOptions()
//    var image = UIImage()
//    option.isSynchronous = true
//    manager.requestImage(for: self,
//                         targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight),
//                         contentMode: .aspectFit,
//                         options: option,
//                         resultHandler: {(result, info) -> Void in
//                            image = result!
//                         })
//    return image
//    }
//}
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
////
////  ViewController.swift
////  addPhotoFromAlbum_practice
////
////  Created by BigHand on 2020/12/17.
////
//
//import UIKit
//import BSImagePicker
//import Photos
//
////  [  ] imagePicker 열 때 Modal 두개 안나오게하기 . Album이랑 imagePickerSource랑 연결하기
//
//class ViewController: UIViewController, UIScrollViewDelegate {
//
//    var SelectedAssets = [PHAsset]()
//    var photoArray = [UIImage]()
//
//    let View: UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    fileprivate let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        return cv
//    }()
//
//    let scroll: UIScrollView = {
//        let scroll = UIScrollView()
//        scroll.translatesAutoresizingMaskIntoConstraints = false
//        scroll.backgroundColor = .blue
//        return scroll
//    }()
//
//    //scrollView : Height 60
//    //imageView : 40
//
//    lazy var img: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 10
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = UIColor.gray.cgColor
//        imageView.backgroundColor = .yellow
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        imageView.image = UIImage(systemName: "pencil")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    lazy var img1: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 10
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = UIColor.gray.cgColor
//        imageView.backgroundColor = .blue
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        imageView.image = UIImage(systemName: "scribble")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    lazy var img2: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 10
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = UIColor.gray.cgColor
//        imageView.backgroundColor = .black
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        imageView.image = UIImage(systemName: "highlighter")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    lazy var img3: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 10
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = UIColor.gray.cgColor
//        imageView.backgroundColor = .black
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        imageView.image = UIImage(systemName: "highlighter")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    lazy var img4: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 10
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = UIColor.gray.cgColor
//        imageView.backgroundColor = .black
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        imageView.image = UIImage(systemName: "highlighter")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    lazy var img5: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 10
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = UIColor.gray.cgColor
//        imageView.backgroundColor = .black
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        imageView.image = UIImage(systemName: "highlighter")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    lazy var img6: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 10
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = UIColor.gray.cgColor
//        imageView.backgroundColor = .black
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        imageView.image = UIImage(systemName: "highlighter")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    lazy var img7: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 10
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = UIColor.gray.cgColor
//        imageView.backgroundColor = .black
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        imageView.image = UIImage(systemName: "highlighter")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//
//    lazy var imageArr = [img, img1, img2, img3, img4, img5, img6, img7]
//
//    func setScroll() {
//        let imgWidth = img.frame.width + CGFloat(10)
//        scroll.showsHorizontalScrollIndicator  = false
//        scroll.showsVerticalScrollIndicator = false
//        scroll.isPagingEnabled = true
//        scroll.contentSize = CGSize(width: imgWidth * CGFloat(imageArr.count), height: 100)
//        for i in 0..<imageArr.count {
//            scroll.addSubview(imageArr[i])
//            imageArr[i].frame = CGRect(x: imgWidth * CGFloat(i), y: 0, width: imgWidth, height: img.frame.height)
//        }
//        scroll.delegate = self
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setAddPhotoView()
//        view.addSubview(View)
//        View.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        View.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        View.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        View.heightAnchor.constraint(equalToConstant: 120).isActive = true
////        view.addSubview(scroll)
////        setScroll()
////        //scroll.backgroundColor = .blue
////        scroll.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
////        scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
////        scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
////        scroll.heightAnchor.constraint(equalToConstant: img.frame.height).isActive = true
////
////
////
//        //collectionView setting입니다
////        view.addSubview(collectionView)
////        collectionView.delegate = self
////        collectionView.dataSource = self
////        collectionView.backgroundColor = .blue
////        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
////        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
////        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
////        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
//
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    @objc func selectImg(_ sender: Any) {
//        let imagePicker = ImagePickerController()
//        imagePicker.settings.selection.max = 5
//        imagePicker.settings.theme.selectionStyle = .numbered
//        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
//        imagePicker.settings.selection.unselectOnReachingMax = true
//
////      [  ] imagePicker 열 때 Modal 두개 안나오게하기 . Album이랑 imagePickerSource랑 연결하기
//
//
//
//        let start = Date()
//        self.presentImagePicker(imagePicker, select: { (asset) in
//            self.initImageViewArr()
//
//            //[ O ]resize the scrollView Alloc the image total Length !
//
//            print("Selected: \(asset)\n")
//        }, deselect: { (asset) in
//            print("Deselected: \(asset)\n")
//        }, cancel: { (assets) in
//            print("Canceled with selections: \(assets)\n")
//        }, finish: { (assets) in
//            self.SelectedAssets = assets
//
//            print("Finished with selections: \(assets)\n")
////            if assets.count == 1 {
////                var selectedImg = assets.first
////                self.img.image = self.getAsset(asset: selectedImg!)
////            }
//            let cnt = assets.count
//            self.resizeTheScroll(cnt: cnt)
//            for i in 0..<cnt{
//                let selectedImage = assets[i]
//                self.imageArr[i].isHidden = false
//                self.imageArr[i].image = self.getAsset(asset: selectedImage)
//            }
//
//
//        }, completion: {
//            let finish = Date()
//            print("\(finish.timeIntervalSince(start))\n")
//
//        })
//
//    }
//
//    @IBAction func selectImages(_ sender: Any) {
//
//        let imagePicker = ImagePickerController()
//        imagePicker.settings.selection.max = 5
//        imagePicker.settings.theme.selectionStyle = .numbered
//        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
//        imagePicker.settings.selection.unselectOnReachingMax = true
//
//        let start = Date()
//        self.presentImagePicker(imagePicker, select: { (asset) in
//            self.initImageViewArr()
//
//            //[ O ]resize the scrollView Alloc the image total Length !
//
//            print("Selected: \(asset)\n")
//        }, deselect: { (asset) in
//            print("Deselected: \(asset)\n")
//        }, cancel: { (assets) in
//            print("Canceled with selections: \(assets)\n")
//        }, finish: { (assets) in
//            self.SelectedAssets = assets
//
//            print("Finished with selections: \(assets)\n")
//
//            let cnt = assets.count
//            self.resizeTheScroll(cnt: cnt)
//            for i in 0..<cnt{
//                let selectedImage = assets[i]
//                self.imageArr[i].isHidden = false
//                self.imageArr[i].image = self.getAsset(asset: selectedImage)
//            }
//
//
//        }, completion: {
//            let finish = Date()
//            print("\(finish.timeIntervalSince(start))\n")
//
//        })
//
//    }
//    func initImageViewArr() {
//        for i in 0..<imageArr.count {
//            imageArr[i].isHidden = false
//        }
//    }
//    func resizeTheScroll(cnt: Int) {
//
//        scroll.contentSize = CGSize(width: (img.frame.width) * CGFloat(cnt), height: 100)
//        scroll.delegate = self
//    }
//
//
//    func getAsset(asset: PHAsset) -> UIImage {
//        var image = UIImage()
//        let imgManager = PHImageManager.default()
//        let requestOptions = PHImageRequestOptions()
//        requestOptions.isSynchronous = true
//        imgManager.requestImage(for: asset, targetSize: CGSize(width: 300.0, height: 300.0), contentMode: PHImageContentMode.aspectFit, options: requestOptions,      resultHandler: { (img, _) in
//                    image = img!
//                    })
//        return image
//    }
//
//    func setAddPhotoView(){
//        let camBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
//        camBtn.translatesAutoresizingMaskIntoConstraints = false
//        camBtn.setImage(UIImage(systemName: "camera"), for: .normal)
//        camBtn.contentMode = .scaleAspectFit
//        camBtn.layer.borderWidth = 1
//        camBtn.layer.borderColor = UIColor.gray.cgColor
//
//        camBtn.addTarget(self, action: #selector(selectImg(_:)), for: .touchUpInside)
//
//        View.addSubview(camBtn)
//        camBtn.leftAnchor.constraint(equalTo: View.leftAnchor, constant: 5).isActive = true
//        camBtn.topAnchor.constraint(equalTo: View.topAnchor, constant: 4).isActive = true
//        camBtn.bottomAnchor.constraint(equalTo: View.bottomAnchor, constant: -4).isActive = true
//
//        View.addSubview(scroll)
//        scroll.leftAnchor.constraint(equalTo: camBtn.rightAnchor, constant: 10).isActive = true
//        scroll.rightAnchor.constraint(equalTo: View.rightAnchor, constant: -10).isActive = true
//        scroll.topAnchor.constraint(equalTo: View.topAnchor, constant: 4).isActive = true
//        scroll.bottomAnchor.constraint(equalTo: View.bottomAnchor, constant: -4).isActive = true
//
//
//    }
//}
//
////extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width/2)
////    }
////
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return 4
////    }
////
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
////        cell.backgroundColor = .red
////        return cell
////    }
////}
