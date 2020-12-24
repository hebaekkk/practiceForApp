//
//  headerViewController.swift
//  parallaxPlz_practice
//
//  Created by BigHand on 2020/12/22.
//

import UIKit
import MXParallaxHeader

//이미지뷰를 안넣으면 안되서 밑에 깔아놓고 UIView로 덮어놨다..

class headerViewController: UIViewController, MXParallaxHeaderDelegate {

    @IBOutlet weak var falcon: UIImageView!
    
    @IBOutlet weak var headerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parallaxHeader?.delegate = self
        let name = String(describing: MyCleanTabProfileView.self)
        guard let loadedNib = Bundle.main.loadNibNamed(name, owner: self, options: nil) else { return }
        guard (loadedNib.first as? MyCleanTabProfileView) != nil else { return }
        
        
        let pV = MyCleanTabProfileView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2.2))
        headerView.addSubview(pV)
    }
    

    func parallaxHeaderDidScroll(_ parallaxHeader: MXParallaxHeader) {
        //let angle = parallaxHeader.progress * CGFloat(Double.pi) * 2
        //self.falcon.transform = CGAffineTransform.identity.rotated(by: angle)
    }

}
