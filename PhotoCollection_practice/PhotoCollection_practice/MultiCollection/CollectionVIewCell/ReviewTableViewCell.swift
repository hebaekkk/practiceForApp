//
//  ReviewTableViewCell.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/04.
//

import UIKit

class ReviewTableViewCell: MultiCollectionViewCell {
    
    static let identifier = "ReviewTableViewCell"
    
    let table = UITableView()
    override func setupViews() {
        table.delegate = self
        table.dataSource = self
        
        self.contentView.addSubview(table)
        table.snp.makeConstraints{ make in
            make.leading.equalTo(self.contentView.snp.leading)
            make.top.equalTo(self.contentView.snp.top)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        table.register(ReviewTableView.self, forCellReuseIdentifier: ReviewTableView.identifier)
    }
}

extension ReviewTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableView.identifier)
        return cell!
    }
    
    
}
