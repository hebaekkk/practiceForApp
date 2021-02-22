//
//  estimationView.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/22.
//

import UIKit
import SnapKit

class EstimationView: UIView {

//    let view: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        return view
//    }()
    
    let estimationTitle: UILabel = {
        let label = UILabel()
        label.text = "예상금액"
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
        //view.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white
        estimationTitle.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(estimationTitle)
        estimationTitle.snp.makeConstraints{ make in
            make.centerX.equalTo(self)
            make.height.equalTo(30)
            make.top.equalTo(self).offset(12)
        }
    }
    
}
