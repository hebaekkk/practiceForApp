//
//  ViewController.swift
//  extendableCell_practice
//
//  Created by BigHand on 2020/12/24.
//

import UIKit
//[ ] Cell select 되면 오른쪽 이미지 변경(chevron.up)되게 만들기
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var nameArr = ["나","는","할","수","있","다"]
    var SelectedIndex = -1

    var flag = false

    var isCollapse = false

    var isExpand = false
    
    var cellHeight = 280
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.lblName.text! = nameArr[indexPath.row]
        self.isExpand = (self.SelectedIndex == indexPath.row && isCollapse) //== true)
        cell.iconImg.image = UIImage(systemName: self.isExpand ?  "chevron.up" : "chevron.down")
        
        //cell.UIView.isHidden = true
        
        let makeButton: (String?) -> UIButton = { title in
            let button = UIButton()
            button.setTitle(title, for: .normal)
            
            button.setTitleColor(.label, for: .normal)
            button.titleLabel!.font = UIFont.preferredFont(forTextStyle: .body)
            button.titleLabel?.font = UIFont(name: "bold", size: 10)
            //If you want to add image add the arg of String one more and then uncap this code.
    //        if let imageName = imageName {
    //                  button.setImage(UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(font: button.titleLabel!.font)), for: .normal)
    //              }
            button.layer.cornerRadius = 8
            button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            button.backgroundColor = .white
            
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.purple.cgColor
        
            return button
        }
        
//        let TscsBtn = DynamicButtonStack(buttons: [
//            makeButton("집쓰레기 배출 / 청소"),
//            makeButton("유품정리 / 고독사"),
//            makeButton("유품정리/고독사"),
//            makeButton("사고현장정리"),
//            makeButton("침수 / 수해복구청소")
//        ])
        let TscsBtn = DynamicButtonStack(buttons: [
            makeButton("aaaaaaa"),
            makeButton("bbbbbbb"),
            makeButton("ccccccc"),
            makeButton("ddddddd"),
            makeButton("eeeeeee")
        ])
//        let TscsBtn1 = DynamicButtonStack(buttons: [
//            makeButton("이사 후 퇴실청소"),
//            makeButton("화재현장 청소"),
//            makeButton("빈집 만들기"),
//            makeButton("사고현장정리"),
//            makeButton("기타 특수청소"),
//        ])
//
        let TscsBtn1 = DynamicButtonStack(buttons: [
            makeButton("aaaaaaa"),
            makeButton("bbbbbbb"),
            makeButton("ccccccc"),
            makeButton("ddddddd"),
            makeButton("eeeeeee")
        ])
        let JrsnBtn = DynamicButtonStack(buttons: [
            makeButton("집 전체"),
            makeButton("드레스룸/옷방(의류)"),
            makeButton("거실"),
            makeButton("방2개"),
            makeButton("이삿짐 정리")
        ])

        let JrsnBtn1 = DynamicButtonStack(buttons: [
            makeButton("주방"),
            makeButton("베란다 / 다용도실"),
            makeButton("방 1개"),
            makeButton("방 3개"),
            makeButton("상담 후 결정")
        ])
        
        TscsBtn.alpha = 0
        TscsBtn1.alpha = 0
        JrsnBtn.alpha = 0
        JrsnBtn1.alpha = 0
        
        
    
        
        switch indexPath.row{
        case 0:
            print("000000000")
            
            TscsBtn.frame = CGRect(x: 0, y: 0, width: 199, height: 200)
            TscsBtn1.frame = CGRect(x: 0, y: 0, width: 199, height: 200)
            
            let stackView = UIStackView()
        
            
            
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.axis = .horizontal
            stackView.spacing = 0
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.addArrangedSubview(TscsBtn)
            TscsBtn.backgroundColor = UIColor(red: 133/255, green: 123/255, blue: 156/255, alpha: 0.5)
            stackView.addArrangedSubview(TscsBtn1)
            
            TscsBtn.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
            TscsBtn.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
            //TscsBtn.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
            //TscsBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            TscsBtn1.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
            TscsBtn1.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
            //TscsBtn1.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
            //TscsBtn1.widthAnchor.constraint(equalToConstant: 100).isActive = true

            
            
            cell.UIView.addSubview(stackView)
            stackView.leadingAnchor.constraint(equalTo: cell.UIView.leadingAnchor).isActive = true
            stackView.trailingAnchor.constraint(equalTo: cell.UIView.trailingAnchor).isActive = true
            stackView.topAnchor.constraint(equalTo: cell.UIView.topAnchor, constant: 5).isActive = true
            //stackView.bottomAnchor.constraint(equalTo: cell.UIView.bottomAnchor).isActive = true
            
            self.cellHeight = 380
            cell.UIView.isHidden = false
            TscsBtn.alpha = 1
            TscsBtn1.alpha = 1
            
        case 1: //정리수납
            print("11111111")
            JrsnBtn.frame = CGRect(x: 0, y: 0, width: cell.frame.width / 2, height: 200)
            JrsnBtn1.frame = CGRect(x: 0, y: 0, width: cell.frame.width / 2, height: 200)
            
            let stackView = UIStackView()
            
            
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.axis = .horizontal
            stackView.spacing = 0
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.addArrangedSubview(JrsnBtn)
            JrsnBtn.backgroundColor = UIColor(red: 133/255, green: 123/255, blue: 156/255, alpha: 0.5)
            stackView.addArrangedSubview(JrsnBtn1)
            
            cell.UIView.addSubview(stackView)
            stackView.leadingAnchor.constraint(equalTo: cell.UIView.leadingAnchor).isActive = true
            stackView.trailingAnchor.constraint(equalTo: cell.UIView.trailingAnchor).isActive = true
            stackView.topAnchor.constraint(equalTo: cell.UIView.topAnchor).isActive = true
            stackView.bottomAnchor.constraint(equalTo: cell.UIView.bottomAnchor).isActive = true
        
            cell.UIView.isHidden = false
        default:
            print("하하")
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.SelectedIndex == indexPath.row && isCollapse == true {
            return CGFloat(cellHeight)
        } else {
            return 40//CGFloat(cellHeight)
        }
    }

    var select = false

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        //tableView.deselectRow(at: indexPath, animated: true)

        if SelectedIndex == indexPath.row {
            if self.isCollapse == false {
                self.flag = true
                self.isCollapse = true
            } else {
                self.isCollapse = false
            }
        } else {
            self.flag = true
            self.isCollapse = true
        }
        self.SelectedIndex = indexPath.row
        
        //tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .fade)
        

    }

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.estimatedRowHeight = CGFloat(cellHeight)
        table.rowHeight = UITableView.automaticDimension
    }
}

