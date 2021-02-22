//
//  ViewController.swift
//  drawing_practice
//
//  Created by BigHand on 2021/02/22.
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 50))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width - 10, y: 50))

        // Create a `CAShapeLayer` that uses that `UIBezierPath`:

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3

        // Add that `CAShapeLayer` to your view's layer:

        view.layer.addSublayer(shapeLayer)
    
        
        let circleView = UIView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        //circleView.frame = CGRect(x: 70, y: 70, width: 100, height: 100)
        //circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.layer.borderWidth = 2
        circleView.layer.borderColor = UIColor.blue.cgColor
        
        
        view.addSubview(circleView)
        
        
        circleView.snp.makeConstraints{ make in
            make.leading.equalTo(self.view).offset(30)
            make.top.equalTo(self.view).offset(100)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        circleView.layer.cornerRadius = 50
//        circleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
//        circleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true

        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "trash")
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "다섯글자다"
        
        circleView.addSubview(imageView)
        circleView.addSubview(label)
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(15)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            //make.top.equalTo(imageView.snp_bottom).offset(3)
            make.width.equalTo(70)
            make.height.equalTo(13)
            
            make.bottom.equalTo(circleView.snp_bottom).offset(-25)
        }
        
        
        
        
    }

    

}

