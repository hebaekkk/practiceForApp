//
//  BasicModalViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/09.
//

import UIKit
import PanModal
import SnapKit
import SkyFloatingLabelTextField

protocol BasicModalDelegate: class {
    func pressSubmitButton()
    func sendMax(max: String)
}

class BasicModalViewController: UIViewController {

    //viewToShake.layer.add(animation, forKey: "position")
    
    weak var delegate: BasicModalDelegate?
    
    var isKeyboard: Bool?
    var isComparable: Bool?
    
    let modalTitle: UILabel = {
        let lb = UILabel()
        lb.text = "예상 금액을 입력해주세요."
        lb.font = UIFont.systemFont(ofSize: 24)
        return lb
    }()
    
    let maxTitle: UILabel = {
        let lb = UILabel()
        lb.text = "최대"
        //lb.frame = CGRect(x: 0, y: 0, width: 30, height: 60)
        lb.backgroundColor = .orange
        lb.font = UIFont.systemFont(ofSize: 15)
        
        return lb
    }()
    let maxTextField: SkyFloatingLabelTextField = {
        let tf = SkyFloatingLabelTextField()
        tf.textAlignment = .left
        tf.placeholder = "최대"
        tf.keyboardType = .numberPad
        tf.title = "Max"
        //tf.frame = CGRect(x: 0, y: 0, width: 80, height: 60)
        tf.sizeToFit()
        tf.font = UIFont.systemFont(ofSize: 24)
        tf.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return tf
    }()
    
    let minTitle: UILabel = {
        let lb = UILabel()
        lb.text = "최소"
        //lb.frame = CGRect(x: 0, y: 0, width: 30, height: 60)
        lb.backgroundColor = .orange
        lb.font = UIFont.systemFont(ofSize: 15)
        
        return lb
    }()
    let minTextField: SkyFloatingLabelTextField = {
        let tf = SkyFloatingLabelTextField()
        tf.placeholder = "최소"
        tf.keyboardType = .numberPad
        tf.title = "Min"
        //tf.frame = CGRect(x: 0, y: 0, width: 80, height: 60)
        tf.sizeToFit()
        tf.font = UIFont.systemFont(ofSize: 24)
        tf.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return tf
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        //self.view.gestureRecognizers?[0].isEnabled = false
    
        self.view.gestureRecognizers?.removeAll()


        view.addSubview(modalTitle)
        //view.addSubview(maxTitle)
        //view.addSubview(textField)
        self.isComparable = false
        self.isKeyboard = false
        maxTextField.delegate = self
        minTextField.delegate = self
        
        maxTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        minTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(BasicModalViewController.keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(BasicModalViewController.keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil
                                                )
        
        
        modalTitle.snp.makeConstraints{(make) in
            make.centerX.equalTo(self.view.center)
            make.top.equalTo(self.view).offset(20)
            make.height.equalTo(36)
        }
        
        
        let maxStackView = UIStackView()
        maxStackView.backgroundColor = .red
        maxStackView.axis = .horizontal
        maxStackView.spacing = 0
        maxStackView.distribution = .fillProportionally
        
        view.addSubview(maxStackView)
        
        maxStackView.addArrangedSubview(maxTitle)
        maxStackView.addArrangedSubview(maxTextField)
        
        maxTitle.snp.makeConstraints{ (make) in
            make.height.equalTo(60)
            make.width.equalTo(40)
        }
        let width = UIScreen.main.bounds.width - 48 - 40
        maxTextField.snp.makeConstraints{ (make) in
            make.height.equalTo(60)
            make.width.equalTo(width)
            
        }
        maxStackView.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            //make.trailing.equalTo(self.view).offset(-24)
            make.top.equalTo(modalTitle.snp_bottom).offset(10)
            make.height.equalTo(60)
        }
        
        let minStackView = UIStackView()
        minStackView.axis = .horizontal
        minStackView.spacing = 0
        minStackView.distribution = .fillProportionally
        
        view.addSubview(minStackView)
        minStackView.addArrangedSubview(minTitle)
        minStackView.addArrangedSubview(minTextField)
        
        minTitle.snp.makeConstraints{ (make) in
            make.height.equalTo(60)
            make.width.equalTo(40)
        }
        
        minTextField.snp.makeConstraints{ (make) in
            make.height.equalTo(60)
            make.width.equalTo(width)
            
        }
        minStackView.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.view)
            //make.trailing.equalTo(self.view).offset(-24)
            make.top.equalTo(maxStackView.snp_bottom).offset(10)
            make.height.equalTo(60)
        }
        
        let cancleBtn = UIButton()
        cancleBtn.setTitle("취소", for: .normal)
        cancleBtn.backgroundColor = .gray
        cancleBtn.setTitleColor(.white, for: .normal)
        
        let submitBtn = UIButton()
        submitBtn.setTitle("견적 제출", for: .normal)
        submitBtn.backgroundColor = .purple
        submitBtn.setTitleColor(.white, for: .normal)
        
        let bottomButtonStack = UIStackView()
        bottomButtonStack.axis = .horizontal
        bottomButtonStack.spacing = 0
        
        view.addSubview(bottomButtonStack)
        bottomButtonStack.addArrangedSubview(cancleBtn)
        bottomButtonStack.addArrangedSubview(submitBtn)
        
        let screenWidth = UIScreen.main.bounds.width
        
        cancleBtn.snp.makeConstraints{ (make) in
            make.width.equalTo(117)
            make.height.equalTo(60)
        }
        
        submitBtn.snp.makeConstraints{ (make) in
            make.width.equalTo(screenWidth - 117)
            make.height.equalTo(60)
        }
        
        bottomButtonStack.snp.makeConstraints{ (make) in
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.height.equalTo(60)
            make.top.equalTo(minStackView.snp_bottom).offset(10)
        }
        
        
        submitBtn.addTarget(self, action: #selector(pressSubmitButtonHandler), for: .touchUpInside)
        
    }
    // MARK : Submit button press
    @objc func pressSubmitButtonHandler() {
        delegate?.pressSubmitButton()
        delegate?.sendMax(max: maxTextField.text!)
        dismiss(animated: true, completion: nil)
    }
    
    var keySize: CGFloat?

    @objc func keyboardWillShow(notification: Notification) {
        print("키보드!")
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print("까꿍")
            self.isKeyboard = true
            self.keySize = keyboardSize.height
            
            panModalSetNeedsLayoutUpdate()
            panModalTransition(to: .shortForm)

        }

    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        print("빠잉")
      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        print("빠이라고~!")
        //let keybaordRectangle = keyboardFrame.cgRectValue
        //let keyboardHeight = keybaordRectangle.height
        self.isKeyboard = false
        panModalSetNeedsLayoutUpdate()
        panModalTransition(to: .shortForm)
      }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)

   }
    

}

