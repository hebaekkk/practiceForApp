//
//  ViewController.swift
//  materialCard_Practice
//
//  Created by BigHand on 2020/12/24.
//

import UIKit
import MaterialComponents.MaterialCards


class ViewController: UIViewController {
    let card = MDCCard(frame: CGRect(x: 40, y: 40, width: 40, height: 40))

    let colorView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.backgroundColor = .red
        
        card.addSubview(colorView)
        
        view.addSubview(card)
    }


}

