//
//  Try2Cell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/05.
//

import UIKit
import SnapKit

class Try2Cell: UICollectionViewCell {
    
    static let identifier = "Try2Cell"
    
    var isExpanded = false
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "세종대왕이 즉위 25년(1443년)에 직접 창제하여 궁중에 정음청(正音廳)을 두고 성삼문, 신숙주, 최항, 정인지, 박팽년 등 집현전 학자들에게 명하여 해설서 (훈민정음 해례본)을 발간하여 즉위 28년(1446년)에 반포하였다. 훈민정음이라는 말은 '백성(民)을 가르치는(訓) 바른(正) 소리(音)'라는 뜻으로, 독창적이며, 쓰기 편한 28자의 소리글자였다.세종대왕이 즉위 25년(1443년)에 직접 창제하여 궁중에 정음청(正音廳)을 두고 성삼문, 신숙주, 최항, 정인지, 박팽년 등 집현전 학자들에게 명하여 해설서 (훈민정음 해례본)을 발간하여 즉위 28년(1446년)에 반포하였다. 훈민정음이라는 말은 '백성(民)을 가르치는(訓) 바른(正) 소리(音)'라는 뜻으로, 독창적이며, 쓰기 편한 28자의 소리글자였다."
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.addSubview(label)
        self.isExpanded = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(reviewLabel)
        contentView.addSubview(moreButton)
        
        reviewLabel.snp.makeConstraints{ make in
            make.leading.equalTo(contentView.snp.leading).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).offset(-12)
            make.top.equalTo(contentView.snp.top).offset(6)
            make.height.greaterThanOrEqualTo(40)
            make.bottom.equalTo(moreButton.snp.top).offset(-10)
        }
        moreButton.snp.makeConstraints{ make in
            make.leading.equalTo(contentView.snp.leading).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).offset(-12)
            make.top.equalTo(reviewLabel.snp.bottom).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
        moreButton.addTarget(self, action: #selector(moreTapped(_:)), for: .touchUpInside)
    }
    
    @objc func moreTapped(_ sender: UIButton) {
        
        self.isExpanded = !(self.isExpanded)
        reviewLabel.numberOfLines = self.isExpanded ? 0 : 2
        moreButton.setTitle(self.isExpanded ? "접기": "더보기", for: .normal)
        //reviewLabel.numberOfLines =
    }
    
}
