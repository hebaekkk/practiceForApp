//
//  ThirdViewController.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/20.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonText = ["ㅁ","ㄴ","ㅇ"]
        let buttonView = DynamicButtonView(frame: CGRect(x: 30, y: 100, width: 200, height: 200))
        buttonView.commonInit(with: buttonText)
        
        view.addSubview(buttonView)
    }
    

}
