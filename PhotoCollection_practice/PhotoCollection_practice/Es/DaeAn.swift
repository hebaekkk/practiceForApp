//
//  DaeAn.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/17.
//

//import UIKit
import UIKit
//import IGListKit

class DaeAn: UIViewController {
    
    let names = ["하마","염소","당나귀","강아지"]
    
    //MARK : View Component
    let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(table)
        
    }
    

}
