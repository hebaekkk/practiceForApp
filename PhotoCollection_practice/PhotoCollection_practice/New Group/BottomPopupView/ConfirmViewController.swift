//
//  ConfirmViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/16.
//

import UIKit
import SnapKit

class ConfirmViewController: UIViewController {

    
    let popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        button.setTitle("OK", for: .normal)
        return button
    }()
    
    let confirmLabel: UILabel = {
        let label = UILabel()
        label.text = "견적이 제출되었습니다"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(popupView)
        popupView.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.height.equalTo(280)
            make.width.equalTo(300)
        }
        
        popupView.addSubview(button)
        popupView.addSubview(confirmLabel)
        
        confirmLabel.snp.makeConstraints{ make in
            make.top.equalTo(popupView).offset(15)
            make.centerX.equalTo(popupView)
        }
        
        button.snp.makeConstraints{ make in
            make.centerX.equalTo(popupView)
            make.width.equalTo(popupView)
            make.height.equalTo(60)
            make.bottom.equalTo(popupView)
        }
        button.layer.cornerRadius = 12
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        button.addTarget(self, action: #selector(pressOkHandler), for: .touchUpInside)
        
    }
    
    @objc func pressOkHandler() {
        
        dismiss(animated: true, completion: nil)
    }

    



}
