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
 
    override init(frame: CGRect) {
        self.buttonText = nil
        //self.row = nil

        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let VStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .red
        stackView.spacing = 20
        return stackView
    }()

    func commonInit(with buttonText: [String], row: Int, column: Int) {
        var containerScheme = MDCContainerScheme()
        
        backgroundColor = containerScheme.colorScheme.backgroundColor
        
        
        addSubview(VStackView)
        VStackView.translatesAutoresizingMaskIntoConstraints = false
        VStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        VStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        VStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        VStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        

        if row * column == buttonText.count {
            //버튼갯수가 딱 맞아 떨어진다면 원래대로 실행
            for i in 0..<row {
                let HStackView = UIStackView()
                HStackView.axis = .horizontal
                HStackView.distribution = .fillEqually
                HStackView.backgroundColor = .yellow
                HStackView.spacing = 10
                
                for j in 0..<column {
                    let button = MDCButton()
                    button.applyContainedTheme(withScheme: containerScheme)
                    button.setBorderWidth(1.5, for: .normal)
                    button.setBorderColor(.gray, for: .normal)
                    button.backgroundColor = .white
                    
                    button.setTitle("\(buttonText[column * i + j])", for: .normal)
                    //button.titleLabel!.text = "\(buttonText[column * i + j])"
                    button.setTitleColor(.gray, for: UIControl.State())
                    button.titleLabel?.textColor = .black
                    button.sizeToFit()
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.addTarget(self, action: #selector(tap), for: .touchUpInside)
                    

                        HStackView.addArrangedSubview(button)
                        
                }
                
                VStackView.addArrangedSubview(HStackView)
                
            }
           
        } else {
            //그렇지 않다면 Dummy Button 만들어서 alpha = 0 처리 해줘야돼 !
            for i in 0..<row{
                let HStackView = UIStackView()
                HStackView.axis = .horizontal
                HStackView.distribution = .fillEqually
                HStackView.backgroundColor = .yellow
                HStackView.spacing = 10
                for j in 0..<column {
                    let button = MDCButton()
                    button.applyContainedTheme(withScheme: containerScheme)
                    
                    if column * i + j < buttonText.count {
                        button.setTitle("\(buttonText[column * i + j])", for: UIControl.State())
                        button.translatesAutoresizingMaskIntoConstraints = false
                        button.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
                        
                    } else {
                        button.setTitle("Dummy", for: UIControl.State())
                        button.translatesAutoresizingMaskIntoConstraints = false
                        button.alpha = 0
                        //alpha = 0 으로 만들기
                    }
                    HStackView.addArrangedSubview(button)
                    
                }
                VStackView.addArrangedSubview(HStackView)
            }
        }
        
        
        
        
//        for i in 0..<row {
//            let HStackView = UIStackView()
//            HStackView.axis = .horizontal
//            HStackView.distribution = .fillEqually
//            HStackView.backgroundColor = .yellow
//            HStackView.spacing = 10
//
//            for j in 0..<column {
//                let button = MDCButton()
//                button.applyContainedTheme(withScheme: containerScheme)
//
//                    button.setTitle("\(buttonText[column * i + j])", for: UIControl.State())
//                    button.sizeToFit()
//                    button.translatesAutoresizingMaskIntoConstraints = false
//                    button.addTarget(self, action: #selector(tap), for: .touchUpInside)
//
//                    cnt += 1
//                    HStackView.addArrangedSubview(button)
//
//
//            }
//
//            VStackView.addArrangedSubview(HStackView)
//        }
        
    }
    
    @objc func tap(_ sender: MDCButton) {
        sender.isSelected = !sender.isSelected
        print("\(sender.isSelected)\n")
        func updateSelectedState(_ isSelected: Bool) {
            if isSelected {
                sender.setBorderColor(.purple, for: .normal)
                sender.setTitleColor(.purple, for: .normal)
            } else {
                sender.setBorderColor(.gray, for: .normal)
                sender.setTitleColor(.gray, for: .normal)
            }
        }
        updateSelectedState(sender.isSelected)
        deselectButtons(stackView: VStackView)
        print("\(type(of: sender)) was tapped.\n \(String(describing: sender.titleLabel?.text))")

     }
    
//    func deselectButtons(stackView: UIStackView) {
//        for subView in stackView.subviews {//VStack의 SubViews: subView(HStack)
//            print("1DESELECT")
//            for sub in subView.subviews {//HStack의 SubViews
//                print("2DESELECT")
//
//            }
//        }
//    }
//
    
    func deselectButtons(stackView: UIStackView) {
        for subView in stackView.subviews {
            print("1STACK : \(subView)")
            for sub in subView.subviews{ //cuz this is multi stack View !! ( Vertical + Horizontal )
                //print("\(sub.tag)")
                let b = sub as? MDCButton
                if (b?.isSelected)! == false {
                    //b?.isSelected = false
                    print("2STACK \(b?.isSelected)다")
                    b?.setBorderColor(.gray, for: .normal)
                    //b?.setBorderColor(.gray, for: .normal)
                }
                print("2STACK : \(String(describing: b?.titleLabel?.text)), SELECT? : \((b?.isSelected)!)")
  
            }
        }
    }

}
