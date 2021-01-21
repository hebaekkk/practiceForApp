//
//  ViewController.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/20.
//

import UIKit
import ExpyTableView

class ViewController: UIViewController {

 
    let v = UIView()
    
    var selectedRow: Int = 4
    
    let footerViewColor = ["red","orange","yellow","green"]
    
        let sampleData = [["A", "64 GB Memory"],
                          ["B", "4 inches"],
                          ["C", "Apple A10 Fusion(64 bit)"],
                          ["D", "4 inches"]
                          ]
      
        @IBAction func nextView(_ sender: Any) {
            let vc = (storyboard?.instantiateViewController(identifier: "SecondViewController"))! as SecondViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    
    @IBAction func jump(_ sender: Any) {
        let vc = (storyboard?.instantiateViewController(identifier: "ThirdViewController"))! as ThirdViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
        
        @IBOutlet weak var expandableTableView: ExpyTableView!
        override func viewDidLoad() {
            super.viewDidLoad()
                    expandableTableView.dataSource = self
                    expandableTableView.delegate = self
                
                    //expandableTableView.rowHeight = UITableView.automaticDimension
                    expandableTableView.estimatedRowHeight = 80
                
                    //Alter the animations as you want
                    expandableTableView.expandingAnimation = .fade
                    expandableTableView.collapsingAnimation = .fade
                
            
            v.backgroundColor = .blue
            expandableTableView.tableFooterView = v
            
                
                    //navigationItem.title = "iPhones"
                
                    //If your app only works in portrait mode, you don't have to add this. https://github.com/okhanokbay/ExpyTableView/issues/3
                    NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
        }
        
        @objc private func orientationDidChange() {
            switch UIDevice.current.orientation {
            case .portrait, .portraitUpsideDown, .landscapeLeft, .landscapeRight:
                expandableTableView.reloadSections(IndexSet(Array(expandableTableView.expandedSections.keys)), with: .none)
            default:break
            }
        }
    }

    //MARK: ExpyTableViewDataSourceMethods
extension ViewController: ExpyTableViewDataSource {
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self)) as! TableViewCell
        cell.titleLabel.text = sampleData[section].first!
        cell.layoutMargins = UIEdgeInsets.zero
        cell.showSeparator()
        return cell
    }
}

    //MARK: ExpyTableView delegate methods
