//
//  ViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/26.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func photoCollectionButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "EditPhotoViewController")
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

