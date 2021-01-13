//
//  ViewController.swift
//  passDataModal_practice
//
//  Created by BigHand on 2021/01/02.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var show: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        show.placeholder = "HAHA"
        show.delegate = self
        show.inputView = UIView()
        show.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }

    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == show {
            moveToFindAdrVC()
            print("주소 검색해라잉")
        }
        
    }
    
    func moveToFindAdrVC() {
        let modalVC = storyboard?.instantiateViewController(identifier: "ModalViewController") as? ModalViewController
        self.present(modalVC!, animated: true, completion: nil)
    }

}
//ㅌ
