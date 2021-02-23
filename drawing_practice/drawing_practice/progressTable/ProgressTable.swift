//
//  ProgressTable.swift
//  drawing_practice
//
//  Created by BigHand on 2021/02/23.
//

import UIKit
import SnapKit

class ProgressTable: UIViewController {


    let table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        table.delegate = self
        table.dataSource = self
        
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 100
        table.register(ProgressCell.self, forCellReuseIdentifier: ProgressCell.identifier)
        
        view.addSubview(table)
        table.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }

    }
    

 

}

extension ProgressTable: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProgressCell.identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
