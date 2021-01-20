//
//  ViewController.swift
//  APIRequest_practice
//
//  Created by BigHand on 2021/01/13.
//

import UIKit
import Alamofire
import MaterialComponents.MaterialChips
import MaterialComponents.MaterialChips_MaterialTheming

class ViewController: UIViewController {

    let UUID = "e0a188cd-22ed-4d8e-9872-66f851bef6b1"
    let url = "http://192.168.0.11:3000/team/membership/area"
    
    var dataSource : [Row] = []
    var landName : [Sigungus] = []
    
    var index: Int = 0
    var sigungusCnt: Int = 0
    
    @IBOutlet weak var cityTable: UITableView!
    @IBOutlet weak var countryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonDecoding()
        
        cityTable.delegate = self
        cityTable.dataSource = self
        
        countryTable.delegate = self
        countryTable.dataSource = self
        //getTest()
        
        
//        let chipView = MDCChipView()
//        chipView.titleLabel.text = "Tap Me"
//        chipView.setTitleColor(UIColor.red, for: .selected)
//        chipView.sizeToFit()
//        chipView.invalidateIntrinsicContentSize()
//        self.view.addSubview(chipView)
//
        let containerScheme = MDCContainerScheme()
         // Theme the chip with either default theme
        chip.applyTheme(withScheme: containerScheme)
         // Or outlined theme
        chip.applyOutlinedTheme(withScheme: containerScheme)
        
    }
    
    func getTest() {
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON{ (json) in
                print(json)
            }
    }

    func jsonDecoding() {
    
        AF.request(url,
                   parameters: nil).responseJSON { (response) in
                    switch response.result {
                    case .success(let res) :
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                            let json = try JSONDecoder().decode(Address.self, from: jsonData)
                            
                            self.dataSource = json.rows
 
                            for j in 0..<self.dataSource.count {
                                let sidoName = self.dataSource[j].sidoName
                                self.landName = self.dataSource[j].sigungus
                                print("[\(sidoName)]")
                                for k in 0..<self.landName.count {
                                    print(self.landName[k].sigunguName)
                                }
                                print("--------------------------------------------")
                            }
                            
                            DispatchQueue.main.async {
                                self.cityTable.reloadData()
                                //self.countryTable.reloadData()
                            }
                          
                        } catch(let err) {
                            print(err.localizedDescription)
                        }
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                    
                   }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == cityTable {
            return dataSource.count
        } else if tableView == countryTable {
           
            return sigungusCnt
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
        
        case cityTable:
            let cityCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
            
            cityCell.tag = indexPath.row
            cityCell.textLabel?.text = dataSource[indexPath.row].sidoName
            return cityCell
            
        case countryTable:
            let countryCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

            countryCell.textLabel?.text = dataSource[index].sigungus[indexPath.row].sigunguName
            return countryCell
        default:
            let cityCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
            cityCell.textLabel?.text = dataSource[indexPath.row].sidoName
            return cityCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if tableView == cityTable{
            print(indexPath.row)
            self.index = indexPath.row
            self.sigungusCnt = dataSource[index].sigungus.count
            countryTable.reloadData()

        }
        
    }

}
