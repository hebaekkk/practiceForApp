//
//  reviewCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/24.
//

import UIKit

class reviewCell: UICollectionViewCell {
    
    static let identifier = "reviewCell"
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
    
    let starLabel: UIView = {
        let view = starAndLabel()
        view.starLabel.textAlignment = .right
        view.starLabel.text = "별점"
        return view
    }()
    
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
        label.backgroundColor = .clear
        label.textColor = .black
        label.text = "세종대왕이 즉위 25년(1443년)에 직접 창제하여 궁중에 정음청(正音廳)을 두고 성삼문, 신숙주, 최항, 정인지, 박팽년 등 집현전 학자들에게 명하여 해설서 (훈민정음 해례본)을 발간하여 즉위 28년(1446년)에 반포하였다. 훈민정음이라는 말은 '백성(民)을 가르치는(訓) 바른(正) 소리(音)'라는 뜻으로, 독창적이며, 쓰기 편한 28자의 소리글자였다."
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .white
        return label
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
        contentView.addSubview(starLabel)
        contentView.addSubview(passedDayLabel)
        contentView.addSubview(reviewLabel)
        contentView.addSubview(imageCollection)
        
        adrLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(12)
            make.leading.equalTo(contentView).offset(24)
            make.height.equalTo(24)
        }
        cleanKindLabel.snp.makeConstraints{ make in
            make.top.equalTo(adrLabel.snp.bottom)
            make.leading.equalTo(contentView).offset(24)
            make.height.equalTo(24)
        }
        starLabel.snp.makeConstraints{ make in
            make.width.equalTo(60)
            make.top.equalTo(contentView).offset(12)
            make.trailing.equalTo(contentView.snp_trailing).offset(-24)
            make.height.equalTo(24)
        }
        passedDayLabel.snp.makeConstraints { make in
            make.top.equalTo(starLabel.snp_bottom)
            make.trailing.equalTo(contentView).offset(-24)
            make.height.equalTo(24)
        }
        
        reviewLabel.snp.makeConstraints{ make in
            make.top.equalTo(cleanKindLabel.snp.bottom)
            make.top.equalTo(passedDayLabel.snp.bottom)
            
            make.leading.equalTo(contentView.snp.leading).offset(24)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
            make.height.equalTo(40)
        }
        
        
        imageCollection.delegate = self
        imageCollection.dataSource = self
        imageCollection.register(dTableCollectionCell.self, forCellWithReuseIdentifier: dTableCollectionCell.identifier)
        imageCollection.snp.makeConstraints{ make in
            make.leading.equalTo(contentView).offset(24)
            make.trailing.equalTo(contentView).offset(-24)
            //make.bottom.equalTo(contentView).offset(-10)
            make.top.equalTo(reviewLabel.snp_bottom).offset(4)
            //make.top.equalTo(reviewLabel.snp_bottom).offset(4)
            make.height.equalTo(30)
                                  
        }
        
        
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
