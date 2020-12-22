//
//  MyCleanTabProfileView.swift
//  TSCleaning_CS
//
//  Created by BigHand on 2020/11/25.
//

import UIKit

class MyCleanTabProfileView: UIView {

    
    @IBOutlet weak var businessName: UILabel!
    
    @IBOutlet weak var cleanKind: UILabel!
    
    @IBOutlet weak var minPrice: UILabel!
    
    @IBOutlet weak var maxPrice: UILabel!
    
    @IBOutlet weak var starVal: UILabel!
    
    @IBOutlet weak var chatBtn: UIButton!
    
    @IBOutlet weak var callBtn: UIButton!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit() {
        let name = String(describing: type(of: self))
        guard let loadedNib = Bundle.main.loadNibNamed(name, owner: self, options: nil) else { return }
        guard let view = loadedNib.first as? UIView else { return }
        

        
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: view.frame.height)//fit to view !
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }

}
