//
//  SecondViewController.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/20.
//

import UIKit
import MaterialComponents

class SecondViewController: UIViewController {

    var row = 3
    let column = 2
    
    var buttonText: [String] = ["1","2","3","4","5","6", "7"]
    
    @IBOutlet weak var buttonView: UIView!
    
    @objc var containerScheme = MDCContainerScheme()

      override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = containerScheme.colorScheme.backgroundColor
        let VStackView = UIStackView()
        VStackView.axis = .vertical
        VStackView.distribution = .fillEqually
        VStackView.backgroundColor = .red
        VStackView.spacing = 20
        
        //let buttonHeight = buttonView.frame.height / CGFloat(row)
        
        buttonView.addSubview(VStackView)
        VStackView.translatesAutoresizingMaskIntoConstraints = false
        VStackView.topAnchor.constraint(equalTo: buttonView.topAnchor).isActive = true
        VStackView.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor).isActive = true
        VStackView.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor).isActive = true
        VStackView.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor).isActive = true
        
        
        
        var cnt = 0;//buttonText.count
//
//        if buttonText.count % column != 0{
//            row += 1
//        }
//
        
            
            for i in 0..<row {
                let HStackView = UIStackView()
                HStackView.axis = .horizontal
                HStackView.distribution = .fillEqually
                HStackView.backgroundColor = .yellow
                HStackView.spacing = 10
                
                
                
                    for j in 0..<column {
                        let flatButtonStatic = MDCButton()
                        flatButtonStatic.applyContainedTheme(withScheme:        containerScheme)
                        flatButtonStatic.setTitle("\(buttonText[column * i + j])", for: UIControl.State())
                        flatButtonStatic.sizeToFit()
                        flatButtonStatic        .translatesAutoresizingMaskIntoConstraints =    false
                        flatButtonStatic.addTarget(self, action:#selector(tap), for: .touchUpInside)
                        
                      
                        cnt += 1
                        print("\(cnt)")
                        HStackView.addArrangedSubview(flatButtonStatic)
                        
                    }
                
                
                VStackView.addArrangedSubview(HStackView)
                
            }
            
        if cnt != buttonText.count {
            print("입성!!!!")
            let HStackView = UIStackView()
            HStackView.axis = .horizontal
            HStackView.distribution = .fillEqually
            HStackView.backgroundColor = .yellow
            HStackView.spacing = 10
            
            for j in 0..<column {
                let flatButtonStatic = MDCButton()
                flatButtonStatic.applyContainedTheme(withScheme:        containerScheme)
                
                if cnt + j <= buttonText.count - 1 {
                    flatButtonStatic.setTitle("\(buttonText[cnt + j])", for: UIControl.State())
                    flatButtonStatic.sizeToFit()
                    flatButtonStatic        .translatesAutoresizingMaskIntoConstraints =    false
                    flatButtonStatic.addTarget(self, action:#selector(tap), for: .touchUpInside)
                    
                    
                    cnt += 1
                    HStackView.addArrangedSubview(flatButtonStatic)
                    
                } else {
                    flatButtonStatic.setTitle("Dummy", for: UIControl.State())
                    flatButtonStatic.sizeToFit()
                    flatButtonStatic        .translatesAutoresizingMaskIntoConstraints =    false
                    //flatButtonStatic.addTarget(self, action:#selector(tap), for: .touchUpInside)
                    flatButtonStatic.alpha = 0
                    HStackView.addArrangedSubview(flatButtonStatic)
                    
                }
                
            }
            VStackView.addArrangedSubview(HStackView)
        }
  
        
//        for i in 0..<row{
//
//            var cnt = buttonText.count
//
//            let HStackView = UIStackView()
//            HStackView.axis = .horizontal
//            HStackView.distribution = .fillEqually
//            HStackView.backgroundColor = .yellow
//            HStackView.spacing = 10
//
//
//            for j in 0..<column {
//
//                if cnt > 0 {
//
//                let flatButtonStatic = MDCButton()
//                flatButtonStatic.applyContainedTheme(withScheme:        containerScheme)
//                flatButtonStatic.setTitle("\(buttonText[column * i + j])", for:        UIControl.State())
//                flatButtonStatic.sizeToFit()
//                flatButtonStatic        .translatesAutoresizingMaskIntoConstraints =    false
//                flatButtonStatic.addTarget(self, action:        #selector(tap), for: .touchUpInside)
//
//
//                    HStackView.addArrangedSubview(flatButtonStatic)
//                    cnt -= 1
//                }
//            }
//            VStackView.addArrangedSubview(HStackView)
//
//
//        }
//
//        let flatButtonStatic = MDCButton()
//        flatButtonStatic.applyContainedTheme(withScheme:        containerScheme)
//        flatButtonStatic.setTitle("Static", for:        UIControl.State())
//        flatButtonStatic.sizeToFit()
//        flatButtonStatic        .translatesAutoresizingMaskIntoConstraints =    false
//        flatButtonStatic.addTarget(self, action:        #selector(tap), for: .touchUpInside)
//
//
//        buttonView.addSubview(flatButtonStatic)
//        flatButtonStatic.topAnchor.constraint(equalTo: VStackView.bottomAnchor, constant: 20).isActive = true
//        flatButtonStatic.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor).isActive = true
//        flatButtonStatic.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -((VStackView.frame.width) / CGFloat(column))).isActive = true
//        flatButtonStatic.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor).isActive = true
//

        





//        view.addConstraints(
//          NSLayoutConstraint.constraints(withVisualFormat:
//              "V:[flatStatic]-40-[flatDynamic]-40-[flatDynamicLegacy]",
//                  options: .alignAllCenterX, metrics: nil, views: views))
      }

      // MARK: Private
      func centerView(view: UIView, onView: UIView) {
        onView.addConstraint(NSLayoutConstraint(
          item: view,
          attribute: .centerX,
          relatedBy: .equal,
          toItem: onView,
          attribute: .centerX,
          multiplier: 1.0,
          constant: 0.0))

        onView.addConstraint(NSLayoutConstraint(
          item: view,
          attribute: .centerY,
          relatedBy: .equal,
          toItem: onView,
          attribute: .centerY,
          multiplier: 1.0,
          constant: 0.0))
      }

     @objc func tap(_ sender: Any) {
        print("\(type(of: sender)) was tapped.")
      }
}

    // MARK: Catalog by conventions
//extension SecondViewController {
////        @objc class func catalogMetadata() -> [String: Any] {
////            return [
////                "breadcrumbs": ["Buttons", "Buttons (DynamicType)"],
////                "primaryDemo": false,
////                "presentable": false,
////        ]
////    }
//}

