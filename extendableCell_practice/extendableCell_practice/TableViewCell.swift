//
//  TableViewCell.swift
//  extendableCell_practice
//
//  Created by BigHand on 2020/12/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var iconImg: UIImageView!
    
    @IBOutlet weak var UIView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImg.image = UIImage(systemName: "chevron.down")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //let btnView = kindsBtnsView(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
        
        //UIView.addSubview(btnView)
        //btnView.setAnchor(top: UIView.topAnchor, left: UIView.leftAnchor, bottom: UIView.bottomAnchor, right: UIView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    func setCollapse(collapsed: Bool) {
        iconImg?.rotate(collapsed ? 0.0 : .pi)
    }
}
extension UIView {
    func setAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
                   paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant:  paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant:  paddingLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant:  -paddingRight).isActive = true
        }
    }
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2 ) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation,forKey: nil)
    }
}

