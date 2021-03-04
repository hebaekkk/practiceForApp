//
//  StringVIewController.swift
//  drawing_practice
//
//  Created by BigHand on 2021/02/25.
//

import UIKit
import SnapKit

class StringVIewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupView()
        
    }
    
    
    let heightConstraint = NSLayoutConstraint.init()
    
    let view1: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5245951414, green: 0.9097836018, blue: 0.6244300604, alpha: 0.7433738426)
        return view
    }()
    
    let view2: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3221638799, green: 0.2289524376, blue: 0.9190914035, alpha: 0.5)
        return view
    }()
    
    
    let shortLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "주우우우우우우우우소오오오오오오오"
        return label
    }()
    let mediumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우"
        return label
    }()
    let longLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        //label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오"
        return label
    }()
    
    let longLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .black
        //label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "주우우우우우우우우소오오오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오주우우우우우우우우소오오오오오오오"
        return label
    }()
    
    
    func setupView() {
        view.addSubview(view1)
        view.addSubview(view2)
        
        
        //view2.translatesAutoresizingMaskIntoConstraints = false
        //view2.heightConstraint?.constant = 100
        
        view1.snp.makeConstraints{ make in
            make.leading.equalTo(self.view.snp.leading).offset(12)
            make.trailing.equalTo(self.view.snp.trailing).offset(-12)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(100)
        }
        
        view2.snp.makeConstraints{ make in
            make.leading.equalTo(self.view.snp.leading).offset(12)
            make.trailing.equalTo(self.view.snp.trailing).offset(-12)
            make.top.equalTo(view1.snp.bottom).offset(30)
            make.height.equalTo(200)
        }
        
        view1.addSubview(shortLabel)
        view1.addSubview(mediumLabel)
        view1.addSubview(longLabel)
        
        longLabel.snp.makeConstraints { make in
            make.leading.equalTo(view1)
            make.trailing.equalTo(view1)
            make.top.equalTo(view1).offset(10)
            make.height.equalTo(14)
        }
        
        
        let longWidth = longLabel2.text!.size(withAttributes: [.font : UIFont.systemFont(ofSize: 13)]).width
        let numofline = ceil(longWidth / (UIScreen.main.bounds.width - 24))
        longLabel2.numberOfLines = Int(numofline)
        
        longLabel2.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        
        print("longWidth : \(longWidth)")
        print("numofline : \(numofline)")
        view2.addSubview(longLabel2)
        
        //longLabel2.textRect(forBounds: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 24, height: 13 * numofline), limitedToNumberOfLines: 0)
        longLabel2.snp.makeConstraints { make in
            
            make.leading.equalTo(view2).offset(8)
            make.trailing.equalTo(view2).offset(-8)
            make.top.equalTo(view2).offset(10)
            make.height.greaterThanOrEqualTo(40)//(numofline * 13)
            //make.width.eq
        }
        
        
        
    }
 
}


extension UIView {

var heightConstraint: NSLayoutConstraint? {
    get {
        return constraints.first(where: {
            $0.firstAttribute == .height && $0.relation == .equal
        })
    }
    set { setNeedsLayout() }
}

var widthConstraint: NSLayoutConstraint? {
    get {
        return constraints.first(where: {
            $0.firstAttribute == .width && $0.relation == .equal
        })
    }
    set { setNeedsLayout() }
}

}
