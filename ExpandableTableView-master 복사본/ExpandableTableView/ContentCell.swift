//
//  ContentCell.swift
//  ExpandableTableView
//
//  Created by Pratik Lad on 29/12/17.
//  Copyright © 2017 Pratik Lad. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell{
    
    @IBOutlet weak var UIView: UIView!
    
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        UIView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
