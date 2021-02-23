//
//  CircleView.swift
//  drawing_practice
//
//  Created by BigHand on 2021/02/22.
//

import UIKit
import SnapKit

class ProgressView: UIView {

    //let stageNum: Int = 4
    
    
    
    let progressLabel: [String] = ["견적대기 중", "진행예정","완료"]
    

    let path: UIBezierPath = {
        let path = UIBezierPath()
        return path
    }()
    
    
    let shapeLayer = CAShapeLayer()
    
    let hStack: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
//        path.move(to: CGPoint(x: 0, y: frame.midY))
//        path.addLine(to: CGPoint(x: frame.height/2, y: frame.midY))
//        shapeLayer.path = path.cgPath
//        shapeLayer.strokeColor = UIColor.blue.cgColor
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineWidth = 3
        
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        
        self.backgroundColor = .clear
        
        for i in 0..<progressLabel.count {
            let subview = CircleView(frame: CGRect(x: 0, y: 0, width: frame.width / CGFloat(progressLabel.count), height: frame.maxY))
            subview.label.text = progressLabel[i]
            hStack.addArrangedSubview(subview)
        }
        
        
        self.addSubview(hStack)
        
        hStack.snp.makeConstraints{ make in
            make.leading.equalTo(self)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.trailing.equalTo(self)
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.hStack.backgroundColor = .clear
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(UIColor.clear.cgColor)
            context.setStrokeColor(UIColor.gray.cgColor)
            context.setLineWidth(2)
            context.move(to: CGPoint(x: 0, y: bounds.midY))
            context.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))

            context.strokePath()
        }
        
        
    }
    
}

class CircleView: UIView {

    var size: CGFloat?//based : Width
    
    var color: UIColor?
    
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.image = UIImage(systemName: "checkmark.circle.fill")
        return imgView
        
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "다섯글자다"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.color = .lightGray
        self.size = frame.height
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        //self.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        //self.layer.borderWidth = 2
        //self.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
        
        self.backgroundColor = .white
        
        self.snp.makeConstraints{ make in
            make.leading.equalTo(self)
            make.top.equalTo(self)
            make.trailing.equalTo(self)
            make.bottom.equalTo(self)
            make.width.equalTo(self.size!)
            make.height.equalTo(self.size!)
        }
        //self.layer.cornerRadius = self.size! / 2//self.intrinsicContentSize.height / 2
        
        self.addSubview(imageView)
        var imageSize = self.size! / 1.8
        var spacing = self.size! / 12
        var labelHeight = self.size! / 4
        
        imageView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.width.equalTo(imageSize)
            make.height.equalTo(imageSize)
            make.top.equalToSuperview()//.offset(spacing)
        }
        
        self.addSubview(label)
        label.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom)
            make.height.equalTo(labelHeight)
            //make.bottom.equalTo(self)
        }
        imageView.tintColor = self.color
        label.textColor = self.color
    }
    
}

