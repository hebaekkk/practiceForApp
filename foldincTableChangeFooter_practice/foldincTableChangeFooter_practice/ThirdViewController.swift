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

        let buttonText = ["ㅁ","ㄴ","ㅇ","ㄹ"]
        let buttonView = DynamicButtonView(frame: CGRect(x: 30, y: 100, width: 200, height: 200))
        
        buttonView.commonInit(with: buttonText, row: 2, column: 3)
        
        view.addSubview(buttonView)
    }
    

}
