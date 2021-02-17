//
//  DynamicTableVC.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/17.
//

import UIKit
import SnapKit

class DynamicTableVC: UIViewController, DyTableCellDelegate {

    

    //MARK : View Component
    var myArray = [String]()
    
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "DYNAMIC HEIGHT CONTROL"
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view.addSubview(self.table)
        self.table.rowHeight = UITableView.automaticDimension
        self.table.estimatedRowHeight = 100
        table.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        //MARK : Create random data
        for _ in 1...15 {
            let n = arc4random_uniform(6) + 4
            var str = ""
            for i in 1..<n {
                str += "Line \(i)\n"
            }
            str += "Line \(n)"
            
            myArray.append(str)
        }
        
        
        table.delegate = self
        table.dataSource = self

        
        table.register(DyTableViewCell.self, forCellReuseIdentifier: DyTableViewCell.identifier)
    }

    
    func moreTapped(cell: DyTableViewCell) {
        table.beginUpdates()
        table.endUpdates()
    }

}

extension DynamicTableVC: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DyTableViewCell.identifier, for: indexPath) as! DyTableViewCell

        let str = myArray[indexPath.row]
        let aTmp = str.components(separatedBy: "\n")
        
        cell.myInit(theTitle: "\(indexPath) with \(aTmp.count) rows", theBody: str)
        cell.delegate = self
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 180
//
//    }

}
