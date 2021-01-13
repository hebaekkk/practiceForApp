//
//  ViewController.swift
//  dataProtocol_practice
//
//  Created by BigHand on 2020/12/31.
//

import UIKit
protocol DataDelegate {
    func printThisString(string: String)
}

class ViewController: UIViewController, DataDelegate {
    func printThisString(string: String) {
        print(string)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hi")
        perform(#selector(advance), with: nil, afterDelay: 2)
        // Do any additional setup after loading the view.
    }
    
    @objc func advance() {
        let vc = ViewControllerTwo()
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }

}
class ViewControllerTwo: UIViewController {
    var delegate: DataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        delegate?.printThisString(string: "move this to our first viewController")
    }
}

