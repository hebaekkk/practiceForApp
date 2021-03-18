//
//  Try2VC.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/05.
//

import UIKit
import SnapKit

class Try2VC: UIViewController {
    
    var collectionView: Try2!
    
    var issues: [String] = ["https://corykim0829.github.io/ios/UICollectionViewCell-dynamic-height/#https://corykim0829.github.io/ios/UICollectionViewCell-dynamic-height/#https://corykim0829.github.io/ios/UICollectionViewCell-dynamic-height/#",
    "https://corykim0829.github.io/ios/UICollectionViewCell-dynamic-height/#https://corykim0829.github.io/ios/UICollectionViewCell-dynamic-height/#https://corykim0829.github.io/ios/UICollectionViewCell-dynamic-height/#"]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.navigationItem.title = "TRY 2"
        self.collectionView = returnCollView()
        
        view.addSubview(collectionView)
        self.collectionView.snp.makeConstraints{ make in
            make.leading.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.trailing.equalTo(self.view)
            make.height.greaterThanOrEqualTo(200)
        }
    
    }
    
    
    private func returnCollView() -> Try2 {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collView = Try2(frame: .zero, collectionViewLayout: layout)
        collView.isDynamicSizeRequired = true
        collView.translatesAutoresizingMaskIntoConstraints = false
        collView.delegate = self
        collView.dataSource = self
        collView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        collView.register(Try2Cell.self, forCellWithReuseIdentifier: Try2Cell.identifier)
        return collView
    }

    private func configureIssueLabels(with issue: String) {
        guard issue.count > 0 else {
            return
        }
    }

}

extension Try2VC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Try2Cell.identifier, for: indexPath) as? Try2Cell
        
        return cell!
    }
    
    func referIssue(at indexPath: IndexPath, handler: (String) -> Void) {
        let string = issues[indexPath.item]
        handler(string)
    }
    
    
    
}
extension Try2VC: UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
}

