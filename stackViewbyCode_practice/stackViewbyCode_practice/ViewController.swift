//
//  ViewController.swift
//  stackViewbyCode_practice
//
//  Created by BigHand on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {

    let container = UIView()
    lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        return view
    }()
    lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemRed
        return view
    }()
    lazy var view3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGreen
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(container)
        container.edgeTo(view)
        container.VStack(view1.setHeight(200),
                         view2,
                         spacing: 8)
    }


}

