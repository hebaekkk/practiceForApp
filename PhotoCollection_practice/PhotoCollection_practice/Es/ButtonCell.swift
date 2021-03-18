//
//  ButtonCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/17.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    static let identifier = "ButtonCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.backgroundColor = .clear
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let insetBounds = bounds.inset(by: CommonInsets)
        label.frame = insetBounds
    }
    
//    override func select(_ sender: Any?) {
//        print("HE")
//    }
    override var isSelected: Bool {
        didSet{
            if isSelected {
                //contentView.textColor = .white
                print("selected")
                contentView.backgroundColor = .white
            }
            else {
                contentView.backgroundColor = .clear
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
