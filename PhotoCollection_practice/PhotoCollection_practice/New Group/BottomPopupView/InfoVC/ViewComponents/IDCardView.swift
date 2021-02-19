//
//  IDCardView.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/19.
//

import UIKit
import SnapKit

class IDCardView: UIView {


    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "dora")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let teamTitle: UILabel = {
        let label = UILabel()
        label.text = "팀리사이클"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let cleanKind: UILabel = {
        let label = UILabel()
        label.text = "특수청소/폐기물"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let star: UIView = {
        let view = starAndLabel()
        return view
    }()
    
    let chatButton: UIView = {
        let view = imageVerticalButton()
        view.buttonImage.image = UIImage(systemName: "message")
        view.buttonLabel.text = "1:1 채팅"
        return view
    }()
    
    let callButton: UIView = {
        let view = imageVerticalButton()
        view.buttonLabel.text = "전화걸기"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        backgroundColor = #colorLiteral(red: 0.6054057479, green: 0.4378138781, blue: 0.9071695209, alpha: 0.3317997685)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(imageView)
        addSubview(teamTitle)
        addSubview(cleanKind)
        addSubview(star)
        //addSubview(chatButton)
        //addSubview(callButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        teamTitle.translatesAutoresizingMaskIntoConstraints = false
        cleanKind.translatesAutoresizingMaskIntoConstraints = false
        star.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.snp.makeConstraints{ make in
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.leading.equalTo(self).offset(24)
            make.top.equalTo(self).offset(24)
            make.top.equalTo(star.snp_top)
        }
        
        teamTitle.snp.makeConstraints{ make in
            make.leading.equalTo(imageView.snp_trailing).offset(10)
            make.top.equalTo(self).offset(24)
            //make.height.equalTo(32)

        }

        cleanKind.snp.makeConstraints{ make in
            make.leading.equalTo(imageView.snp_trailing).offset(10)
            make.top.equalTo(teamTitle.snp_bottom).offset(0)
            make.height.equalTo(14)

        }

        star.snp.makeConstraints{ make in
            make.trailing.equalTo(self).offset(-24)
            make.top.equalTo(self).offset(24)
            make.height.equalTo(20)
            //make.width.equalTo(60)

        }
//
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.spacing = 8
        buttonStack.distribution = .fillEqually
        
        buttonStack.addArrangedSubview(chatButton)
        buttonStack.addArrangedSubview(callButton)
        
//        addSubview(buttonStack)
//        buttonStack.snp.makeConstraints{ make in
//            make.trailing.equalTo(self).offset(-24)
//            make.bottom.equalTo(self).offset(-24)
//            make.height.equalTo(70)
//        }
    }
}
