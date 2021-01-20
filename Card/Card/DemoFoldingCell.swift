//
//  DemoCell.swift
//  Card
//
//  Created by BigHand on 2021/01/19.
//

import UIKit
import FoldingCell

class DemoFoldingCell: FoldingCell {
    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.25, 0.2, 0.2]
        return durations[itemIndex]
    }
}
