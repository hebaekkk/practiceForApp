//
//  PGMSubView.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/22.
//

import UIKit

class PGMSubView: UIView {

    @IBOutlet weak var elevatorBtnView: UIView!
    
    @IBOutlet weak var carView: UIView!
    
    @IBOutlet weak var carBtnView: UIView!
    
    let elevatorBtnText = ["있음","없음","지하층"]
    let carBtnText = ["1톤 트럭","2톤 트럭","5톤 집게"]
    
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
    
    func commonInit() {
        setElevatorView()
        setCarView()
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
    
    func setCarView() {
        let buttonView = DynamicButtonView(frame: CGRect(x: 0, y: 0, width: carBtnView.frame.width, height: carBtnView.frame.height))
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.commonInit(with: carBtnText, row: 1, column: 3)
        
        carBtnView.addSubview(buttonView)
        
        buttonView.leadingAnchor.constraint(equalTo: carBtnView.leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: carBtnView.trailingAnchor).isActive = true
        buttonView.topAnchor.constraint(equalTo: carBtnView.topAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: carBtnView.bottomAnchor).isActive = true
    }
    
    func setPlusIconView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 5
        
        /*
        1)작업 차량
        2)작업 요청 인원
         */
        
        let roomNumView = QuantityBtnView()
        roomNumView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        roomNumView.title.text = "작업 차량"
        
        let bathNumView = QuantityBtnView()
        bathNumView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        bathNumView.title.text = "작업 요청 인원"
        

        
        addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12).isActive = true
        stackView.topAnchor.constraint(equalTo: carView.bottomAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true

        stackView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        stackView.addArrangedSubview(roomNumView)
        stackView.addArrangedSubview(bathNumView)

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
