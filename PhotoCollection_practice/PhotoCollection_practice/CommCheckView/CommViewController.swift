//
//  CommViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/04.
//

import UIKit
import Alamofire

class CommViewController: UIViewController {
    
    

    let UUID: String = "e0a188cd-22ed-4d8e-9872-66f851bef6b1"
    let url = "http://192.168.0.11:3000/team/servicearea"

   // let auth = KeychainSwift().set("e0a188cd-22ed-4d8e-9872-66f851bef6b1", forKey: "Authorizaton")
   // let headers: HTTPHeaders = ["Authorization" : KeychainSwift().get("Aug)]

    let headers: HTTPHeaders = ["Authorization" : "e0a188cd-22ed-4d8e-9872-66f851bef6b1"]
    private var receivedArray = [ServiceArea]()
    private var topCollView: DynamicHeightCollectionView!
    //private var receivedData =

    override func viewDidLoad() {
        super.viewDidLoad()
        jsonDecoding()


    }

    func jsonDecoding() {

        //self.keychain.set("e0a188cd-22ed-4d8e-9872-66f851bef6b1", forKey: "Authorization")
        //let headers: HTTPHeaders = ["Authorization" : "e0a188cd-22ed-4d8e-9872-66f851bef6b1"]
        AF.request(url,
                   parameters: nil,
                   headers: self.headers).responseJSON{ (response) in
                    switch response.result {
                    case .success(let res) :
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)

                            let json = try JSONDecoder().decode(UserLocation.self, from: jsonData)

                            //print(json)
                            self.receivedArray = json.serviceArea

                            print(self.receivedArray)

                        } catch(let err) {
                            print("1번 : \(err.localizedDescription)")
                        }
                    case .failure(let err) :
                        print("2번 : \(err.localizedDescription)")
                    }
                   }

    }




}



//class CommViewController: UIViewController {
//
//    let UUID = "e0a188cd-22ed-4d8e-9872-66f851bef6b1"
//    let url = "http://192.168.0.11:3000/team/servicearea"
//    
//    private var receivedArray = [ServiceArea]()
//    private var topCollView: DynamicHeightCollectionView!
//    private var scrollView = UIScrollView.init()
//    private var contentView = UIView()
//
//    let headers: HTTPHeaders = ["Authorization" : "e0a188cd-22ed-4d8e-9872-66f851bef6b1"]
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupViews()
//        //fetch()
//        //jsonDecoding()
//
//    }
//    
//    private func fetch() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
//            self.jsonDecoding()
//            self.topCollView.reloadData()
//            self.topCollView.layoutIfNeeded()
//        }
//    }
//
//    private func setupViews() {
//        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.translatesAutoresizingMaskIntoConstraints = false
//        
//        let heightConstraint = NSLayoutConstraint.init(item: contentView,
//                                                       attribute: .height,
//                                                       relatedBy: .equal,
//                                                       toItem: self.view,
//                                                       attribute: .height,
//                                                       multiplier: 1, constant: 0)
//        heightConstraint.priority = UILayoutPriority.init(200)
//        self.view.addSubview(scrollView)
//        self.view.addConstraints([
//            self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
//            self.scrollView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
//            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//        ])
//        
//        self.scrollView.addSubview(contentView)
//        let padding = self.navigationController?.navigationBar.frame.maxY ?? 0
//        print(padding)
//        self.scrollView.addConstraints([
//            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
//            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -1*(padding)),
//            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
//            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
//        ])
//        
//        self.view.addConstraints([
//            self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
//            heightConstraint,
//        ])
//        
//        self.topCollView = returnCollView()
//        self.topCollView.register(TokenListCell.self, forCellWithReuseIdentifier: TokenListCell.identifier)
//        self.topCollView.layer.cornerRadius = 10.0
//        self.topCollView.layer.borderColor = #colorLiteral(red: 0.4039215686, green: 0.4666666667, blue: 0.7215686275, alpha: 1).cgColor
//        self.topCollView.layer.borderWidth = 1.25
//        self.topCollView.isDynamicSizeRequired = true
//        
//        let verifyButton = UIButton.init(frame: .zero)
//        verifyButton.backgroundColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
//        verifyButton.setTitle("수정", for: .normal)
//        verifyButton.setTitleColor(.white, for: .normal)
//        //verifyButton.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
//        verifyButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(verifyButton)
//        
//        self.contentView.addConstraints([
//            topCollView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
//            topCollView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
//            topCollView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
//            topCollView.heightAnchor.constraint(greaterThanOrEqualToConstant: 250),
//            topCollView.bottomAnchor.constraint(equalTo: verifyButton.topAnchor, constant: 16),
//            
//            verifyButton.topAnchor.constraint(equalTo: topCollView.bottomAnchor, constant: -16),
//            verifyButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
//            verifyButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
//            verifyButton.heightAnchor.constraint(equalToConstant: 60),
//            verifyButton.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -16)
//        ])
//    }
//
//    
//}
//
//extension CommViewController {
//    private func returnCollView() -> DynamicHeightCollectionView {
//        let laytout = TokenCollectionViewFlowLayout.init()
//        laytout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//        laytout.minimumLineSpacing = 10
//        laytout.minimumInteritemSpacing = 10
//        laytout.scrollDirection = .vertical
//        let collView = DynamicHeightCollectionView.init(frame: .zero, collectionViewLayout: laytout)
//        collView.translatesAutoresizingMaskIntoConstraints = false
//        collView.delegate = self
//        collView.dataSource = self
//        collView.backgroundColor = .clear
//        return collView
//    }
//}
//extension CommViewController {
//
//    func jsonDecoding() {
//        AF.request(url,
//                   parameters: nil,
//                   headers: self.headers).responseJSON{ (response) in
//                    switch response.result {
//                    case .success(let res):
//                        do{
//                            let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
//                            let json = try JSONDecoder().decode(UserLocation.self, from: jsonData)
//                            self.receivedArray = json.serviceArea
//                            print(self.receivedArray)
//                        } catch(let err) {
//                            print(err.localizedDescription)
//                        }
//                    case .failure(let err):
//                        print(err.localizedDescription)
//                    }
//                   }
//    }
//    
//}
//
//extension CommViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.receivedArray.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TokenListCell.identifier, for: indexPath) as? TokenListCell else { return TokenListCell() }
//        
//        let title = self.receivedArray[indexPath.item].sido + self.receivedArray[indexPath.row].sigungu
//        
//        cell.titleLabel.text = title
//        return cell
//    }
//    
//
//    //Data
//}
