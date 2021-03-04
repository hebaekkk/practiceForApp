//
//  estimationView.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/22.
//

import UIKit
import SnapKit

class EstimationView: UIView {

    let estimationPriceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let estimationMessageView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let estimationTitle: UILabel = {
        let label = UILabel()
        label.text = "예상금액"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "남길 메세지"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("ESTIMATIONVIEW : init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(estimationPriceView)
        addSubview(estimationMessageView)
        
        backgroundColor = .clear
        estimationPriceView.translatesAutoresizingMaskIntoConstraints = false
        estimationMessageView.translatesAutoresizingMaskIntoConstraints = false
        estimationTitle.translatesAutoresizingMaskIntoConstraints = false
        
        estimationPriceView.snp.makeConstraints{ make in
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(100)
        }
        estimationPriceView.addSubview(estimationTitle)
        estimationTitle.snp.makeConstraints{ make in
            make.centerX.equalTo(self)
            make.height.equalTo(30)
            make.top.equalTo(self).offset(8)
        }
        
        let messageTitle = UILabel()
        messageTitle.text = "남기실 메세지"
        messageTitle.font = UIFont.boldSystemFont(ofSize: 20)
        
        estimationMessageView.addSubview(messageTitle)
        estimationMessageView.snp.makeConstraints{ make in
            make.top.equalTo(estimationPriceView.snp.bottom).offset(8)
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.bottom.equalTo(120)
        }
        messageTitle.snp.makeConstraints{ make in
            make.centerX.equalTo(estimationMessageView)
            make.top.equalTo(8)
            make.height.equalTo(30)
        }
        
        
        
    }
    
}
