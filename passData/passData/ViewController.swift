//
//  ViewController.swift
//  passData
//
//  Created by BigHand on 2020/11/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onClickBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        vc?.data = txtName.text!
        vc?.delegate = self
        navigationController?.pushViewController(vc!, animated: true)
    }
}
extension ViewController: PassDataToVc {
    func passData(str: String){
        txtName.text = str
    }
}
