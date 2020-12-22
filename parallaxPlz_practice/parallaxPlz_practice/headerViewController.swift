//
//  headerViewController.swift
//  parallaxPlz_practice
//
//  Created by BigHand on 2020/12/22.
//

import UIKit
import MXParallaxHeader

class headerViewController: UIViewController, MXParallaxHeaderDelegate {

    @IBOutlet weak var falcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parallaxHeader?.delegate = self

        // Do any additional setup after loading the view.
    }
    

    func parallaxHeaderDidScroll(_ parallaxHeader: MXParallaxHeader) {
        let angle = parallaxHeader.progress * CGFloat(Double.pi) * 2
        self.falcon.transform = CGAffineTransform.identity.rotated(by: angle)
    }

}
