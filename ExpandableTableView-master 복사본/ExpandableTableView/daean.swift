//
//  daean.swift
//  ExpandableTableView
//
//  Created by BigHand on 2020/12/29.
//  Copyright © 2020 Pratik Lad. All rights reserved.
//

import UIKit

class daean: UIView {

    private let xibName = "daean"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }

}
