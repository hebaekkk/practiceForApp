//
//  starAndLabel.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/19.
//

import UIKit
import SnapKit

class starAndLabel: UIView {

    let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "star")
        return imageView
    }()
    
    let starLabel: UILabel = {
        let label = UILabel()
        label.text = "5.5"
        label.clipsToBounds = true
        label.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        //self.clipsToBounds = true
        //self.backgroundColor = #colorLiteral(red: 0.01245652698, green: 0.2205626965, blue: 0.9846246839, alpha: 0.5)
        //addSubview(starImage)
        //addSubview(starLabel)
       
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 4
        hStack.distribution = .fillProportionally
        
        
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hStack.addArrangedSubview(starImage)
        hStack.addArrangedSubview(starLabel)
        
        hStack.snp.makeConstraints{ make in
            make.height.equalTo(25)
        }
        
        starImage.snp.makeConstraints{ make in
            make.height.equalTo(25)
            make.width.equalTo(25)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
//            make.leading.equalTo(self)
//            make.top.equalTo(self)
//            make.bottom.equalTo(self)
        }
        starLabel.snp.makeConstraints{ make in
            make.height.equalTo(25)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
//            make.leading.equalTo(starImage.snp_trailing).offset(4)//(self).offset(34)
//            make.top.equalToSuperview()//(self.snp_top)
//            make.bottom.equalToSuperview()//(self.snp_bottom)
//            make.trailing.equalToSuperview()
//            make.height.equalTo(30)
        }
        
        
        addSubview(hStack)
    }
}
