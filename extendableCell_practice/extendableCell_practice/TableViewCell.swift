//
//  TableViewCell.swift
//  extendableCell_practice
//
//  Created by BigHand on 2020/12/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var iconImg: UIImageView!
    
    @IBOutlet weak var UIView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
