//
//  SubVC.swift
//  photoSlider_practice
//
//  Created by BigHand on 2021/01/18.
//

import UIKit
import PhotoSlider
import Kingfisher

class SubVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var v: UIView!
    
    let imageURLs = [
        URL(string:"\(imageUrlString)image001.jpg")!,
        URL(string:"\(imageUrlString)image002.jpg")!,
        URL(string:"\(imageUrlString)image003.jpg")!,
        URL(string:"\(imageUrlString)image004.jpg")!,
        URL(string:"\(imageUrlString)image005.jpg")!,
        URL(string:"\(imageUrlString)image006.jpg")!,
        URL(string:"\(imageUrlString)image007.jpg")!,
        URL(string:"\(imageUrlString)image008.jpg")!,
    ]
    
    let photos = [
        PhotoSlider.Photo(imageURL: URL(string: "\(imageUrlString)image001.jpg")!, caption: "In San Francisco, I went walking in the night. The city is still bright."),
        PhotoSlider.Photo(imageURL: URL(string: "\(imageUrlString)image002.jpg")!, caption: "This is a very good photo. \nGood!"),
        PhotoSlider.Photo(imageURL: URL(string: "\(imageUrlString)image003.jpg")!, caption: ""),
        PhotoSlider.Photo(imageURL: URL(string: "\(imageUrlString)image004.jpg")!, caption: "Fire Alerm"),
        PhotoSlider.Photo(imageURL: URL(string: "\(imageUrlString)image005.jpg")!, caption: "He is misyobun. He is from Japan."),
        PhotoSlider.Photo(imageURL: URL(string: "\(imageUrlString)image006.jpg")!, caption: "Bamboo grove.\nGreen\nGood\nSo Good"),
        PhotoSlider.Photo(imageURL: URL(string: "\(imageUrlString)image007.jpg")!, caption: "Railroad"),
        PhotoSlider.Photo(imageURL: URL(string: "\(imageUrlString)image008.jpg")!, caption: "Japan. \nRice paddy."),
    ]
    
    var currentRow = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let collectionView = self.collectionView else {
            return
        }
        
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        flowLayout.invalidateLayout()
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.contentOffset = CGPoint(x: CGFloat(currentRow) * view.bounds.width, y: 0.0)
    }
    
    //MARK: - UIContentContainer
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        updateCurrentRow(to: size)
        collectionView.reloadData()
    }
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        collectionView.delegate = self
//        collectionView.dataSource = self
//    }
    
}
extension SubVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gcell", for: indexPath) as! CollectionViewCell
        let imageView = cell.imageView
        imageView!.kf.setImage(with: imageURLs[indexPath.row])
        return cell
    }
}

extension SubVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoSlider = PhotoSlider.ViewController(photos: photos)
        photoSlider.delegate = self
        photoSlider.currentPage = indexPath.row
        photoSlider.captionNumberOfLines = 0
        
        photoSlider.transitioningDelegate = self
        present(photoSlider, animated: true, completion: nil)
    }
}
extension SubVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if view.bounds.width < view.bounds.height {
            return CGSize(width: v.bounds.width ,height: v.bounds.width)
        } else {
            return CGSize(width: v.bounds.width, height: v.bounds.height)
        }
    }
}

//MARK - PhotoSliderDelegate
extension SubVC: PhotoSliderDelegate {
    func photoSliderControllerDidDismiss(_ viewController: ViewController) {
        currentRow = viewController.currentPage
        let indexPath = IndexPath(item: currentRow, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    }
}
extension SubVC: ZoomingAnimationControllerTransitioning {
    
    func transitionSourceImageView() -> UIImageView {
        let indexPath = collectionView.indexPathsForSelectedItems?.first
        let cell = collectionView.cellForItem(at: indexPath!) as! CollectionViewCell
        let imageView = UIImageView(image: cell.imageView.image)
        
        var frame = cell.imageView.frame
        
        frame.origin.y += UIApplication.shared.statusBarFrame.height
        if view.bounds.size.width >= view.bounds.height {
            frame.size.height -= 20.0
        }
        imageView.frame = frame
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }
    
    func transitionDestinationImageView(sourceImageView: UIImageView) {
        
        guard let image = sourceImageView.image else {
            return
        }
        
        let indexPath = collectionView.indexPathsForSelectedItems?.first
        let cell = collectionView.cellForItem(at: indexPath!) as! ImageCollectionViewCell
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        var frame = CGRect.zero

        if view.bounds.size.width < view.bounds.height {

            if image.size.height < image.size.width {
                let width = (sourceImageView.image!.size.width * sourceImageView.bounds.size.width) / sourceImageView.image!.size.height
                let x = (width - cell.imageView.bounds.height) * 0.5
                frame = CGRect(x: -1.0 * x, y: statusBarHeight, width: width, height: cell.imageView.bounds.height)
            } else {
                frame = CGRect(x: 0.0, y: statusBarHeight, width: view.bounds.width, height: view.bounds.width)
            }
            
        } else {

            let height = (image.size.height * UIScreen.main.bounds.width) / image.size.width
            let y = (height - UIScreen.main.bounds.height - statusBarHeight) * 0.5
            frame = CGRect(x: 0.0, y: -1.0 * y, width: view.bounds.width, height: height)

        }
        
        sourceImageView.frame = frame
        
    }
    
    
}
// MARK: - UIViewControllerTransitioningDelegate

extension SubVC: UIViewControllerTransitioningDelegate {

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        let animationController = PhotoSlider.ZoomingAnimationController(present: false)
        animationController.sourceTransition = dismissed as? ZoomingAnimationControllerTransitioning
        animationController.destinationTransition = self
        
        view.frame = dismissed.view.bounds
        
        return animationController
        
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        let animationController = PhotoSlider.ZoomingAnimationController(present: true)
        animationController.sourceTransition = source as? ZoomingAnimationControllerTransitioning
        animationController.destinationTransition = presented as? ZoomingAnimationControllerTransitioning
        return animationController
        
    }
    
}

// MARK: - Private Methods

extension SubVC {
    
    func updateCurrentRow(to size: CGSize) {
        
        var row = Int(round(collectionView.contentOffset.x / collectionView.bounds.width))
        if row < 0 {
            row = 0
        }
        currentRow = row
        
    }
    
}
