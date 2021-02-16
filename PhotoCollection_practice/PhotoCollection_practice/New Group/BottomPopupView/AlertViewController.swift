//
//  AlertViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/16.
//

import UIKit
import SnapKit

protocol AlertViewDelegate: class {
    func pressOkButton()
}

class AlertViewController: UIViewController {

    weak var delegate: AlertViewDelegate?
    
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
    
    let maxLabel: UILabel = {
        let label = UILabel()
        label.text = "MAX"
        
        return label
    }()
    
    let minLabel: UILabel = {
        let label = UILabel()
        label.text = "MIN"
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
        popupView.addSubview(maxLabel)
        popupView.addSubview(minLabel)
        
        maxLabel.snp.makeConstraints{ make in
            make.top.equalTo(popupView).offset(15)
            make.centerX.equalTo(popupView)
        }
        minLabel.snp.makeConstraints{ make in
            make.top.equalTo(maxLabel.snp_bottom).offset(15)
            make.centerX.equalTo(popupView)
        }
        button.snp.makeConstraints{ make in
            make.centerX.equalTo(popupView)
            make.width.equalTo(popupView)
            make.height.equalTo(60)
            make.bottom.equalTo(popupView)
        }
        button.addTarget(self, action: #selector(pressOkHandler), for: .touchUpInside)
    }

    @objc func pressOkHandler() {
        delegate?.pressOkButton()
        dismiss(animated: true, completion: nil)
    }

}
