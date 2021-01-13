//
//  ModalViewController.swift
//  passDataModal_practice
//
//  Created by BigHand on 2021/01/02.
//

import UIKit
import Alamofire
import SnapKit


class ModalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    let urlString = "https://www.juso.go.kr/addrlink/addrLinkApi.do"
    var data = ["as","df","qw","er"]
    var dataSource: [Juso] = []
    
    var delegate: PassDataToVc?
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        registerCell()
        fetchData()

        // Do any additional setup after loading the view.
    }
    
    private func fetchData() {
        let keyword = "화계사"
        let parameters: [String: Any] = ["confmKey": "U01TX0FVVEgyMDIwMTIwMjE2NDAyODExMDQ5MjA=",
                                         "currentPage": "1",
                                         "countPerPage": "15",
                                         "keyword": keyword,
                                         "resultType": "json"]
        AF.request(urlString,parameters: parameters ).responseJSON { (response) in
            switch response.result {
            case .success(let res):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                    let json = try JSONDecoder().decode(JusoResponse.self, from: jsonData)
                    self.dataSource = json.results.juso

                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }

                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

    private func registerCell() {
        table.register(JusoCell.self, forCellReuseIdentifier: JusoCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return data.count
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//---------------------------
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = data[indexPath.row]
//        return cell
//---------------------------
        let cell = tableView.dequeueReusableCell(withIdentifier: JusoCell.identifier) as! JusoCell
        cell.roadLabel.text = dataSource[indexPath.row].roadAddr
        cell.jibunLabel.text = dataSource[indexPath.row].jibunAddr
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let passData = dataSource[indexPath.row].roadAddr
        
        
        delegate?.passData(str: passData!)
        (presentingViewController as? ViewController)?.show.text = passData
        //sb?.show.text = passData
        //delegate.self
        //delegate?.passData(str: passData)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
protocol PassDataToVc {
    func passData(str: String)
}
