//
//  ViewController.swift
//  LoadingExample
//
//  Created by Fury on 31/05/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(taped(_:)))
        self.view.gestureRecognizers = [tap]
    }
    
    @objc func taped(_ sender: UITapGestureRecognizer) {
        LoadingHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            LoadingHUD.hide()
        }
    }
}
