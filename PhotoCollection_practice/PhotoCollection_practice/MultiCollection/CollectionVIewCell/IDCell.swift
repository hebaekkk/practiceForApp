//
//  IDCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/04.
//

import UIKit
import SnapKit

class IDCell: MultiCollectionViewCell {
    
    static let identifier = "IDCell"
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        return imageView
    }()
    
    let businessTitle: UILabel = {
        let label = UILabel()
        label.text = "업체이름"
        return label
    }()
    let cleanKind: UILabel = {
        let label = UILabel()
        label.text = "청소 종류"
        return label
    }()
    
    let starScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "5.5"
        return label
    }()
    
    override func setupViews() {
        
        self.contentView.backgroundColor = .white
        
        self.contentView.addSubview(profileImageView)
        self.contentView.addSubview(businessTitle)
        self.contentView.addSubview(cleanKind)
        self.contentView.addSubview(starScoreLabel)
        
        profileImageView.snp.makeConstraints{ make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.top.equalTo(self.contentView.snp.top).offset(12)
            make.leading.equalTo(self.contentView.snp.leading).offset(24)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-40)
        }
        profileImageView.layer.cornerRadius = 30
        
        businessTitle.snp.makeConstraints{ make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.top.equalTo(self.contentView.snp.top).offset(12)
            make.height.equalTo(18)
        }
        
        cleanKind.snp.makeConstraints{ make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.top.equalTo(businessTitle.snp.bottom)
            make.height.equalTo(18)
        }
        
        
        
        starScoreLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-24)
            make.top.equalTo(self.contentView.snp.top).offset(12)
            make.height.equalTo(18)
        }
        
        let starImage = UIImageView()
        starImage.image = UIImage(systemName: "star.fill")
        starImage.clipsToBounds = true
        starImage.contentMode = .scaleAspectFit
        
        self.contentView.addSubview(starImage)
        starImage.snp.makeConstraints{ make in
            make.height.equalTo(16)
            make.width.equalTo(16)
            make.top.equalTo(13)
            make.trailing.equalTo(starScoreLabel.snp.leading).offset(-4)
            //make.bottom.equalTo(-84)
        }
    }
    
    
    
}
