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
        addSubview(starImage)
        addSubview(starLabel)
       
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starLabel.translatesAutoresizingMaskIntoConstraints = false
        
        starImage.snp.makeConstraints{ make in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.leading.equalTo(self)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
        }
        starLabel.snp.makeConstraints{ make in
            make.leading.equalTo(starImage.snp_trailing)//.offset(4)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            //make.height.equalTo(20)
        }
    }
}
