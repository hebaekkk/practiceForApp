//
//  line.swift
//  drawing_practice
//
//  Created by BigHand on 2021/02/22.
//

import UIKit

class line: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x: 0, y: 0))
        aPath.addLine(to: CGPoint(x: 70, y: 70))
        
        aPath.close()
        UIColor.red.set()
        aPath.lineWidth = 2
        aPath.stroke()
    }

}
