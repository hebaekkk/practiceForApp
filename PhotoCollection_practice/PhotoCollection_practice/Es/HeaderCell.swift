//
//  HeaderCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/17.
//

import UIKit

let CommonInsets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)

class HeaderCell: UICollectionViewCell {
    static let identifier = "HeaderCell"
    
    private let expandLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        label.textAlignment = .center
        label.text = ">>"
        label.sizeToFit()
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 4
        let subtitleAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.green,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24),
            NSAttributedString.Key.foregroundColor: UIColor.orange
        ]
        
        let attributedText = NSMutableAttributedString(string: "subtitle\n", attributes: subtitleAttributes)
        attributedText.append(NSAttributedString(string: "TITLE", attributes: titleAttributes))
        label.attributedText = attributedText
        label.sizeToFit()
        
        return label
    }()
    
    func setExpanded(_ isSelected: Bool) {
        expandLabel.transform = isSelected ? CGAffineTransform(rotationAngle: CGFloat.pi / 2) : .identity
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(expandLabel)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let insets = CommonInsets
        titleLabel.frame = CGRect(x: insets.left, y: 0, width: titleLabel.bounds.width, height: bounds.height)
        expandLabel.center = CGPoint(x: bounds.width - expandLabel.bounds.width / 2 - insets.right, y: bounds.height / 2)
    }
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
                //contentView.textColor = .white
                contentView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                setExpanded(isSelected)
            }
            else {
                contentView.backgroundColor = .clear
                setExpanded(isSelected)
            }
        }
    }
}
