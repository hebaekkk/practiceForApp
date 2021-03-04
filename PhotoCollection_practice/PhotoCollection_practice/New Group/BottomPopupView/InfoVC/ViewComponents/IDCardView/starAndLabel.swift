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
        imageView.image = UIImage(systemName: "star.fill")?.withTintColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        
        return imageView
    }()
    
    let starLabel: UILabel = {
        let label = UILabel()
        label.text = "5.5"
        label.clipsToBounds = true
        //label.frame = CGRect(x: 0, y: 0, width: 60, height: 20)
        label.font = UIFont.systemFont(ofSize: 13)
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
        hStack.distribution = .fill
        
        
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(hStack)
        hStack.addArrangedSubview(starImage)
        hStack.addArrangedSubview(starLabel)
        
        hStack.snp.makeConstraints{ make in
            make.height.equalTo(18)
            //make.width.equalTo(50)
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.bottom.equalTo(self)
        }
        starImage.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        starImage.snp.makeConstraints{ make in
            make.height.equalTo(18)
            make.width.equalTo(18)
            make.top.equalTo(hStack.snp.top)
            make.bottom.equalTo(hStack.snp.bottom)
            make.leading.equalTo(hStack.snp.leading)

        }
        starLabel.snp.makeConstraints{ make in
            make.height.equalTo(18)
            make.width.equalTo(20)
            make.trailing.equalTo(hStack.snp.trailing)
            make.top.equalTo(hStack.snp.top)
            make.bottom.equalTo(hStack.snp.bottom)

        }
        
        

        
    }
}