extension BasicModalViewController: PanModalPresentable {

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    var panScrollable: UIScrollView? {
        return nil
    }
    
    //////이것이 해답
//    var allowsDragToDismiss: Bool {
//        return false
//    }
    
//
//    var isUserInteractionEnabled: Bool {
//        return false
//    }

//    var allowsExtendedPanScrolling: Bool {
//        return false
//    }
    
    var showDragIndicator: Bool {
        return false
    }
    ///////modal stretch 막자 !!!
    
//    var shortFormHeight: PanModalHeight {
//        return self.isKeyboard! ? .contentHeight(self.keySize! + 22) : .contentHeight(300)
//    }
    var anchorModalToLongForm: Bool {
        return false
    }
    var longFormHeight: PanModalHeight {
        if self.isKeyboard! {
            print("a")
            let spacing = UIScreen.main.bounds.height - self.keySize! - 300
            return .maxHeightWithTopInset(spacing)//.maxHeightWithTopInset(100)
        } else {
            print("b")
            return .maxHeightWithTopInset(UIScreen.main.bounds.height - 300)
        }
        
    }
    
}

extension BasicModalViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            if let floatingLabelTextField = textField as? SkyFloatingLabelTextField {
                if (text.first == "0") {
                    floatingLabelTextField.errorMessage = "Invalid num"
                } else {
                    floatingLabelTextField.errorMessage = ""
                }
            }
        }
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        self.isComparable = false
        if (string.first == "0" && textField.text == "") {
            return false
        } else {
            
            if (!(minTextField.text!.isEmpty) && !(maxTextField.text!.isEmpty)) {
                self.isComparable = true
            } else {
                self.isComparable = false
            }
//
//            let formatter = NumberFormatter()
//            formatter.numberStyle = .decimal
//            formatter.locale = Locale.current
//            formatter.maximumFractionDigits = 0
//
//            if let removeAllSeperator = textField.text?.replacingOccurrences(of: formatter.groupingSeparator, with: "") {
//                var beforeForemattedString = removeAllSeperator + string
//                if formatter.number(from: string) != nil {
//                    if let formattedNumber = formatter.number(from: beforeForemattedString),
//                       let formattedString = formatter.string(from: formattedNumber) {
//                        textField.text = formattedString
//                        return false
//                    }
//                }
//            }
            
            
            
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let floatingLabelTextField = textField as? SkyFloatingLabelTextField
    
        
        if self.isComparable! {
            
            let minVal = Int(self.minTextField.text!)!
            let maxVal = Int(self.maxTextField.text!)!
        
            if minVal <= maxVal {
                floatingLabelTextField!.errorMessage = ""
                self.minTextField.errorMessage = ""
                self.maxTextField.errorMessage = ""
                print("OK")
            } else {
                print("case 2")
                floatingLabelTextField?.shake()
                floatingLabelTextField!.errorMessage = "Invalid num"
                
                print("FAIL")
            }
            
        } else {
            
            if (self.minTextField.text!.isEmpty || ((self.maxTextField.text?.isEmpty) != nil)) {
                floatingLabelTextField!.errorMessage = ""
                self.minTextField.errorMessage = ""
                self.maxTextField.errorMessage = ""
            } else {
            
                floatingLabelTextField?.shake()
                floatingLabelTextField!.errorMessage = "Invalid num"
            }
        }
    }

}

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.5, 2.5, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
