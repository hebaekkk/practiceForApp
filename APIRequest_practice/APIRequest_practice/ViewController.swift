//
//  ViewController.swift
//  APIRequest_practice
//
//  Created by BigHand on 2021/01/13.
//

import UIKit
import Alamofire
import MaterialComponents.MaterialChips
import SwiftyGif
//import MaterialComponents.MaterialChips_MaterialTheming

class ViewController: UIViewController {

    let logoAnimationView = LogoAnimationView()
    
    
    let UUID = "e0a188cd-22ed-4d8e-9872-66f851bef6b1"
    let url = "http://192.168.0.11:3000/team/membership/area"
    
    var dataSource : [Row] = []
    var landName : [Sigungus] = []
    
    var tags:[String] = Array()
    @IBOutlet weak var selectCount: UILabel!
    //@IBOutlet weak var totalCountLabel: UILabel!
    
    @IBOutlet weak var totalCountLabel: UILabel!
    var totalCount: Int = 10
    
    
    var index: Int = 0
    var sigungusCnt: Int = 0
    
    @IBOutlet weak var cityTable: UITableView!
    @IBOutlet weak var countryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(logoAnimationView)
        logoAnimationView.pinEdgesToSuperView()
        logoAnimationView.logoGifImageView.delegate = self
        
        
        
        jsonDecoding()
        
        cityTable.delegate = self
        cityTable.dataSource = self
        
        countryTable.delegate = self
        countryTable.dataSource = self
        
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        totalCountLabel.text = String(describing: totalCount)
        print("TAGS : \(tags.count)")
        //getTest()
        
        
//        let chipView = MDCChipView()
//        chipView.titleLabel.text = "Tap Me"
//        chipView.setTitleColor(UIColor.red, for: .selected)
//        chipView.sizeToFit()
//        chipView.invalidateIntrinsicContentSize()
//        self.view.addSubview(chipView)
//
        //let containerScheme = MDCContainerScheme()
         // Theme the chip with either default theme
        //chip.applyTheme(withScheme: containerScheme)
         // Or outlined theme
        //chip.applyOutlinedTheme(withScheme: containerScheme)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimationView.logoGifImageView.startAnimatingGif()
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
        
        if tableView == countryTable {
            print(dataSource[index].sigungus[indexPath.row].sigunguName)
            let name = dataSource[index].sigungus[indexPath.row].sigunguName
            if tags.contains(where: {$0 == name}){
                print("중복이야")
            } else {
                tags.append(dataSource[index].sigungus[indexPath.row].sigunguName)
            }
            
            if(tags.count <= totalCount){
                
                createTagCloud(OnView: self.view, withArray: tags as [AnyObject])
            }else {
                //여기에다 범위 넘어갔다는 팝업 띄워줘야돼
                print("CAN'T!! You Exceed select number!")
            }
        }
        
    }
    


}
//MARK : TAG ARRAY
extension ViewController {
    
    func createTagCloud(OnView view: UIView, withArray data: [AnyObject]) {
        
        for tempView in view.subviews {
            if tempView.tag != 0 {
                tempView.removeFromSuperview()
            } else {
                self.selectCount.text = "0"
            }
        }
        
        
        var xPos: CGFloat = 15.0
        var yPos: CGFloat = UIScreen.main.bounds.height/2 + 30//130
        
        var tag: Int = 1
        
        for str in data {
            let startString = str as! String
            let width = startString.widthOfString(usingFont: UIFont.systemFont(ofSize: 18))
            let checkWholeWidth = CGFloat(xPos) + CGFloat(width) + CGFloat(13.0) + CGFloat(25.5)
            if checkWholeWidth > UIScreen.main.bounds.size.width - 30.0 {
                //we are exeeding size need to change xpos
                xPos = 15.0
                yPos = yPos + 29.0 + 8.0
            }
            
            let bgView = UIView(frame: CGRect(x: xPos, y: yPos, width: width + 20.0, height: 29.0))
            bgView.layer.cornerRadius = 14.5
            bgView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            bgView.tag = tag
            
            let textlabel = UILabel(frame: CGRect(x: 17.0, y: 0.0, width: width, height: bgView.frame.size.height))
            textlabel.font = UIFont(name: "veranda", size: 13.0)
            textlabel.text = startString
            textlabel.textColor = UIColor.white
            bgView.addSubview(textlabel)
            
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: bgView.frame.size.width - 2.5 - 20.0, y: 3.0, width: 23.0, height: 23.0)
            button.backgroundColor = .white
            button.layer.cornerRadius = CGFloat(button.frame.size.width)/CGFloat(2.0)
            button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
            button.tag = tag
            button.addTarget(self, action: #selector(removeTag(_:)), for: .touchUpInside)
            bgView.addSubview(button)
            xPos = CGFloat(xPos) + CGFloat(width) + CGFloat(25.0) // + CGFloat(43.0)
            view.addSubview(bgView)
            //DispatchQueue.main.async {
            if tags.count == 0{
                self.selectCount.text = "0"//String(describing:tag)
            } else {
                self.selectCount.text = String(describing:tag)
            }
            
            
            //self.selectCount.text = String(describing:tag)
          
            
            tag = tag + 1
            print("tgs : \(tags)")
            
        }
    }
    
    @IBAction func addTag(_ sender: AnyObject){
        
    }
    
    @objc func removeTag(_ sender: AnyObject) {
        
        if tags.count == 0 {
            self.selectCount.text = "0"
        }
        
        tags.remove(at: (sender.tag - 1))
        createTagCloud(OnView: self.view, withArray: tags as [AnyObject])
    }
    
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width + CGFloat(23)
    }
}

extension ViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        logoAnimationView.isHidden = true
    }
}


