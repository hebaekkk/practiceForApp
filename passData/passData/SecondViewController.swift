//
//  SecondViewController.swift
//  passData
//
//  Created by BigHand on 2020/11/02.
//

import UIKit

protocol PassDataToVc {
    func passData(str: String)
}

class SecondViewController: UIViewController {

    var data = ""
    var delegate: PassDataToVc!
    
    @IBOutlet weak var txtNewName: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNewName.text = data
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        delegate.passData(str: txtNewName.text!)
        navigationController?.popViewController(animated: true)
    }


}
