//
//  reviewCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/24.
//

import UIKit

struct imageHeight {
    let isImageCollectionViewHeight = 40
    let noImageCollectionViewHeight = 0
}

protocol reviewCellDelegate {
    //func moreTapped(cell: reviewCell, indexPath: IndexPath)
    func moreTapped(cell: reviewCell)//, indexPath: IndexPath)
}
class reviewCell: UICollectionViewCell {
    
    
    public var indexPath: IndexPath!
    
    var delegate : reviewCellDelegate?
    static let identifier = "reviewCell"
    
    let imageH = imageHeight()
    
    //var isImage: Bool = false
    var isExpanded: Bool = false
    
    private var viewModel: ReviewInfoViewModel?
    
    static let inset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    
    let adrLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "주우우우우우우우우소오오오오오오오"
        return label
    }()
    let cleanKindLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "청소 종류"
        return label
    }()
    
//    let starLabel: starAndLabel = {
//        let view = starAndLabel()
//        view.starLabel.textAlignment = .right
//        view.starLabel.text = "별점"
//        return view
//    }()
    
    var days: String = "0"
    
    let passedDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "일 전"
        return label
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .clear
        //label.textRect(forBounds: label.bounds, limitedToNumberOfLines: 3)
        label.textColor = .black
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "세종대왕이 즉위 25년(1443년)에 직접 창제하여 궁중에 정음청(正音廳)을 두고 성삼문, 신숙주, 최항, 정인지, 박팽년 등 집현전 학자들에게 명하여 해설서 (훈민정음 해례본)을 발간하여 즉위 28년(1446년)에 반포하였다. 훈민정음이라는 말은 '백성(民)을 가르치는(訓) 바른(正) 소리(音)'라는 뜻으로, 독창적이며, 쓰기 편한 28자의 소리글자였다."
        //label.textRect(forBounds: label.bounds, limitedToNumberOfLines: 1)
        return label
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.titleLabel!.font = UIFont.systemFont(ofSize: 13)
        button.backgroundColor = #colorLiteral(red: 0.3755242527, green: 0.228127867, blue: 0.9202443957, alpha: 0.5)
        button.setTitle("ReadMore", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()

    let imageCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionViewWidth = UIScreen.main.bounds.width - 48
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: collectionViewWidth, height: 20), collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .red
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewModel = nil
        self.isExpanded = false
        self.indexPath = nil
        contentView.backgroundColor = .white
        //contentView.addSubview(label)
        setupView()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //label.frame = bounds.inset(by: reviewCell.inset)
    }
    
    func setupView() {
        contentView.addSubview(adrLabel)
        contentView.addSubview(cleanKindLabel)
        //contentView.addSubview(starLabel)
        //contentView.addSubview(passedDayLabel)
        contentView.addSubview(reviewLabel)
        
        contentView.addSubview(moreButton)

        //contentView.addSubview(imageCollection)
        
        adrLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.height.equalTo(24)
        }
        cleanKindLabel.snp.makeConstraints{ make in
            make.top.equalTo(adrLabel.snp.bottom)
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.height.equalTo(24)
        }
//        starLabel.snp.makeConstraints{ make in
//            make.width.equalTo(60)
//            make.top.equalTo(contentView).offset(12)
//            make.trailing.equalTo(contentView.snp_trailing).offset(-24)
//            make.height.equalTo(24)
//        }
//        passedDayLabel.snp.makeConstraints { make in
//            make.top.equalTo(starLabel.snp_bottom)
//            make.trailing.equalTo(contentView).offset(-24)
//            make.height.equalTo(24)
//        }
//
        reviewLabel.snp.makeConstraints{ make in
            make.top.equalTo(cleanKindLabel.snp.bottom)
            //make.top.equalTo(passedDayLabel.snp.bottom)
            
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
            //make.height.greaterThanOrEqualTo(self.isExpanded ? 40 : 80)
            make.bottom.equalTo(moreButton.snp.top).offset(-24)
        }
        

        moreButton.snp.makeConstraints{ make in
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
            make.top.equalTo(reviewLabel.snp.bottom).offset(4)
            make.height.equalTo(20)
            make.bottom.greaterThanOrEqualTo(contentView.snp.bottom)//.offset(-23)
            //make.bottom.equalTo(isImage ? imageCollection.snp.top : contentView.snp.bottom).offset(-10)
        }
    
        moreButton.addTarget(self, action: #selector(moreButtonTapped(_:)), for: .touchUpInside)
    }
    
  
    @objc func moreButtonTapped(_ sender: UIButton) {
        self.isExpanded = !(self.isExpanded)
        
        reviewLabel.numberOfLines = self.isExpanded ? 0 : 3
        moreButton.setTitle(self.isExpanded ? "접기" : "더보기", for: .normal)
//        reviewLabel.snp.makeConstraints{ make in
//            make.top.equalTo(cleanKindLabel.snp.bottom)
//            make.top.equalTo(passedDayLabel.snp.bottom)
//
//            make.leading.equalTo(contentView.snp.leading).offset(24)
//            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
//            make.height.greaterThanOrEqualTo(self.isExpanded ? 80 : 40)
//        }
        
        print("INDEXPATH : \(String(describing: self.indexPath))")
        
        delegate?.moreTapped(cell: self)
   
        print("SIZING LB : \(reviewLabel.numberOfLines)")
    }
    
//    func isImageHeight(isImage: Bool) -> CGFloat {
//        if self.isImage {
//            return 40
//        } else {
//            return 0
//        }
//    }
    
    func commonInit(with viewModel: ReviewInfoViewModel){
        adrLabel.text = viewModel.adr
        //starLabel.starLabel.text = viewModel.starScore
        cleanKindLabel.text = viewModel.cleanKind
        passedDayLabel.text = viewModel.passedDay + "일 후"
        reviewLabel.text = viewModel.reviewContent
        
    
      
        //self.reviewLabel.textRect(forBounds: reviewLabel.bounds, limitedToNumberOfLines: 0)
        
        
//        self.isImage = viewModel.isImage
//
//        if self.isImage {
//            contentView.addSubview(imageCollection)
//            imageCollection.delegate = self
//            imageCollection.dataSource = self
//            imageCollection.register(dTableCollectionCell.self, forCellWithReuseIdentifier: dTableCollectionCell.identifier)
//            imageCollection.snp.makeConstraints{ make in
//                make.leading.equalTo(contentView).offset(24)
//                make.trailing.equalTo(contentView).offset(-24)
//                make.bottom.equalTo(contentView).offset(-10)
//                //make.top.equalTo(reviewLabel.snp_bottom).offset(4)
//                //make.top.equalTo(reviewLabel.snp_bottom).offset(4)
//                make.height.equalTo(isImageHeight(isImage: self.isImage))
//
//            }
//        }
        //self.layoutIfNeeded()
    }
    
}

extension reviewCell: UICollectionViewDelegate {
    
}
extension reviewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dTableCollectionCell.identifier, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    
}

extension reviewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20, height: 20)
    }
}
// [ ] review label text Count ? or 두줄 넘어가면  ㄱ ㄱ

