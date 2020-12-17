//
//  CircularCheckbox.swift
//  checkBox_practice
//
//  Created by BigHand on 2020/12/14.
//

import UIKit

class CircularCheckbox: UIView {
    private var isChecked = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.secondaryLabel.cgColor
        layer.cornerRadius = frame.size.width / 2.0
        backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func toggle() {
        self.isChecked = !isChecked
        if self.isChecked {
            backgroundColor = .blue
        }
        else {
            backgroundColor = .systemPink
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
}
