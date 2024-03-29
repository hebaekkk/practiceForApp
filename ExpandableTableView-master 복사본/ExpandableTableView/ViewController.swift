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
enum cellSelect : String {
    case Tscs = "특수청소"
    case Jrsn = "정리수납"
    case Cg = "철거"
    case Pgm = "폐기물"
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    var data : [Section] = [
        Section(title: "Section 1", list: ["특수청소"], isColleps: false),
        Section(title: "Section 2", list: ["정리수납"], isColleps: false),
        Section(title: "Section 3", list: ["폐기물"], isColleps: false),
        Section(title: "Section 4", list: ["철거"], isColleps: false),
        Section(title: "Section 5", list: ["디테일"], isColleps: true)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LastCell등록하기
        tableView.register(LastCell.self, forCellReuseIdentifier: "LastCell")
        tableViewSetup()
        
        
    }

}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    //tableView Setup() : Delegate, tableFooterView 설정
    func tableViewSetup()  {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        tableView.tableFooterView?.backgroundColor = .green
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 4 {
            return cellHeight.Jrsn.rawValue
        } else {
            return cellHeight.Header.rawValue
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //작동안됨..
        //let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(headerTap))
        
        if section == 4 {
            let header : LastCell = tableView.dequeueReusableCell(withIdentifier: LastCell.identifier) as! LastCell
            return header//.contentView
            
        } else {
            let header : HeaderCell = tableView.dequeueReusableCell(withIdentifier: String(describing : HeaderCell.self)) as! HeaderCell

            let sectionData = data[section]
            header.labelTitle.text = sectionData.title
            
            header.buttonArrow.transform = CGAffineTransform(rotationAngle: (sectionData.isColleps)! ? 0.0 : .pi)
            header.buttonArrow.tag = section
            
            header.buttonArrow.addTarget(self, action: #selector(buttonHandlerSectionArrowTap(sender:)), for: .touchUpInside)
            
            //header..작동안됨..
            //header.mask?.addGestureRecognizer(tapRecognizer)
            
            
            
            return header.contentView
            
        }
    }
    
    @objc func buttonTap(_ sender: UIButton) {
        print("\((sender.titleLabel?.text)!)")
        let title = sender.titleLabel?.text!
        
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data[section].isColleps ?? false ? (data[section].list?.count ?? 0) : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight.Jrsn.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : ContentCell = tableView.dequeueReusableCell(withIdentifier: String(describing : ContentCell.self)) as! ContentCell
        
        let bottom : LastCell = tableView.dequeueReusableCell(withIdentifier: LastCell.identifier) as! LastCell
        
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
            
            button.addTarget(self, action: #selector(self.buttonTap(_:)), for: .touchUpInside)
        
            return button
        }
                let TscsBtn = DynamicButtonStack(buttons: [
                                            makeButton("집쓰레기배출/청소"),
                                            makeButton("유품정리/고독사"),
                                            makeButton("사고현장정리"),
                                            makeButton("침수/수해복구청소")])
        
                let TscsBtn1 = DynamicButtonStack(buttons: [
                                            makeButton("이사 후 퇴실청소"),
                                            makeButton("화재현장 청소"),
                                            makeButton("빈집만들기"),
                                            makeButton("기타 특수청소")])
        
                let JrsnBtn = DynamicButtonStack(buttons: [
                                           makeButton("집 전체"),
                                           makeButton("드레스룸/옷방(의류)"),
                                           makeButton("거실"),
                                           makeButton("방2개"),
                                           makeButton("이삿짐 정리")
                ])
        
                let JrsnBtn1 = DynamicButtonStack(buttons: [
                                            makeButton("주방"),
                                            makeButton("베란다/다용도실"),
                                            makeButton("방 1개"),
                                            makeButton("방 3개"),
                                            makeButton("상담 후 결정")
                ])
        
                let PgmBtn = DynamicButtonStack(buttons: [
                                            makeButton("생활폐기물"),
                                            makeButton("건축폐기물"),
                                            makeButton("혼합폐기물"),
                                            makeButton("고철/재활용")
        
                ])
        
                let PgmBtn1 = DynamicButtonStack(buttons: [
                                            makeButton("사업장폐기물"),
                                            makeButton("인테리어 폐기물"),
                                            makeButton("목재(MDF)"),
                                            makeButton("가구/가전제품")
                ])
        
                let CgBtn = DynamicButtonStack(buttons: [
                                            makeButton("주택(주거공간)"),
                                            makeButton("학원/독서실/PC방"),
                                            makeButton("식당/공유주방"),
                                            makeButton("유흥주점/노래방"),
                                            makeButton("병원/의원/약국")
                ])
        
                let CgBtn1 = DynamicButtonStack(buttons: [
                                            makeButton("사무실"),
                                            makeButton("상가"),
                                            makeButton("카페/제과점"),
                                            makeButton("뷰티/마사지샵"),////?
                                            makeButton("건물/외부 구조물")//?폐기물이랑 중복아님?
                ])

      
        switch listData?[indexPath.row]{
        case "특수청소":
            print("asdfasdfa:\(index)")
            TscsBtn.frame = CGRect(x: 0, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Row.rawValue)
            TscsBtn1.frame = CGRect(x: cell.UIView.frame.width / 2 , y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Row.rawValue)
            cell.UIView.addSubview(TscsBtn)
            cell.UIView.addSubview(TscsBtn1)
          
            
            return cell
        case "정리수납":
            print("asdfasdfa:\(index)")
            JrsnBtn.frame = CGRect(x: 0, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            JrsnBtn1.frame = CGRect(x: cell.UIView.frame.width / 2, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            
            cell.UIView.addSubview(JrsnBtn)
            cell.UIView.addSubview(JrsnBtn1)
            return cell
        case "폐기물":
            PgmBtn.frame = CGRect(x: 0, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            PgmBtn1.frame = CGRect(x: cell.UIView.frame.width / 2, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            print("\(PgmBtn.frame.minX),\( PgmBtn.frame.minY)")
            print("\(PgmBtn.frame.maxX),\(PgmBtn.frame.maxY)")
            //print("\(PgmBtn.frame.)")
            cell.UIView.addSubview(PgmBtn)
            cell.UIView.addSubview(PgmBtn1)
            return cell
        case "철거":
            CgBtn.frame = CGRect(x: 0, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            CgBtn1.frame = CGRect(x: cell.UIView.frame.width / 2, y: 0, width: cell.UIView.frame.width / 2, height: cellHeight.Jrsn.rawValue)
            cell.UIView.addSubview(CgBtn)
            cell.UIView.addSubview(CgBtn1)
            return cell
        case "디테일":
            bottom.backgroundColor = .yellow
            
            return bottom
            
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
