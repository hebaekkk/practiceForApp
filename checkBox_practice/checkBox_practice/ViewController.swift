//
//  ViewController.swift
//  checkBox_practice
//
//  Created by BigHand on 2020/12/14.
//

import UIKit

class ViewController: UIViewController {
    
    let checkbox1 = CircularCheckbox(frame: CGRect(x: 70, y: 200, width: 70, height: 70))
    let checkbox2 = CheckboxButton(frame: CGRect(x: 70, y: 300, width: 70, height: 70))
    let checkbox3 = CheckboxPlusLabel(frame: CGRect(x: 70, y: 400, width: 70, height: 70))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 150, y: 200, width: 200, height: 70))
        label.text = "I agree to your terms of service"
        view.addSubview(label)
        view.addSubview(checkbox1)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox))
        checkbox1.addGestureRecognizer(gesture)
        //
        let label2 = UILabel(frame: CGRect(x: 150, y: 300, width: 100, height: 70))
        label2.text = "I agree to your terms of service"
        view.addSubview(label2)
        view.addSubview(checkbox2)
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox2))
        checkbox2.addGestureRecognizer(gesture2)
        //
        checkbox3.label.text = "CO Co Chanel"
        view.addSubview(checkbox3)
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox3))
        checkbox3.addGestureRecognizer(gesture3)

        
    }
    @objc func didTapCheckbox() {
        checkbox1.toggle()
    }
    @objc func didTapCheckbox2() {
        checkbox2.toggle()
    }
    @objc func didTapCheckbox3() {
        checkbox3.toggle()
    }

}

