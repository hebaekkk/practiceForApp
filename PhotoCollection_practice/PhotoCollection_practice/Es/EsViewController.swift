//
//  EsViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/17.
//

import UIKit
import SnapKit

class EsViewController: UIViewController {

    //MARK : View Component
    
    var dataSource = 2
    
    let collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.minimumLineSpacing = 0
      layout.minimumInteritemSpacing = 0
      layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
      
//        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        
      let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
      view.backgroundColor = .black
      view.alwaysBounceVertical = true
        
        view.allowsMultipleSelection = true
      return view
    }()

    
    //MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: HeaderCell.identifier)
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)

    
        
    }
    
    //MARK: Layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    

}

extension EsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //let row = IndexPath(item: 0, section: section)
        
//        if collectionView.cellForItem(at: IndexPath(item: 0, section: section))?.isSelected {
//
//        }
        return self.dataSource
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = indexPath.item == 0 ? HeaderCell.identifier : DetailCell.identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        if let cell = cell as? HeaderCell {
            cell.titleLabel.text = "\(indexPath.item), \(indexPath.row), \(indexPath.section)"
            cell.titleLabel.textColor = .white
        } else if let cell = cell as? DetailCell {
            //cell.titleLabel.text = " DYNAMITE "
            if (((indexPath.section + 1) % 2) == 1) {
                cell.collectionView.allowsMultipleSelection = true// Multi selection allow !
            } else {
                cell.collectionView.allowsMultipleSelection = false
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            print("indexPath.item : \(indexPath.item) , \(indexPath)")
            self.dataSource = 1
        }
    }
    
}

extension EsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        if indexPath.item == 0 {
            return CGSize(width: width, height: 40)
        } else {
            return CGSize(width: width, height: 250)
        }
    }
    
  
}
