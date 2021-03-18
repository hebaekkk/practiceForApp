//
//  MulticellCollectionVIewcontrollerViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/04.
//

import UIKit
import SnapKit

class MulticellCollectionViewController: UIViewController {

    
    let alarmCollectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        setCollectionView()
    }
    
    func setCollectionView() {
        //collectionView = returnCollectionView()
        //collectionView(collectionVie)

        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        
       
        collectionView.backgroundColor = .lightGray
        
        collectionView.register(IDCell.self, forCellWithReuseIdentifier: IDCell.identifier)
        collectionView.register(ReviewTableViewCell.self, forCellWithReuseIdentifier: ReviewTableViewCell.identifier)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ make in
            make.leading.equalTo(self.view.snp.leading)
            make.top.equalTo(self.view.snp.top)
            make.trailing.equalTo(self.view.snp.trailing)
            make.bottom.equalTo(self.view.snp.bottom)
        }
       
      
    }

    private func returnCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }

}

extension MulticellCollectionViewController: UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
extension MulticellCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let idCell = collectionView.dequeueReusableCell(withReuseIdentifier: IDCell.identifier, for: indexPath) as! IDCell
        
        
        let reviewContensCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewTableViewCell.identifier, for: indexPath) as! ReviewTableViewCell
        
        
  
        if indexPath.row == 0 {
            return idCell
        } else {
            return reviewContensCell
        }
        //idCell.backgroundColor = .blue
        //return idCell

    }
    
    
}
extension MulticellCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        if indexPath.row == 0 {
            return CGSize(width: screenWidth, height: 130)
        } else {
            return CGSize(width: screenWidth, height: 400)
        }
       
    }
    

}
