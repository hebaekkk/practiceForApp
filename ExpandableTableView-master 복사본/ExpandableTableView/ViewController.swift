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
    case Jrsn = 300
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var data : [Section] = [
        Section(title: "Section 1", list: ["0"], isColleps: true),
        Section(title: "Section 2", list: ["1"], isColleps: true),
        Section(title: "Section 3", list: ["2"], isColleps: true),
        Section(title: "Section 4", list: ["3"], isColleps: true),
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
        
        let content : ContentCell = tableView.dequeueReusableCell(withIdentifier: String(describing : ContentCell.self)) as! ContentCell
        
        let sectionData = data[section]
        header.labelTitle.text = sectionData.title
      
        ///arrow rotate
        header.buttonArrow.transform = CGAffineTransform(rotationAngle: (sectionData.isColleps)! ? 0.0 : .pi)
        header.buttonArrow.tag = section
        header.contentView.tag = section
        content.UIView.tag = section
        print("wwwwwww : \(content.UIView.tag)")
        
        header.buttonArrow.addTarget(self, action: #selector(buttonHandlerSectionArrowTap(sender:)), for: .touchUpInside)
        return header.contentView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data[section].isColleps ?? false ? (data[section].list?.count ?? 0) : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight.Jrsn.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : ContentCell = tableView.dequeueReusableCell(withIdentifier: String(describing : ContentCell.self)) as! ContentCell
        
        let listData = data[indexPath.section].list
        cell.labelTitle.text = listData?[indexPath.row]
        
        let index = cell.labelTitle.text!
        
        let makeButton: (String?) -> UIButton = { title in
            let button = UIButton()
            button.setTitle(title, for: .normal)
            
            button.setTitleColor(.purple, for: .normal)
            button.titleLabel!.font = UIFont.preferredFont(forTextStyle: .body)
            button.titleLabel?.font = UIFont(name: "bold", size: 10)
            button.titleLabel?.textAlignment = .center
            button.layer.cornerRadius = 8
            button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
            button.backgroundColor = .white
            
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.purple.cgColor
        
            return button
        }
        let TscsBtn = DynamicButtonStack(buttons: [
                                    makeButton("a"),
                                    makeButton("b"),
                                    makeButton("c"),
                                    makeButton("d")])
        
        let TscsBtn1 = DynamicButtonStack(buttons: [
                                    makeButton("q"),
                                    makeButton("w"),
                                    makeButton("e"),
                                    makeButton("r")])
        
        let JrsnBtn = DynamicButtonStack(buttons: [
            makeButton("z"),
            makeButton("x"),
            makeButton("c"),
            makeButton("v")
        ])

        let JrsnBtn1 = DynamicButtonStack(buttons: [
            makeButton("a"),
            makeButton("b"),
            makeButton("c"),
            makeButton("d")
        ])
        
        let PgmBtn = DynamicButtonStack(buttons: [
            makeButton("a"),
            makeButton("b"),
            makeButton("c"),
            makeButton("d")
            
        ])

        let PgmBtn1 = DynamicButtonStack(buttons: [
            makeButton("a"),
            makeButton("b"),
            makeButton("c"),
            makeButton("d")
        ])
        
        let CgBtn = DynamicButtonStack(buttons: [
            makeButton("a"),
            makeButton("b"),
            makeButton("c"),
            makeButton("d")
        ])

        let CgBtn1 = DynamicButtonStack(buttons: [
            makeButton("a"),
            makeButton("b"),
            makeButton("c"),
            makeButton("d")
        ])
        
        switch listData?[indexPath.row]{
        case "0":
            print("asdfasdfa:\(index)")
            TscsBtn.frame = CGRect(x: 0, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Row.rawValue)
            TscsBtn1.frame = CGRect(x: cell.UIView.frame.width / 2 , y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Row.rawValue)
            cell.UIView.addSubview(TscsBtn)
            cell.UIView.addSubview(TscsBtn1)
            print("\(TscsBtn.frame.minX),\( TscsBtn.frame.minY)")
            print("\(TscsBtn.frame.maxX),\(TscsBtn.frame.maxY)")
            return cell
        case "1":
            print("asdfasdfa:\(index)")
            JrsnBtn.frame = CGRect(x: 0, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            JrsnBtn1.frame = CGRect(x: cell.UIView.frame.width / 2, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            print("\(JrsnBtn.frame.minX),\( JrsnBtn.frame.minY)")
            print("\(JrsnBtn.frame.maxX),\(JrsnBtn.frame.maxY)")
            cell.UIView.addSubview(JrsnBtn)
            cell.UIView.addSubview(JrsnBtn1)
            return cell
        case "2":
            PgmBtn.frame = CGRect(x: 0, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            PgmBtn1.frame = CGRect(x: cell.UIView.frame.width / 2, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            print("\(PgmBtn.frame.minX),\( PgmBtn.frame.minY)")
            print("\(PgmBtn.frame.maxX),\(PgmBtn.frame.maxY)")
            //print("\(PgmBtn.frame.)")
            cell.UIView.addSubview(PgmBtn)
            cell.UIView.addSubview(PgmBtn1)
            return cell
        case "3":
            CgBtn.frame = CGRect(x: 0, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            CgBtn1.frame = CGRect(x: cell.UIView.frame.width / 2, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            cell.UIView.addSubview(CgBtn)
            cell.UIView.addSubview(CgBtn1)
            return cell
            
        default:
            print("asdfasdfa:\(indexPath.row)")
            cell.UIView.backgroundColor = .blue
            return cell
        }
        
        
        //return cell
    }

    ///Button action arrow in header
    @objc func buttonHandlerSectionArrowTap(sender : UIButton)  {
        let sectionData = data[sender.tag]
        sectionData.isColleps = !sectionData.isColleps!
        tableView.reloadSections(IndexSet(integer: sender.tag), with: .automatic)

    }
}
