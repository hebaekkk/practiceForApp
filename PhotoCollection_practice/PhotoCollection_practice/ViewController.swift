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
    
    @IBAction func moveToMyCollectionBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "MyPhotoCollectionViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func moveToBasic(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "BringImagePracticeViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func moveToBasicCollection(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "BasicCollectionViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

