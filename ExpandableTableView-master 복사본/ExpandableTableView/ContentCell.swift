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
        UIView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    //Cell의 overlap막기 위해서 쓰는 함수이다.
    //1단계 for문은 덮어씌운 UIView 밑에 있는 Row행.
    //2단계 for문은
    override func prepareForReuse() {
        super.prepareForReuse()
        for view in self.UIView.subviews {
            print("view : \(view)")
            for v in view.subviews {
                print("\(v)")
                v.removeFromSuperview()
            }
        }
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
