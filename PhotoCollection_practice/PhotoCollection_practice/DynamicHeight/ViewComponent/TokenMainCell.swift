//
//  TokenMainCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/02.
//

import UIKit

class TokenMainCell: BaseCollectionViewCell {
    
    static let identifier = "TokenMainCell"
    
    var token: Token? {
        didSet {
            guard let sender = self.token else { return }
            self.titleLabel.text = sender.title
        }
       
    }
    
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    var cancelButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("X", for: .normal)
        btn.setContentHuggingPriority(.init(900), for: .horizontal)//(순위, 가로로)
        btn.isUserInteractionEnabled = false
        return btn
    }()
    
    override func setupViews() {
        self.titleLabel.text = nil
        self.backgroundColor = #colorLiteral(red: 0.4039215686, green: 0.4666666667, blue: 0.7215686275, alpha: 1)
        self.layer.cornerRadius = 10.0
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, cancelButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
        self.addConstraints([
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
        ])
    }
}

class TokenListCell: BaseCollectionViewCell {
    static let identifier = "TokenListCell"
    
    var token: Token? {
        didSet {
            guard let sender = self.token else { return }
            self.titleLabel.text = sender.title

        }
    }

    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.lineBreakMode = .byTruncatingMiddle
        lbl.textColor = .white
        return lbl
    }()
    
    override func setupViews() {
        self.titleLabel.text = nil
        self.layer.cornerRadius = 10.0
        
        addSubview(titleLabel)
        self.addConstraints([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
        ])
    }
}
