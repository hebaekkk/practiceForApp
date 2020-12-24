//
//  kindsBtnsVIew.swift
//  extendableCell_practice
//
//  Created by BigHand on 2020/12/24.
//

import UIKit

class kindsBtnsView: UIView {
    let View: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10.0, y: 40.0, width: UIScreen.main.bounds.size.width - 20, height: 21)
        label.text = "제목"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        
        label.backgroundColor = .green
        return label
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill

        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill

        stackView.distribution = .fillEqually
        
        stackView.spacing = 10
        return stackView
    }()
    
   // public var buttonText: [String] = {
//       public var buttonText: [String] = [
//                 "1","2","3","4"
//        ]
        //return buttonText
   // }()
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()

    }
    func setStackView() {
        let size = stackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    
        View.addSubview(stackView)

        
        stackView.addArrangedSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: View.topAnchor, constant: 4).isActive = true
        
        addButtonsToStackView()
        stackView1.leftAnchor.constraint(equalTo: View.leftAnchor, constant: 20).isActive = true
        stackView1.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
        stackView1.rightAnchor.constraint(equalTo: View.rightAnchor, constant: -30).isActive = true
        stackView1.bottomAnchor.constraint(equalTo: View.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        title.bottomAnchor.constraint(equalTo: stackView1.topAnchor, constant: -10).isActive = true
        title.leftAnchor.constraint(equalTo: stackView1.leftAnchor, constant: 0).isActive = true

    }
    

   public var buttonText: [String] = ["1","2","3","4","5","6"]


   public func addButtonsToStackView() {


        let numberOfButtons = buttonText.count

        let column = 2
        let row: Int

        if numberOfButtons % column != 0 {
            row = (numberOfButtons / column) + 1
        } else {
            row = numberOfButtons / column
        }

        for i in 0 ..< row {

            let horizontalSv = UIStackView()
            horizontalSv.axis = .horizontal
            //horizontalSv.alignment = .fill

            horizontalSv.distribution = .fillEqually
            horizontalSv.spacing = 8

            for j in 0 ..< column {
                if buttonText.count  == i*column + j {
                    let hideButton = SurveyButton()
                    // make tranparant !
                    hideButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
                    hideButton.layer.shadowOffset = CGSize(width: 0, height: 0)
                    hideButton.layer.shadowOpacity = 0
                    hideButton.layer.shadowRadius = 0
                    hideButton.layer.masksToBounds = false
                    hideButton.layer.shadowOffset = CGSize(width: 0, height: 0)
                    horizontalSv.addArrangedSubview(hideButton)
                    break
                }
                let button = SurveyButton()
                //button.setTitle("\(buttonText[ i*column + j  ])",for: .normal)
                button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 15)
                button.tag = i*column + j + 1
                button.addTarget(self, action: #selector(handleCleaningKinds(_:)), for: .touchUpInside)
                horizontalSv.addArrangedSubview(button)
            }


            stackView1.addArrangedSubview(horizontalSv)
        }
        stackView.addArrangedSubview(stackView1)
    }

    func setKindsColor(button: UIButton) {
        func updateSelectedState(_ isSelected: Bool) {
            button.layer.borderWidth = isSelected ? 1 : 0
            button.layer.borderColor = isSelected ? UIColor.systemPink.cgColor : UIColor.white.cgColor
            button.isSelected = isSelected
        }

        button.setTitleColor(UIColor.blue, for: .selected)

        button.clipsToBounds = true
        //button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
  }
    @objc func handleCleaningKinds(_ sender: UIButton) {

        setKindsColor(button: sender)
        deselectAllButtons()
        sender.isSelected = true

        //nextButton.sendActions(for: .touchUpInside)
        tag = sender.tag
    
    }

    func deselectAllButtons() {
        for subView in stackView.subviews {
            for sub in subView.subviews{ //cuz this is multi stack View !! ( Vertical + Horizontal )
                //print("\(sub.tag)")
                for sub1 in sub.subviews {
                    if let button = sub1 as? UIButton {
                        button.isSelected = false
                        button.clipsToBounds = false
                        button.layer.borderColor = UIColor.white.cgColor
                    }
                }
            }
        }
    }
    func setup() {
        addSubview(View)
        View.translatesAutoresizingMaskIntoConstraints = false
        setStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        setTitleColor(.blue, for: .normal)
        backgroundColor  = .white
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 20)
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        //shadow
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 4.0
        layer.masksToBounds = false
    }
}

