//
//  ViewController.swift
//  Card
//
//  Created by BigHand on 2020/12/30.
//

import UIKit
import MaterialComponents.MaterialCards

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let card = MDCCard(frame: CGRect(x: 30, y: 100, width: 150, height: 150))
        view.addSubview(card)
    }


}

