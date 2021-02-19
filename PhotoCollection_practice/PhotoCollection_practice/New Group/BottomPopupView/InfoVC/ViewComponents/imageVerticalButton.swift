//
//  imageVerticalButton.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/19.
//

import UIKit
protocol imageVerticalButtonDelegate: class {
    func buttonTapped(_ sender : UIButton)
}

class imageVerticalButton: UIView {

    var delegate: imageVerticalButtonDelegate?
    
    let buttonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "phone")
        return imageView
    }()
    
    let buttonLabel: UILabel = {
        let label = UILabel()
        label.text = "5.5"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.6054057479, green: 0.4378138781, blue: 0.9071695209, alpha: 0.5)
        return button
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
        addSubview(buttonImage)
        addSubview(buttonLabel)
        addSubview(button)
        
        buttonImage.snp.makeConstraints{ make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        buttonLabel.snp.makeConstraints{ make in
            make.top.equalTo(buttonImage.snp_bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
        }
        button.snp.makeConstraints{ make in
            //make.height.equalTo(80)
            //make.width.equalTo(56)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
