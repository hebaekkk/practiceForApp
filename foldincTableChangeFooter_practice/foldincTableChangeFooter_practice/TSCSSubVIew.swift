//
//  TSCSSubVIew.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/21.
//

import UIKit
import MaterialComponents

class TSCSSubView: UIView {
    
    @IBOutlet weak var elevatorBtnView: UIView!
    @IBOutlet weak var setTextView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let name = String(describing: type(of: self))
        let nib = UINib(nibName: name, bundle: Bundle.main)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
        //setElevatorView()
        commonInit()
    }
    
    let elevatorBtnText = ["있음", "없음", "지하층"]
    func commonInit() {
        setElevatorView()
        setPyView()
        setPlusIconView()
    }
    
    func setElevatorView() {
        let buttonView = DynamicButtonView(frame: CGRect(x: 0, y: 0, width: elevatorBtnView.frame.width, height: elevatorBtnView.frame.height))
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.commonInit(with: elevatorBtnText, row: 1, column: 3)
        
        elevatorBtnView.addSubview(buttonView)
        
        buttonView.leadingAnchor.constraint(equalTo: elevatorBtnView.leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: elevatorBtnView.trailingAnchor).isActive = true
        buttonView.topAnchor.constraint(equalTo: elevatorBtnView.topAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: elevatorBtnView.bottomAnchor).isActive = true
    
    }
    
    func setPyView() {
        let pyView = TextFieldView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        pyView.translatesAutoresizingMaskIntoConstraints = false
        pyView.title.text = "평수"
        
        setTextView.addSubview(pyView)
        pyView.leadingAnchor.constraint(equalTo: setTextView.leadingAnchor).isActive = true
        pyView.trailingAnchor.constraint(equalTo: setTextView.trailingAnchor).isActive = true
        pyView.topAnchor.constraint(equalTo: setTextView.topAnchor).isActive = true
        pyView.bottomAnchor.constraint(equalTo: setTextView.bottomAnchor).isActive = true
    }
    func setPlusIconView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        let view1 = QuantityBtnView()
        view1.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        view1.backgroundColor = .red
        let view2 = QuantityBtnView()
        view2.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        view2.backgroundColor = .orange
        let view3 = QuantityBtnView()
        view3.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        view3.backgroundColor = .yellow
        
        addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12).isActive = true
        stackView.topAnchor.constraint(equalTo: setTextView.bottomAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true

        stackView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(view3)
    }
    
    @objc func tap(_ sender: UIButton) {
        print("\(type(of: sender.titleLabel?.text)) was tapped.\n \(sender.self)")
     }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
