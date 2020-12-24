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
    
    @IBOutlet weak var bar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(bar)
        scrollView.topAnchor.constraint(equalTo: bar.bottomAnchor).isActive = true
        
        view.addSubview(button)

    }
    


}
