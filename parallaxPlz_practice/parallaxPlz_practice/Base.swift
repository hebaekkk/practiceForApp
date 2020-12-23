//
//  Base.swift
//  parallaxPlz_practice
//
//  Created by BigHand on 2020/12/23.
//

import UIKit
import MXParallaxHeader

class Base: MXScrollViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(button)

    }
    


}
