//
//  MyDyCollVC.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/24.
//

import UIKit
import SnapKit

class MyDyCollVC: UIViewController {

    let myHeightC: NSLayoutConstraint = {
        let constraint = NSLayoutConstraint.init()
        return constraint
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("ADD", for: .normal)
        return button
    }()
    var cellCount:Int = 3
    
    private var collectionView: MyDyCollectionView!
    private var scrollView = UIScrollView.init()
    private var contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setupViews()
    }
    
    func setupViews() {
        self.navigationItem.title = "My Dynamic Collection"
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false

        self.scrollView.backgroundColor = #colorLiteral(red: 0.9883388877, green: 0.08913052827, blue: 0.01450992934, alpha: 0.4)
        self.contentView.backgroundColor = #colorLiteral(red: 0.08025730401, green: 0.03083190881, blue: 0.9846408963, alpha: 0.4)
        let heightConstraint = NSLayoutConstraint.init(item: contentView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0)
        heightConstraint.priority = UILayoutPriority.init(200)
        
        self.view.addSubview(scrollView)
        self.view.addConstraints([
          self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
          self.scrollView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
          self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
          self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
          self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
          self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
          ])
        
        self.scrollView.addSubview(contentView)
        let padding = self.navigationController?.navigationBar.frame.maxY ?? 0
        print(padding)
        self.scrollView.addConstraints([
          self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
          self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -1 * padding),
          self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
          self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
          ])
        
        self.view.addConstraints([
          self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
          heightConstraint,
          ])
        
        
        self.collectionView = returnCollView()
        self.collectionView.register(reviewCell.self, forCellWithReuseIdentifier: reviewCell.identifier)
//        self.collectionView.layer.cornerRadius = 5.0
//        self.collectionView.layer.borderColor = #colorLiteral(red: 0.4039215686, green: 0.4666666667, blue: 0.7215686275, alpha: 1).cgColor
//        self.collectionView.layer.borderWidth = 1.25
        self.collectionView.isDynamicSizeRequired = true
        
        self.contentView.addSubview(collectionView)
        self.contentView.addSubview(button)
        
        collectionView.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView)//.offset(24)
            make.top.equalTo(self.contentView).offset(10)
            make.trailing.equalTo(self.contentView)//.offset(-24)
            make.height.greaterThanOrEqualTo(450)
        }
        
        button.snp.makeConstraints{ make in
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(collectionView.snp.bottom).offset(24)
            make.height.equalTo(30)
            make.width.equalTo(100)
            make.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
        button.addTarget(self, action: #selector(addCellNum(_:)), for: .touchUpInside)
    
    }
    
    private func returnCollView() -> MyDyCollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collView = MyDyCollectionView.init(frame: .zero, collectionViewLayout: layout)
        collView.translatesAutoresizingMaskIntoConstraints = false
        collView.delegate = self
        collView.dataSource = self
        collView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        //scroll안되게 막는거
        //collView.isScrollEnabled = false
        return collView
    }
    
    @objc func addCellNum(_ sender: UIButton) {
        self.cellCount += 1
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
        self.collectionView.collectionViewLayout.invalidateLayout()
        
        print("cell Count : \(self.cellCount)")
    }
}

extension MyDyCollVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCell.identifier, for: indexPath) as! reviewCell
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.contentView.backgroundColor = .white
        return cell
    }
    

    
}

extension MyDyCollVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width// - 48
       
        return CGSize(width: width, height: 150)
    }
    
}
