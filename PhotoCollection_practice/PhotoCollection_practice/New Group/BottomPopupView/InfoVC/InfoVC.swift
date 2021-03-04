//
//  InfoVC.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/19.
//


// [  ] addChild 해서 tableView 넣어보자. 그리고 tableView 자체적인 scroll은 막아야해.
import UIKit
import SnapKit

class InfoVC: UIViewController {
    
    //MARK : View Componenets
    private let scrollView = UIScrollView.init()
    private let contentView = UIView()
    
    let idView: UIView = {
        let view = IDCardView()
        return view
    }()
    
    let estimationView: UIView = {
        let view = EstimationView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        

        setupView()

    }
    

    //MARK Setup View
    func setupView() {
        scrollView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint.init(item: contentView,
                                                       attribute: .height, relatedBy: .equal,
                                                       toItem: self.view, attribute: .height, multiplier: 1,
                                                       constant: 0)
        heightConstraint.priority = UILayoutPriority.init(200)
        
        self.view.addSubview(scrollView)
        self.view.addConstraints([
            self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.scrollView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        self.scrollView.addSubview(contentView)
        let padding = self.navigationController?.navigationBar.frame.maxY ?? 0
        print("is navigation bar ? PADDING : \(padding)")
        self.scrollView.addConstraints([
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -1 * padding),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        ])
        
        self.view.addConstraints([
            self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            heightConstraint
        ])
        
        
        contentView.addSubview(idView)
        contentView.addSubview(estimationView)
        
        scrollView.alwaysBounceVertical = false
        
        idView.snp.makeConstraints{ make in
//            make.leading.equalTo(self.view)
//            make.trailing.equalTo(self.view)
//            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(500)
//            make.width.equalTo(self.view.frame.width)
//            make.height.equalTo(170)
//            make.bottom.equalTo(-100)
            make.leading.equalTo(self.contentView)
            make.trailing.equalTo(self.contentView)
            make.top.equalTo(self.contentView)//.offset(400)
            make.height.equalTo(170)
        }
        
        
        estimationView.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView)
            make.trailing.equalTo(self.contentView)
            make.top.equalTo(idView.snp_bottom).offset(8)
            make.height.equalTo(250)
        }
    }
}

extension InfoVC: imageVerticalButtonDelegate {
    @objc func buttonTapped(_ sender: UIButton) {
        print("HELLO")
        print(sender.tag)
    }
    
    
}
