//
//  ViewController.swift
//  button_AutoLayout_practice
//
//  Created by BigHand on 2020/11/16.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel = UILabel()
    var stackView  = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitleLabel()
        configureStackView()
        
    }
    
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis         = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing      = 20
        
        addButtonsToStackView()
        //constraints
        setStackViewConstraints()
    }
    
    func addButtonsToStackView() {
        let numberOfButtons = 3
        
        for i in 1...numberOfButtons {
            let button = SurveyButton()
            button.setTitle("\(i)",for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(handleSelectedAvatar(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc func handleSelectedAvatar(_ sender: UIButton) {
        switch  sender.tag {
        case 1:
            print("A")
        case 2:
            print("B")
        case 3:
            print("C")
        default:
            print("a")
        }
    }
    func setStackViewConstraints() {
       stackView.translatesAutoresizingMaskIntoConstraints                                                           = false
       stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive                       = true
       stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive    = true
       stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
       stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive    = true
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text                      = "How would you rate this tutorial?"
        titleLabel.font                      = UIFont.boldSystemFont(ofSize: 36)
        titleLabel.textAlignment             = .center
        titleLabel.numberOfLines             = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        
        setTitleLabelConstraints()
    }
    
    func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
//    let myButton = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        myButton.setTitle("This is Button", for: .normal)
//        myButton.setTitleColor(.white, for: .normal)
//        myButton.backgroundColor = .darkGray
//        //myButton.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
//
//
//        self.view.addSubview(myButton)
//        myButton.translatesAutoresizingMaskIntoConstraints = false
//        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//        myButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        myButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
//    }


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
        setTitleColor(.white, for: .normal)
        backgroundColor  = .red
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 28)
        layer.cornerRadius = 10
    }
}

