//
//  DetailCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/17.
//

import UIKit

class DetailCell: UICollectionViewCell {
    static let identifier = "DetailCell"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 3, left: 3, bottom: 13, right: 3)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        view.alwaysBounceVertical = true
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .brown
        
        //[ 0 ] cell register
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        contentView.addSubview(collectionView)
        collectionView.showsVerticalScrollIndicator = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let insetBounds = bounds.inset(by: CommonInsets)
        self.contentView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        titleLabel.frame = insetBounds
        collectionView.frame = contentView.bounds
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension DetailCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.identifier, for: indexPath) as? ButtonCell
        cell!.label.text = "박치기"
        return cell!
    }
    

    
}

extension DetailCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = contentView.bounds.width
        
        return CGSize(width: width / 2 - 20, height: 30)
    }
    
}

extension DetailCell: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        print("hi")
//        if let selectedItems = self.collectionView.indexPathsForSelectedItems {
//            if selectedItems.contains(indexPath) {
//                collectionView.deselectItem(at: indexPath, animated: true)
//                return true
//            }
//        }
//        return true
//    }
    
    
}
