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
    //MARK : Property Setting
    weak var delegate: BasicModalDelegate?
    
    var isKeyboard: Bool?
    var isComparable: Bool?
    
    private var scrollView = UIScrollView.init()
    private var contentView = UIView()
    
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
        //lb.backgroundColor = .orange
        lb.font = UIFont.systemFont(ofSize: 15)
        
        return lb
    }()
    let maxTextField: SkyFloatingLabelTextField = {
        let tf = SkyFloatingLabelTextField()
        tf.textAlignment = .left
        tf.placeholder = "최대값 입력"
        tf.keyboardType = .numberPad
        tf.title = "최대"
        tf.titleColor = .black
        //tf.frame = CGRect(x: 0, y: 0, width: 80, height: 60)
        tf.sizeToFit()
        tf.font = UIFont.systemFont(ofSize: 24)
        
        //tf.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return tf
    }()
    
    let minTitle: UILabel = {
        let lb = UILabel()
        lb.text = "최소"
        //lb.frame = CGRect(x: 0, y: 0, width: 30, height: 60)
        //lb.backgroundColor = .orange
        lb.font = UIFont.systemFont(ofSize: 15)
        
        return lb
    }()
    let minTextField: SkyFloatingLabelTextField = {
        let tf = SkyFloatingLabelTextField()
        tf.placeholder = "최소값 입력"
        tf.keyboardType = .numberPad
        tf.title = "최소"
        tf.titleColor = .black
        //tf.frame = CGRect(x: 0, y: 0, width: 80, height: 60)
        tf.sizeToFit()
        tf.font = UIFont.systemFont(ofSize: 24)
        //tf.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return tf
    }()
    let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.cornerRadius = 12
        return textView
    }()
    
    let noticeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "견적선택 확률을 높이기 위한 Tip!\n\n1. 업체의 장점을 적어주세요. (예: 마루철거만 20년, 베테랑 일꾼만 모여 있습니다)\n2. 무료견적 방문 가능 여부를 적어주세요 (연락 주시면, 무료방문견적 가능합니다)\n3. 투입인원 및 차량 조건 등을 적어주세요 (1톤 트럭 1대, 3명 투입 작업 예정)\n4. 블로그로의 방문을 유도해보세요 (블로그에 보시면 저희팀의 작업 내용을 모두 보실 수 있습니다"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        //self.view.gestureRecognizers?[0].isEnabled = false
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint.init(item: contentView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0)
        heightConstraint.priority = UILayoutPriority.init(200)
        
        scrollView.backgroundColor = #colorLiteral(red: 0.3587837815, green: 0.4740935564, blue: 0.9081168771, alpha: 0.5)
        contentView.backgroundColor = #colorLiteral(red: 0.0752857849, green: 0.8137568831, blue: 0.5408281684, alpha: 0.5)
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()//(self.view)//.offset(10)
            make.bottom.equalToSuperview()//(self.view)//.offset(0)
            make.width.equalTo(self.view)
            make.height.equalTo(self.view)
        }
        let padding = self.navigationController?.navigationBar.frame.maxY ?? 0
        print(" PADDING : \(padding)")
        self.scrollView.addSubview(contentView)
        self.scrollView.addConstraints([
          self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
          self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0),
          self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
          self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
          ])
        self.view.addConstraints([
          self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
          heightConstraint,
          ])
        

        contentView.addSubview(modalTitle)
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
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(self.contentView).offset(20)
            make.height.equalTo(36)
        }
        
//
//        let maxStackView = UIStackView()
//        //maxStackView.backgroundColor = .red
//        maxStackView.axis = .horizontal
//        maxStackView.spacing = 0
//        maxStackView.distribution = .fillProportionally
//
//        contentView.addSubview(maxStackView)
        
        //maxStackView.addArrangedSubview(maxTitle)
        //maxStackView.addArrangedSubview(maxTextField)
        
        contentView.addSubview(minTextField)
        contentView.addSubview(maxTextField)
//        maxTitle.snp.makeConstraints{ (make) in
//            make.height.equalTo(60)
//            make.width.equalTo(40)
//        }
//        let width = UIScreen.main.bounds.width - 48 - 40
//        maxTextField.snp.makeConstraints{ (make) in
//            make.height.equalTo(60)
//            make.width.equalTo(width)
//
//        }
        minTextField.snp.makeConstraints{ (make) in
            make.leading.equalTo(self.contentView).offset(24)
            //make.trailing.equalTo(self.view).offset(-24)
            make.trailing.equalTo(self.contentView).offset(-24)
            make.top.equalTo(modalTitle.snp_bottom).offset(20)
            make.height.equalTo(60)
        }
        
