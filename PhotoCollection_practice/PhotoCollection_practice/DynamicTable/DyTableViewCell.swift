//
//  DyTableViewCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/17.
//

import UIKit
import SnapKit

protocol DyTableCellDelegate {
    func moreTapped(cell: DyTableViewCell)
}


class DyTableViewCell: UITableViewCell {

    
    //MARK : IDENTIFIER
    static let identifier = "DyTableViewCell"
    
    //MARK : View Components
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1701189876, green: 0.1490879059, blue: 0.9359106421, alpha: 0.5)
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Party LET", size: 18)
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.numberOfLines = 0
        label.font = UIFont(name: "Party LET", size: 18)
        return label
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        button.contentHorizontalAlignment = .leading
        button.backgroundColor = #colorLiteral(red: 0.7004154921, green: 0.00260724267, blue: 0.9956620336, alpha: 0.5)
        button.setTitle("ReadMore", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    let sizingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.alpha = 1
        label.font = UIFont(name: "Party LET", size: 18)
        return label
    }()
    //MARK : check components
    var isExpaneded: Bool = false
    
    var delegate: DyTableCellDelegate?
    
    
    
    
    //MARK : Initial Set
    override func awakeFromNib() {
        super.awakeFromNib()
        setViews()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func myInit(theTitle: String, theBody: String){
        isExpaneded = false
        
        titleLabel.text = theTitle
        bodyLabel.text = theBody
        
        bodyLabel.numberOfLines = 0
        
        sizingLabel.text = theBody
        sizingLabel.numberOfLines = 2
    }
    
    //MARK : Set views
    func setViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(moreButton)
        contentView.addSubview(sizingLabel)
        contentView.addSubview(view)
        view.addSubview(bodyLabel)
        
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView).offset(12)
            make.trailing.equalTo(self.contentView).offset(-12)
            make.top.equalTo(self.contentView).offset(12)
            make.height.equalTo(21)
            make.bottom.equalTo(sizingLabel.snp_top).offset(-8)
            make.bottom.equalTo(view.snp_top).offset(-8)
        }
        
        sizingLabel.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView).offset(12)
            make.trailing.equalTo(self.contentView).offset(-12)
            make.top.equalTo(titleLabel.snp_bottom).offset(8)
            make.bottom.equalTo(moreButton.snp_top).offset(-8)
            
        }
        
        
        view.snp.makeConstraints{ make in
            make.leading.equalTo(bodyLabel)
            make.trailing.equalTo(bodyLabel)
            make.leading.equalTo(self.contentView).offset(12)
            make.trailing.equalTo(self.contentView).offset(-12)
            
            make.top.equalTo(bodyLabel.snp_top)
            make.top.equalTo(titleLabel.snp_bottom).offset(8)
            make.bottom.equalTo(moreButton.snp_top).offset(-8)
            //make.top.equalTo(self.contentView).offset(28)
            //make.bottom.equalTo(self.contentView).offset(-28)
        }
        
        bodyLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview()//(self.view)
            make.trailing.equalToSuperview()//(self.view)
            make.top.equalToSuperview()//(self.view)
            //make.bottom.equalTo(self.view).offset(-8)
        }
        
        
        moreButton.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView).offset(12)
            make.trailing.equalTo(self.contentView).offset(-12)
            make.bottom.equalTo(self.contentView).offset(-8)
            make.height.equalTo(21)
            make.top.equalTo(view.snp_bottom).offset(8)
            make.top.equalTo(sizingLabel.snp_bottom).offset(8)
        }
        
        moreButton.addTarget(self, action: #selector(moreButtonTapped(_:)), for: .touchUpInside)
        
    }
    
    //MARK : Button Handler
    @objc func moreButtonTapped(_ sender: UIButton) {
        self.isExpaneded = !(self.isExpaneded)
        
        sizingLabel.numberOfLines = self.isExpaneded ? 0 : 2
        moreButton.setTitle(self.isExpaneded ? "Read less..." : "Read more...", for: .normal)
        
        print("SIZING LB : \(sizingLabel.numberOfLines)")
        delegate?.moreTapped(cell: self)
    }

}