extension ViewController: ExpyTableViewDelegate {
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {

        switch state {
        case .willExpand:
            print("WILL EXPAND")

        case .willCollapse:
            print("WILL COLLAPSE")

        case .didExpand:
            print("DID EXPAND")



        case .didCollapse:
            print("DID COLLAPSE")

        }



        print("이건\(tableView.expandedSections.count)")
    }
    ////////
//    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
//            print("NoticeViewController - ExpyTableViewDelegate - changeForSection() called - section = \(section)")
//
//            switch state {
//            case .willExpand:
//                print("펼쳐질 꺼다/ .willExpand / section: \(section)")
//
//                print("현재 섹션: \(section), tableView.expandedSections : \(tableView.expandedSections)")
//
//                // 접어야 할 섹션들
//                let expandedSections = tableView.expandedSections.map{ $0.key }.filter{ $0 != section }
//
//                print("willExpand 현재 들어온 섹션: \(section), 펼쳐진 섹션: expandedSections: \(expandedSections)")
//
//            case .willCollapse:
//                print("닫힐 꺼다 /.willCollapse / section: \(section)")
//            case .didExpand:
//                print("펼쳐짐 / .didExpand / section: \(section)")
//                // 접어야 할 섹션들
//
//                let expandedSections = tableView.expandedSections.map{ $0.key }.filter{ $0 != section }
//
//                if expandedSections.count > 0 {
//                    DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
//                        expandedSections.forEach{ tableView.collapse($0) }
//                    })
//                }
//                print("didExpand 현재 들어온 섹션: \(section), 펼쳐진 섹션: expandedSections: \(expandedSections)")
//            case .didCollapse:
//                print("닫힘 /.didCollapse / section: \(section)")
//            }
//
//            print("이건\(section)")
//    }
//    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
//            print("NoticeViewController - ExpyTableViewDelegate - changeForSection() called - section = \(section)")
//
//            switch state {
//            case .willExpand:
//                print("펼쳐질 꺼다/ .willExpand / section: \(section)")
//                print("현재 섹션: \(section), tableView.expandedSections : \(tableView.expandedSections)")
//                // 접어야 할 섹션들
//                let expandedSections = tableView.expandedSections.map{ $0.key }.filter{ $0 != section }
//                print("willExpand 현재 들어온 섹션: \(section), 펼쳐진 섹션: expandedSections: \(expandedSections)")
//            case .willCollapse:
//                print("닫힐 꺼다 /.willCollapse / section: \(section)")
//            case .didExpand:
//                print("펼쳐짐 / .didExpand / section: \(section)")
//                // 접어야 할 섹션들
//                let expandedSections = tableView.expandedSections.map{ $0.key }.filter{ $0 != section }
//                if expandedSections.count > 0 {
//                    DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
//                        expandedSections.forEach{ tableView.collapse($0) }
//                    })
//                }
//                print("didExpand 현재 들어온 섹션: \(section), 펼쳐진 섹션: expandedSections: \(expandedSections)")
//            case .didCollapse:
//                print("닫힘 /.didCollapse / section: \(section)")
//            }
//            print("이건\(section)")
//    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section % 3 == 0) ? nil : nil//"iPhone Models" : nil
    }
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if section == 3 {
            
            expandableTableView.tableFooterView?.backgroundColor = .blue
            //tableView.tableFooterView?.backgroundColor = .blue
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var view = UIView()
        switch selectedRow {
        case 0:
            view = TSCSSubView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            //view.backgroundColor = .red
            //view.commonInit()
        case 1:
            
            
            view.backgroundColor = .orange
        case 2:
            
            view.backgroundColor = .yellow
        case 3:
            
            view.backgroundColor = .green
        default:
            
            view.backgroundColor = .clear
        }
        //view.backgroundColor = .green
        
        return view
    }

    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 3 {
            return 400
        } else {
            return 0
        }
    }
}



extension ViewController {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //If you don't deselect the row here, seperator of the above cell of the selected cell disappears.
        //Check here for detail: https://stackoverflow.com/questions/18924589/uitableviewcell-separator-disappearing-in-ios7
        
        tableView.deselectRow(at: indexPath, animated: false)

        
        if indexPath.row == 1 {
            
            selectedRow = indexPath.section
            print("SELECTED ROW IS \(selectedRow)")
            //이거 DispatchQueue로 처리해줘야되는데?..
            for i in 0..<sampleData.count {
                print("collapse해야해\(i)")
                expandableTableView.collapse(i)
            }
    
            
            //tableView.deselectRow(at: indexPath, animated: false)
        }
        
        tableView.reloadSections(IndexSet(integer: 3), with: .automatic)
        print("헤더냐 여기가? DID SELECT row: \(indexPath.row), section: \(indexPath.section)")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
}

    //MARK: UITableView Data Source Methods
extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        print("SAMPLE DATA \(sampleData.count)" )
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Please see https://github.com/okhanokbay/ExpyTableView/issues/12
        // The cell instance that you return from expandableCellForSection: data source method is actually the first row ofbelonged section. Thus, when you return 4 from numberOfRowsInSection data source method, first row refers toexpandable cell and the other 3 rows refer to other rows in this section.
        // So, always return the total row count you want to see in that section
        
        print("Row count for section \(section) is \(sampleData[section].count)")
        return sampleData[section].count //+ 1 // +1 here is for BuyTableViewCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BuyTableViewCell.self)) as!BuyTableViewCell
//            cell.layoutMargins = UIEdgeInsets.zero
//            cell.showSeparator()
//            return cell
//
//        }else {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SpecificationTableViewCell.self))as!SpecificationTableViewCell
            cell.labelSpecification.text = (sampleData[indexPath.section])[indexPath.row]
        
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.hideSeparator()
            return cell
        // }
    }
}
