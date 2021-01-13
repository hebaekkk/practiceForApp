//
//  JusoCell.swift
//  passDataModal_practice
//
//  Created by BigHand on 2021/01/04.
//

import UIKit
import SnapKit

class JusoCell: UITableViewCell {
    
    static let identifier: String = "cellIdentifier"
    
    var roadLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    var jibunLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.contentView.addSubview(roadLabel)
        self.contentView.addSubview(jibunLabel)
        
        roadLabel.snp.makeConstraints{ (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-50)
        }
        
        jibunLabel.snp.makeConstraints{ (make) in
            make.leading.equalTo(roadLabel.snp.leading)
            make.trailing.equalTo(roadLabel.snp.trailing)
            make.top.equalTo(roadLabel.snp.top).offset(30)
            make.bottom.equalTo(roadLabel.snp.bottom).offset(20)
        }
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
