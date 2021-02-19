//
//  InfoVC.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/19.
//

import UIKit

class InfoVC: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        let star = starAndLabel()
        view.addSubview(star)
        
        star.snp.makeConstraints{ make in
            make.height.equalTo(30)
            make.width.equalTo(100)
            make.trailing.equalTo(self.view).offset(-24)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
        }

        star.starLabel.text = "2424.23"


        let callButton = imageVerticalButton()
        view.addSubview(callButton)
        callButton.delegate = self
        callButton.tag = 1
        callButton.buttonLabel.text = "전화하기"
        callButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            make.width.equalTo(56)
            make.height.equalTo(80)
        }

        let idView = IDCardView()
        view.addSubview(idView)
        idView.snp.makeConstraints{ make in
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(200)
            make.width.equalTo(self.view)
            make.height.equalTo(200)
        }
        
        //callButton.button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    

}

extension InfoVC: imageVerticalButtonDelegate {
    @objc func buttonTapped(_ sender: UIButton) {
        print("HELLO")
        print(sender.tag)
    }
    
    
}
