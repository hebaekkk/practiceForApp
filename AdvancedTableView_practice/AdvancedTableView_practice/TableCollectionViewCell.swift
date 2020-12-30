//
//  TableCollectionViewCell.swift
//  AdvancedTableView_practice
//
//  Created by BigHand on 2020/12/30.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TableCollectionViewCell"
    
    private let myLable: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myLable)
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myImageView.frame = CGRect(x: 5, y: 5,
                                   width: contentView.frame.size.width - 10,
                                   height: contentView.frame.size.width - 5 - 50)
        
        myLable.frame = CGRect(x: 5, y: contentView.frame.size.height - 50,
                                   width: contentView.frame.size.width - 10,
                                   height: 50)
    }
    
    public func configure(with model: CollectionTableCellModel) {
        
    }
}
