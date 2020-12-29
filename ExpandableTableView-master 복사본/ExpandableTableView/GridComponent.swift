//
//  GridComponent.swift
//  ExpandableTableView
//
//  Created by BigHand on 2020/12/29.
//  Copyright © 2020 Pratik Lad. All rights reserved.
//

import UIKit

class GridComponent: UIStackView {

    private var cells: [UIView] = []
    
    private var currentRow: UIStackView?
    
    let rowSize: Int
    let rowHeight: CGFloat
    
    init(rowSize: Int, rowHeight: CGFloat) {
        self.rowSize = rowSize
        self.rowHeight = rowHeight
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillEqually
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    private func prepareRow() -> UIStackView {
        let row = UIStackView(arrangedSubviews: [])
        row.translatesAutoresizingMaskIntoConstraints = false
        row.axis = .horizontal
        row.distribution = .fillEqually
        return row
    }
    
    func addCell(view: UIView) {
        self.currentRow?.arrangedSubviews.filter { $0 is FakeCell }.forEach({ view in
            view.removeFromSuperview()
        })

        let firstCellInRow = self.cells.count % self.rowSize == 0
        if self.currentRow == nil || firstCellInRow {
            self.currentRow = self.prepareRow()
            self.addArrangedSubview(self.currentRow!)
        }

        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: self.rowHeight).isActive = true
        self.cells.append(view)
        self.currentRow!.addArrangedSubview(view)

        let lastCellInRow = self.cells.count % self.rowSize == 0
        if !lastCellInRow {
            let fakeCellCount = self.rowSize - self.cells.count % self.rowSize
            for _ in 0..<fakeCellCount {
                self.currentRow!.addArrangedSubview(FakeCell())
            }
        }
    }
}
class FakeCell: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
