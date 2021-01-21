//
//  DynamicButtonView.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/20.
//

import UIKit
import MaterialComponents

let column = 2

//row값 홀수일때 max Row값으로 넘겨 받아야해

class DynamicButtonView: UIView {

    private var buttonText: [String]? = []
    //var row: Int?

    let column = 2

    
//    init(buttonArray: [String], row: Int, column: Int) {
//        self.buttonText = buttonArray
//        self.row = row
//        self.column = column
//        super.init(frame: .zero)
//    }
//
    override init(frame: CGRect) {
        self.buttonText = nil
        //self.row = nil

        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func commonInit(with buttonText: [String]) {
        var containerScheme = MDCContainerScheme()
        
        backgroundColor = containerScheme.colorScheme.backgroundColor
        
        let VStackView = UIStackView()
        VStackView.axis = .vertical
        VStackView.distribution = .fillEqually
        VStackView.backgroundColor = .red
        VStackView.spacing = 20
        
        addSubview(VStackView)
        VStackView.translatesAutoresizingMaskIntoConstraints = false
        VStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        VStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        VStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        VStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        //var r = buttonText.count / column
        
        var cnt = 0
        
        let row = buttonText.count / column
        
        for i in 0..<row {
            let HStackView = UIStackView()
            HStackView.axis = .horizontal
            HStackView.distribution = .fillEqually
            HStackView.backgroundColor = .yellow
            HStackView.spacing = 10
            
            for j in 0..<column {
                let button = MDCButton()
                button.applyContainedTheme(withScheme: containerScheme)
    
                    button.setTitle("\(buttonText[column * i + j])", for: UIControl.State())
                    button.sizeToFit()
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.addTarget(self, action: #selector(tap), for: .touchUpInside)
                
                    cnt += 1
                    HStackView.addArrangedSubview(button)
                    

            }
            
            VStackView.addArrangedSubview(HStackView)
        }
        
    }
    
    @objc func tap(_ sender: Any) {
        print("\(type(of: sender)) was tapped.\n \(sender.self)")
     }
}