//        let minStackView = UIStackView()
//        minStackView.axis = .horizontal
//        minStackView.spacing = 0
//        minStackView.distribution = .fillProportionally
//
//        contentView.addSubview(minStackView)
//        minStackView.addArrangedSubview(minTitle)
//        minStackView.addArrangedSubview(minTextField)
        
//        minTitle.snp.makeConstraints{ (make) in
//            make.height.equalTo(60)
//            make.width.equalTo(40)
//        }
//
//        minTextField.snp.makeConstraints{ (make) in
//            make.height.equalTo(60)
//            make.width.equalTo(width)
//
//        }
        maxTextField.snp.makeConstraints{ (make) in
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).offset(-24)
            //make.width.equalTo(self.view.frame.width - 48)
            make.top.equalTo(minTextField.snp_bottom).offset(10)
            make.height.equalTo(60)
        }
        
        //Dynamic textView
        let textViewTitle = UILabel()
        textViewTitle.textAlignment = .left
        textViewTitle.text = "고객전달 메세지"
        contentView.addSubview(textViewTitle)
        contentView.addSubview(textView)
        
        textViewTitle.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView).offset(24)
            make.bottom.equalTo(textView.snp_top).offset(-4)
            make.trailing.equalTo(self.contentView).offset(-24)
            make.top.equalTo(maxTextField.snp_bottom).offset(20)
        }
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        //textView.delegate = self
        
        
        textView.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView).offset(24)
            make.trailing.equalTo(self.contentView).offset(-24)
            make.top.equalTo(textViewTitle.snp_bottom).offset(20)
            make.height.equalTo(60)
            
        }
        
        let bottomButtonStack = UIStackView()
        bottomButtonStack.axis = .horizontal
        bottomButtonStack.spacing = 0
        
        contentView.addSubview(bottomButtonStack)

        
        
        //Notice Label
        contentView.addSubview(noticeLabel)
        noticeLabel.snp.makeConstraints{ make in
            make.top.equalTo(textView.snp_bottom).offset(30)
            make.leading.equalTo(self.contentView).offset(24)
            make.trailing.equalTo(self.contentView).offset(-24)
            make.bottom.equalTo(bottomButtonStack.snp_top).offset(-40)
        }
        
        textView.isScrollEnabled = true
        textViewDidChange(textView)
        
        let cancleBtn = UIButton()
        cancleBtn.setTitle("취소", for: .normal)
        cancleBtn.backgroundColor = .gray
        cancleBtn.setTitleColor(.white, for: .normal)
        
        let submitBtn = UIButton()
        submitBtn.setTitle("견적 제출", for: .normal)
        submitBtn.backgroundColor = .purple
        submitBtn.setTitleColor(.white, for: .normal)
        
            
        
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
            make.leading.equalTo(self.contentView)
            make.trailing.equalTo(self.contentView)
            make.height.equalTo(60)
            make.top.equalTo(noticeLabel.snp_bottom).offset(20)
            make.bottom.equalTo(self.contentView).offset(-40)
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
            
            //panModalSetNeedsLayoutUpdate()
            //panModalTransition(to: .shortForm)

        }

    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        print("빠잉")
      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        print("빠이라고~!")
        //let keybaordRectangle = keyboardFrame.cgRectValue
        //let keyboardHeight = keybaordRectangle.height
        
        self.isKeyboard = false
        //panModalSetNeedsLayoutUpdate()
        //panModalTransition(to: .shortForm)
      }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        print("키보드 내려")
        self.view.endEditing(true)
        self.scrollView.endEditing(true)
        self.contentView.endEditing(true)
   }

    var numInput: String?
    var inputDeleteFlag = false

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
//        if self.isKeyboard! {
//            print("a")
//            let spacing = UIScreen.main.bounds.height - self.keySize! - 300
//            return .maxHeightWithTopInset(spacing)//.maxHeightWithTopInset(100)
//        } else {
//            print("b")
//            return .maxHeightWithTopInset(UIScreen.main.bounds.height - 300)
//        }
        
        return .maxHeightWithTopInset(10)
    }
    
}

