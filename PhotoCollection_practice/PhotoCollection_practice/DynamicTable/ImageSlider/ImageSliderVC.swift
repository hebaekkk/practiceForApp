//
//  ImageSliderVC.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/09.
//

import UIKit
import SnapKit

class ImageSliderVC: UIViewController {
    
    var imageArr = ["car1","car2","car3","car4","car5"]

    var collectionView: UICollectionView!
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl.init()
        pageControl.backgroundColor = .clear
        pageControl.tintColor = .blue
        pageControl.numberOfPages = imageArr.count
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false //?
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        collectionViewSetting()
    }
    

    func collectionViewSetting() {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = #colorLiteral(red: 0.3926633, green: 0.907354176, blue: 0.7378444076, alpha: 1)
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ make in
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(300)
        }
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(ImageSliderCell.self, forCellWithReuseIdentifier: ImageSliderCell.identifier)
        
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(collectionView.snp.bottom).offset(-10)
        }
    }

}
extension ImageSliderVC: UICollectionViewDelegate {
    
}
extension ImageSliderVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderCell.identifier, for: indexPath) as! ImageSliderCell
        cell.imageView.image = UIImage(named: imageArr[indexPath.row])
        if ((indexPath.row % 2) == 1) {
            cell.backgroundColor = .blue
        } else {
            cell.backgroundColor = .red
        }
        //let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        //cell.backgroundColor = .black
        return cell
    }
    
    
}
extension ImageSliderVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: 300)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let imgWidth = UIScreen.main.bounds.width
        let x = scrollView.contentOffset.x
        
        self.pageControl.currentPage = Int( x / imgWidth )
        let index = IndexPath.init(item: self.pageControl.currentPage, section: 0)
        
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        
        
        //scrollView.contentOffset.x = imgWidth * CGFloat(Int( x / imgWidth ))
        
        
        print(scrollView.contentOffset.x)
    }
}
