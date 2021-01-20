//
//  TableViewController.swift
//  Card
//
//  Created by BigHand on 2021/01/19.
//

import UIKit
import FoldingCell

//class DemoTableViewController: UITableViewController {
//
//    let closeHeight: CGFloat = 60
//    let openHeight: CGFloat = 166
//    var itemHeight = [CGFloat](repeating: 10, count: 4)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        registerCell()
//    }
//}
//
//// MARK: Helpers
//
//extension DemoTableViewController {
//
//  private func registerCell() {
//    tableView.register(DemoFoldingCell.self, forCellReuseIdentifier: "DemoFoldingCell")
//  }
//
//}
//
//// MARK: - Table view data source
//
//extension DemoTableViewController {
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return itemHeight.count
//  }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoFoldingCell", for: indexPath as IndexPath)
//        return cell
//    }
//
////  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
////    let cell = tableView.dequeueReusableCell(withIdentifier: "DemoFoldingCell", for: indexPath as IndexPath)
////
////    return cell
////  }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return itemHeight[indexPath.row]
//    }
//
////  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
////   return itemHeight[indexPath.row]
////  }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
//
//        var duration = 0.0
//        if itemHeight[indexPath.row] == closeHeight {
//            itemHeight[indexPath.row] = openHeight
//            cell.setSelected(true, animated: true)
//            duration = 0.5
//        } else {
//            itemHeight[indexPath.row] = closeHeight
//            cell.setSelected(false, animated: true)
//            duration = 1.0
//        }
//
//        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
//          tableView.beginUpdates()
//          tableView.endUpdates()
//          }, completion: nil)
//
//    }
//
////1
//}
class DemoTableViewController: UITableViewController {

    enum Const {
        static let closeCellHeight: CGFloat = 80
        static let openCellHeight: CGFloat = 488
        static let rowsCount = 4
    }
    
    var cellHeights: [CGFloat] = []

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: Helpers
    private func setup() {
        cellHeights = Array(repeating: Const.closeCellHeight, count: Const.rowsCount)
        tableView.estimatedRowHeight = Const.closeCellHeight
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))

        tableView.register(DemoFoldingCell.self, forCellReuseIdentifier: "DemoFoldingCell")
       
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        }
    }
    
    // MARK: Actions
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.tableView.refreshControl?.endRefreshing()
            }
            self?.tableView.reloadData()
        })
    }
}

// MARK: - TableView

extension DemoTableViewController {

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return Const.rowsCount
    }

    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as DemoFoldingCell = cell else {
            return
        }

        ///////////////////////////////////////
        cell.backgroundColor = .clear//.black//.clear

        if cellHeights[indexPath.row] == Const.closeCellHeight {
            cell.unfold(false, animated: false, completion: nil)
        } else {
            cell.unfold(true, animated: false, completion: nil)
        }

        //cell.number = indexPath.row
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! FoldingCell
        let durations: [TimeInterval] = [0.26]//, 0.2]//, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        return cell
    }

    override func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        print("이게 셀 하이트다인마 : \(cellHeights[indexPath.row])")
        return cellHeights[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell

        if cell.isAnimating() {
            return
        }

        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == Const.closeCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = Const.openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = Const.closeCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
            
            // fix https://github.com/Ramotion/folding-cell/issues/169
            if cell.frame.maxY > tableView.frame.maxY {
                tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
            }
        }, completion: nil)
    }
}

