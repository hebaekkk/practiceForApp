//
//  stackButton.swift
//  ExpandableTableView
//
//  Created by BigHand on 2020/12/29.
//  Copyright © 2020 Pratik Lad. All rights reserved.
//

import UIKit

class stackButton: UIView {
    
    var view = UIView()
    
    var stackView  = UIStackView()
    var buttonText: [String] = [
        "특수청소",
        "정리수납",
//        "폐기물",
//        "철거"
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        
        //configureStackView()
        let btn = SurveyButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
       
        
        //setStackViewConstraints()
        //stackView.addSubview(btn)
        view.addSubview(btn)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configureStackView() {
        addSubview(stackView)
        stackView.axis         = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing      = 0
        
        addButtonsToStackView()
        //setStackViewConstraints()
    }
    func addButtonsToStackView() {
        let numberOfButtons = buttonText.count
        
        for i in 1...numberOfButtons {
            let button = SurveyButton()
            button.setTitle(buttonText[ i-1 ],for: .normal)
            button.tag = i
           // button.addTarget(self, action: #selector(handleCleaningKinds(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    private func commonInit() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = self.bounds
        
        self.addSubview(view)
    }


}

class SurveyButton: UIButton {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    func setupButton() {
        setTitleColor(UIColor.gray, for: .normal)
        backgroundColor  = .white
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 20)
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        //shadow
        //layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        //layer.shadowOffset = CGSize(width: 0, height: 2)
        //layer.shadowOpacity = 1.0
        //layer.shadowRadius = 4.0
        layer.masksToBounds = false
    }
}
