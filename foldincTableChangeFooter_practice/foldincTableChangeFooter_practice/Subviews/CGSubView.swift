//
//  CGSubView.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/22.
//

import UIKit

class CGSubView: UIView {
    
    let elevatorBtnText = ["있음","없음","지하층"]
    
    @IBOutlet weak var elevatorBtnView: UIView!

    @IBOutlet weak var setTextView: UIView!
    @IBOutlet weak var textInputView: UIView!
    
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
        setPyView()
        setContentsView()
        //setPlusIconView()
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
    
    func setContentsView(){
        let wideTextView = WideTextFieldView(frame: CGRect(x: 0, y: 0, width: textInputView.frame.width, height: textInputView.frame.height))
        wideTextView.placeholderText = "직접 작성해주세요"
        wideTextView.translatesAutoresizingMaskIntoConstraints = false
        
        textInputView.addSubview(wideTextView)
        wideTextView.leadingAnchor.constraint(equalTo: textInputView.leadingAnchor).isActive = true
        wideTextView.trailingAnchor.constraint(equalTo: textInputView.trailingAnchor).isActive = true
        wideTextView.topAnchor.constraint(equalTo: textInputView.topAnchor).isActive = true
        wideTextView.bottomAnchor.constraint(equalTo: textInputView.bottomAnchor).isActive = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
