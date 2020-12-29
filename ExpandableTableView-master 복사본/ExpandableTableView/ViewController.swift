//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by Pratik Lad on 29/12/17.
//  Copyright © 2017 Pratik Lad. All rights reserved.
//

import UIKit

enum cellHeight : CGFloat{
    case Header = 44
    case Row = 200
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

//    var data : [Section] = [Section(title: "Section 1", list: ["Row 1", "Row 2", "Row 3"], isColleps: true),Section(title: "Section 2", list: ["Row 1", "Row 2", "Row 3"], isColleps: true),Section(title: "Section 3", list: ["Row 1", "Row 2", "Row 3"], isColleps: true),Section(title: "Section 4", list: ["Row 1", "Row 2", "Row 3"], isColleps: true),Section(title: "Section 5", list: ["Row 1", "Row 2", "Row 3"], isColleps: true)]
    var data : [Section] = [
        Section(title: "Section 1", list: ["Row 1"], isColleps: true),
        Section(title: "Section 2", list: ["Row 1"], isColleps: true),
        Section(title: "Section 3", list: ["Row 1"], isColleps: true),
        Section(title: "Section 4", list: ["Row 1"], isColleps: true),
]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetup()
    }

}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    //tableView Setup() : Delegate, tableFooterView 설정
    func tableViewSetup()  {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellHeight.Header.rawValue
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header : HeaderCell = tableView.dequeueReusableCell(withIdentifier: String(describing : HeaderCell.self)) as! HeaderCell
        
        let sectionData = data[section]
        header.labelTitle.text = sectionData.title
      
        ///arrow rotate
        header.buttonArrow.transform = CGAffineTransform(rotationAngle: (sectionData.isColleps)! ? 0.0 : .pi)
        header.buttonArrow.tag = section
        header.contentView.tag = section
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonHandlerSectionArrowTap(sender:)))
        //header.addGestureRecognizer(gesture)
    
        //header.contentView.addGestureRecognizer(gesture)
        header.buttonArrow.addTarget(self, action: #selector(buttonHandlerSectionArrowTap(sender:)), for: .touchUpInside)
        return header.contentView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data[section].isColleps ?? false ? (data[section].list?.count ?? 0) : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight.Row.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ContentCell = tableView.dequeueReusableCell(withIdentifier: String(describing : ContentCell.self)) as! ContentCell
        
        let listData = data[indexPath.section].list
        cell.labelTitle.text = listData?[indexPath.row]

        let makeButton: (String?) -> UIButton = { title in
            let button = UIButton()
            button.setTitle(title, for: .normal)
            
            button.setTitleColor(.purple, for: .normal)
            button.titleLabel!.font = UIFont.preferredFont(forTextStyle: .body)
            button.titleLabel?.font = UIFont(name: "bold", size: 10)
            button.titleLabel?.textAlignment = .center
            button.layer.cornerRadius = 8
            button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            button.backgroundColor = .white
            
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.purple.cgColor
        
            return button
        }
       
        let v = DynamicButtonStack(buttons: [
                                    makeButton("집쓰레기배출/청소"),
                                    makeButton("유품정리/고독사"),
                                    makeButton("사고현장정리"),
                                    makeButton("침수/수해복구청소")])
        let v1 = DynamicButtonStack(buttons: [
                                    makeButton("이사 후 퇴실청소"),
                                    makeButton("화재현장 청소"),
                                    makeButton("빈집만들기"),
                                    makeButton("기타 특수청소")])
        v.frame = CGRect(x: 0, y: 0, width: cell.UIView.bounds.width / 2, height: cellHeight.Row.rawValue)
        v1.frame = CGRect(x: cell.UIView.bounds.width / 2, y: 0, width: cell.UIView.bounds.width / 2, height: cellHeight.Row.rawValue)
        
        cell.UIView.addSubview(v)
        cell.UIView.addSubview(v1)
        
        
        
        
        return cell
    }

    ///Button action arrow in header
    @objc func buttonHandlerSectionArrowTap(sender : UIButton)  {
        let sectionData = data[sender.tag]
        sectionData.isColleps = !sectionData.isColleps!
        tableView.reloadSections(IndexSet(integer: sender.tag), with: .automatic)
        
        print("aha")
    }
}
