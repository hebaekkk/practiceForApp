//
//  MyDyCollVC.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/24.
//

import UIKit
import SnapKit


class MyDyCollVC: UIViewController {

    var cellHeight:CGFloat = 180
    var index: Int = 0
    var isExpandedSaver = [Bool]()
    
    let viewModels: [ReviewInfoViewModel] = [ReviewInfoViewModel(adr: "마마마마마마마마마마마마마마마마", cleanKind: "깨끗하게", starScore: "3.4", passedDay: "3", reviewContent: "세종대왕이 즉위 25년(1443년)에 직접 창제하여 궁중에 정음청(正音廳)을 두고 성삼문, 신숙주, 최항, 정인지, 박팽년 등 집현전 학자들에게 명하여 해설서 (훈민정음 해례본)을 발간하여 즉위 28년(1446년)에 반포하였다. 훈민정음이라는 말은 '백성(民)을 가르치는(訓) 바른(正) 소리(音)'라는 뜻으로, 독창적이며, 쓰기 편한 28자의 소리글자였다.세종 28년(1446)에 세종의 명으로 정인지(鄭麟趾) 등이 펴낸, 새 글자 ①에 대한 해설서. 전체가 한문임. 세종이 훈민정음 창제의 취지를 밝힌 서문(序文)과 글자의 음가(音價) 및 운용법을 밝힌 예의편(例義篇)이 본문처럼 되어 있고, 그 뒤에 음가와 운용법 등을 더욱 상세히 서술한 해례편(解例篇)이 부록으로 되어 있으며, 그 뒤 정인지의 서문이 끝에 실려 있음. 목판본으로 국보 70호임.", isImage: false),
                                             ReviewInfoViewModel(adr: "마마마마마마마마마마마마마마마마", cleanKind: "깨끗하게", starScore: "3.4", passedDay: "3", reviewContent: "세종대왕이 즉위 25년(1443년)에 직접 창제하여 궁중에 정음청(正音廳)을 두고 성삼문, 신숙주, 최항, 정인지, 박팽년 등 집현전 학자들에게 명하여 해설서 (훈민정음 해례본)을 발간하여 즉위 28년(1446년)에 반포하였다. 훈민정음이라는 말은 '백성(民)을 가르치는(訓) 바른(正) 소리(音)'라는 뜻으로, 독창적이며, 쓰기 편한 28자의 소리글자였다.세종 28년(1446)에 세종의 명으로 정인지(鄭麟趾) 등이 펴낸, 새 글자 ①에 대한 해설서. 전체가 한문임. 세종이 훈민정음 창제의 취지를 밝힌 서문(序文)과 글자의 음가(音價) 및 운용법을 밝힌 예의편(例義篇)이 본문처럼 되어 있고, 그 뒤에 음가와 운용법 등을 더욱 상세히 서술한 해례편(解例篇)이 부록으로 되어 있으며, 그 뒤 정인지의 서문이 끝에 실려 있음. 목판본으로 국보 70호임.", isImage: false)]
    
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
        
        isExpandedSaver = Array(repeating: false, count: viewModels.count)
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
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
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
        //self.collectionView.reloadData()
        //self.collectionView.layoutIfNeeded()
        //self.collectionView.collectionViewLayout.invalidateLayout()
        
        print("cell Count : \(self.cellCount)")
    }
}

extension MyDyCollVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.cellCount
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCell.identifier, for: indexPath) as! reviewCell
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.contentView.backgroundColor = .white
        
        cell.commonInit(with: viewModels[indexPath.row])
        
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
        isExpandedSaver[indexPath.row] = !isExpandedSaver[indexPath.row]
        print("\(indexPath.row)")
        collectionView.layoutIfNeeded()
        //collectionView.updateConstraints()
    }
    

    
    
}

extension MyDyCollVC: reviewCellDelegate {
    func moreTapped(cell: reviewCell){//, indexPath: IndexPath) {
        
        
        self.collectionView.layoutIfNeeded()
        //cell.isExpanded = !(cell.isExpanded)
            
        //isExpandedSaver[indexPath.row] = !isExpandedSaver[indexPath.row]
        //self.cellHeight = cell.isExpanded ? 300 : 180
        //self.cellHeight = 300
        //collectionView.performBatchUpdates(nil, completion: nil)//performBatchUpdates(<#T##updates: (() -> Void)?##(() -> Void)?##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
}

extension MyDyCollVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width// - 48
//        if isExpandedSaver[indexPath.row] {
//             return CGSize(width: width, height: 300)
//        } else {
//            return CGSize(width: width, height: 180)
//        }
        
        let expandedSize = CGSize(width: width, height: 300)
        let compressedSize = CGSize(width: width, height: 180)
        
        //let size: CGSize?
        let size: CGSize = isExpandedSaver[indexPath.row] ? expandedSize : compressedSize
        return size
//        switch  collectionView.indexPathsForSelectedItems?.first {
//        case .some(indexPath):
//            let height = 200
//            return CGSize(width: width, height: height)
//        default:
//            let height = 100
//            return CGSize(width: width, height: height)
//
//        }
        //collectionView.reloadData()
//
//        if let currentCell = collectionView.cellForItem(at: indexPath) as? reviewCell {
//            if currentCell.isExpanded {
//                return CGSize(width: width, height: 300)
//            } else {
//                return CGSize(width: width, height: 180)
//            }
//
//        } else {
//            return CGSize(width: width, height: self.cellHeight)
//        }
        
//        let cell = collectionView.cellForItem(at: indexPath) as! reviewCell
//        if cell.isExpanded {
//            return CGSize(width: width, height: 300)
//        } else {
//            return CGSize(width: width, height: 180)
//        }
//
        

        //return CGSize(width: width, height: self.cellHeight)
    }
    
    
    
}