extension BasicModalViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
//        if let text = textField.text {
//            if let floatingLabelTextField = textField as? SkyFloatingLabelTextField {
//                if (text.first == "0") {
//                    floatingLabelTextField.errorMessage = "Invalid num"
//                } else {
//                    floatingLabelTextField.errorMessage = ""
//                }
//            }
//        }
//        print("TF : \(textField) , \(textField.text) ")
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = .current
        formatter.maximumFractionDigits = 0
        
        //textField.text = formatter.number(from: self.numInput!)
        print("numInput: \(self.numInput)")
        if self.inputDeleteFlag {
            if let formattedNumber = formatter.number(from:     String(self.numInput!)),
               let formattedString = formatter.string(from: formattedNumber){
                print("FFFFFFFF : \(formattedString)")
                textField.text = formattedString
            }
        }
        print("TEXTFIELD DID CHANGE SELECTION : \(textField.text!)")
    }

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        self.isComparable = false
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0//소숫점은 없어요
        
        if (string.first == "0" && textField.text == "") {
            print("0은 앞에 올 수 없어")
            return false
        } else {
            
            if (!(minTextField.text!.isEmpty) && !(maxTextField.text!.isEmpty)) {
                self.isComparable = true
            } else {
                self.isComparable = false
            }


            if let removeAllSeperator = textField.text?.replacingOccurrences(of: formatter.groupingSeparator, with: "") {
                
                //print("RemoveAllSeperator : \(removeAllSeperator)")//그냥 쉼표없는 쌩값임 ex) 123456
                
                var beforeFormattedString = removeAllSeperator + string
                //쌓이는값 + 현재누른값(string) = beforeFormattedString
                print("\n\n removeAllSeperatoe : \(removeAllSeperator), string : \(string) \n beforeFormattedString : \(beforeFormattedString)\n" )
                
                print("formatter.number(from: string) : \(formatter.number(from: string))")
                
                if formatter.number(from: string) != nil {//누른 값이 있다면!
                    
                    if(textField.text!.count >= 11) {
                        return false
                    }
                    
                    
                    self.inputDeleteFlag = false
                    if let formattedNumber = formatter.number(from: beforeFormattedString),
                       let formattedString = formatter.string(from: formattedNumber) {
                        
                        print("formattedNumber : \(formattedNumber)")
                        print("formattedString : \(formattedString)")
                        
                        textField.text = formattedString
                        return false
                    }
                } else {//지운다면
                    // [.  ]지운문자 잘라야돼ㅠㅠㅠㅠ
                    self.inputDeleteFlag = true
                    self.numInput = String(beforeFormattedString.dropLast())
//                    beforeFormattedString = String(beforeFormattedString)
//                    if let formattedNumber = formatter.number(from: String(beforeFormattedString)),
//                       let formattedString = formatter.string(from: formattedNumber) {
//
//                       // print("ELSE : \(beforeFormattedString.dropLast())\n")
//                        print("formattedNumber : \(formattedNumber)")
//                        print("formattedString : \(formattedString)")
////
////                        textField.text = formattedString//formatter.string(from: beforeFormattedString)// beforeFormattedString.removeLast())")
//                        return true
//                    }
                    
                }
                
            
    
            }
            
            
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let floatingLabelTextField = textField as? SkyFloatingLabelTextField
    
        
//        if self.isComparable! {
//
//            let minVal = Int(self.minTextField.text!)!
//            let maxVal = Int(self.maxTextField.text!)!
//
//            if minVal <= maxVal {
//                floatingLabelTextField!.errorMessage = ""
//                self.minTextField.errorMessage = ""
//                self.maxTextField.errorMessage = ""
//                print("OK")
//            } else {
//                print("case 2")
//                floatingLabelTextField?.shake()
//                floatingLabelTextField!.errorMessage = "Invalid num"
//
//                print("FAIL")
//            }
//
//        } else {
//
//            if (self.minTextField.text!.isEmpty || ((self.maxTextField.text?.isEmpty) != nil)) {
//                floatingLabelTextField!.errorMessage = ""
//                self.minTextField.errorMessage = ""
//                self.maxTextField.errorMessage = ""
//            } else {
//
//                floatingLabelTextField?.shake()
//                floatingLabelTextField!.errorMessage = "Invalid num"
//            }
//        }
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

extension BasicModalViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
        let size = CGSize(width: view.frame.width - 48, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach{ (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if textView.text.isEmpty {
            if (text == "\n" || text == " ") {
                return false
            }
        }
        
        guard let str = textView.text else {
            return true
        }
        let newLength = str.count + text.count - range.length
        return newLength <= 300
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.endEditing(true)
    }
    
}
