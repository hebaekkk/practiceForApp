//
//  WideTextFieldView.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/22.
//

import UIKit

class WideTextFieldView: UIView, UITextViewDelegate {

    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
        
        //textView.delegate = self
        placeholderSetting()
    }
    
    var placeholderText: String = ""
    
    let View : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 40, height: 21)
        //label.setHeight(22)
        label.text = "제목"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .green
        return label
    }()
    
    let textView: UITextView = {
        //let width: CGFloat = View.frame.width
        //let height: CGFloat = 200

        let tf = UITextView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.frame = CGRect(x: 0, y: 25, width: UIScreen.main.bounds.width - 72, height: 140)
        tf.isEditable = true
        tf.backgroundColor = #colorLiteral(red: 1, green: 0.5045717593, blue: 1, alpha: 0.5453993056)
        tf.backgroundColor = .white
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        return tf
    }()
    
    func placeholderSetting() {
        textView.delegate = self
        textView.text = placeholderText// "제가 바로 PlaceHolder이다"
        textView.textColor = UIColor.gray
    }
    //////////TextView Place Holder////////
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.gray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText//"제가 바로 PlaceHolder이다"
            textView.textColor = UIColor.gray
        }
    }
    /////////////////////////////////////
    
    func setup() {
        addSubview(View)
        View.translatesAutoresizingMaskIntoConstraints = false
        View.topAnchor.constraint(equalTo: topAnchor).isActive = true
        View.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        View.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        View.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        View.addSubview(title)
        //textView.frame = CGRect(x: 25, y: 0, width: View.frame.width, height: View.frame.height - 40)
        
        View.addSubview(textView)
        
//        title.leadingAnchor.constraint(equalTo: View.leadingAnchor).isActive = true
//        title.topAnchor.constraint(equalTo: View.topAnchor).isActive = true
//

        
        //textView.leadingAnchor.constraint(equalTo: View.leadingAnchor).isActive = true
        //textView.trailingAnchor.constraint(equalTo: View.trailingAnchor).isActive = true
        //textView.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        
        //textView.widthAnchor.constraint(equalToConstant: View.frame.width).isActive = true
        //textView.bottomAnchor.constraint(equalTo: View.bottomAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
