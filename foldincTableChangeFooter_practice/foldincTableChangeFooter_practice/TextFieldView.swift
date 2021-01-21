//
//  TextFieldView.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/21.
//

import UIKit

class TextFieldView: UIView {

    
    //var delegate : ProductCellDelegate?
    let minValue = 0
    
    let title: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 40, height: 21)
        label.text = "제목"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .black
        //label.numberOfLines = 0
        
        label.backgroundColor = .brown
        return label
    }()

    //Todo
    //1. frame 만들기
    let textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 24))
        textField.backgroundColor = .white
        textField.keyboardType = UIKeyboardType.numberPad
        textField.placeholder = "평"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 15)
        
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.black.cgColor

        //shadow
        //textField.layer.shadowColor = UIColor.black.cgColor
        //textField.layer.shadowOpacity = 0.5
        //textField.layer.shadowOffset = .zero
        //textField.layer.shadowRadius = 5
        return textField
    }()

    

    
    let View: UIView = {
        let view = UIView()
        //view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 100
        stackView.distribution = .fillEqually
        return stackView
    }()


    override init(frame: CGRect){
        super.init(frame: frame)
        //self.addSubview(stackView)
        //stackView.addArrangedSubview(<#T##view: UIView##UIView#>)
        setup()
        
    
         
         
     
    }

    
    func setup() {
        addSubview(View)
        //View.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)
        View.translatesAutoresizingMaskIntoConstraints = false
        View.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        View.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        View.topAnchor.constraint(equalTo: topAnchor).isActive = true
        View.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        View.backgroundColor = #colorLiteral(red: 1, green: 0.4823582768, blue: 1, alpha: 0.4848481754)
        

        
        View.addSubview(stackView)
        
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(textField)
        //setStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
