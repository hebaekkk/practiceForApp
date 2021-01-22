//
//  JRSNSubView.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/22.
//

import UIKit
import MaterialComponents

class JRSNSubView: UIView {

    @IBOutlet weak var petBtnView: UIView!
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
    
    let petBtnText = ["있음","없음"]
    
    func commonInit() {
        setPetView()
        setPyView()
        setPlusIconView()
    }
        
    func setPetView() {
        let buttonView = DynamicButtonView(frame: CGRect(x: 0, y: 0, width: petBtnView.frame.width, height: petBtnView.frame.height))
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonView.commonInit(with: petBtnText, row: 1, column: 2)
        
        petBtnView.addSubview(buttonView)
        
        buttonView.leadingAnchor.constraint(equalTo: petBtnView.leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: petBtnView.trailingAnchor).isActive = true
        buttonView.topAnchor.constraint(equalTo: petBtnView.topAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: petBtnView.bottomAnchor).isActive = true
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
        
        /*
        1)방 개수
        2)욕실 개수
        3)베란다 개수
         */
        
        let roomNumView = QuantityBtnView()
        roomNumView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        roomNumView.title.text = "방 개수"
        
        let bathNumView = QuantityBtnView()
        bathNumView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        bathNumView.title.text = "욕실 개수"
        
        let verandaNumView = QuantityBtnView()
        verandaNumView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        verandaNumView.title.text = "주방 개수"
        
        addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12).isActive = true
        stackView.topAnchor.constraint(equalTo: setTextView.bottomAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true

        stackView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        stackView.addArrangedSubview(roomNumView)
        stackView.addArrangedSubview(bathNumView)
        stackView.addArrangedSubview(verandaNumView)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
