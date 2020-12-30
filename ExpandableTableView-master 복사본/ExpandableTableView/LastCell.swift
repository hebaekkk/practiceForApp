//
//  LastCell.swift
//  ExpandableTableView
//
//  Created by BigHand on 2020/12/30.
//  Copyright © 2020 Pratik Lad. All rights reserved.
//

import UIKit

class LastCell: UITableViewCell {

    static let identifier = "LastCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .blue
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
