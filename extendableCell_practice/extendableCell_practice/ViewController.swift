//
//  ViewController.swift
//  extendableCell_practice
//
//  Created by BigHand on 2020/12/24.
//

import UIKit
//[ ] Cell select 되면 오른쪽 이미지 변경되게 만들기



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var nameArr = ["나","는","할","수","있","다"]
    var SelectedIndex = -1
    var isCollapse = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.lblName.text! = nameArr[indexPath.row]
        cell.iconImg.image = UIImage(systemName: "chevron.down")

        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.SelectedIndex == indexPath.row && isCollapse == true {
            return 283
            
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if SelectedIndex == indexPath.row {
            if self.isCollapse == false {
                self.isCollapse = true
            } else {
                self.isCollapse = false
            }
        } else {
            self.isCollapse = true
        }
        
        
        
        self.SelectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    
    }

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        table.estimatedRowHeight = 283
        table.rowHeight = UITableView.automaticDimension
    }

    
    

}

