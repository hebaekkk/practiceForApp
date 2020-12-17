//
//  CheckboxButton.swift
//  checkBox_practice
//
//  Created by BigHand on 2020/12/14.
//

import UIKit

class CheckboxButton: UIView {

    var isChecked = false
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        imageView.image = UIImage(systemName: "checkmark.circle")
        return imageView
    }()
    
    let boxView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.label.cgColor
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(imageView)
        clipsToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width)
    }
    public func toggle() {
        self.isChecked = !isChecked
        imageView.isHidden = isChecked
    }
}
