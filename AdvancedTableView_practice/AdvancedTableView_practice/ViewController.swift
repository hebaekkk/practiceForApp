//
//  ViewController.swift
//  AdvancedTableView_practice
//
//  Created by BigHand on 2020/12/30.
//

import UIKit

class ViewController: UIViewController {

    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        
        table.register(CollectionTableViewCell.self,
                       forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private var models = [CellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
    }
    
    private func setUpModels() {
        models.append(.collectionView(models: [
            CollectionTableCellModel(title: "Car1", imageName: "car1"),
            CollectionTableCellModel(title: "Car2", imageName: "car2"),
            CollectionTableCellModel(title: "Car3", imageName: "car3"),
            CollectionTableCellModel(title: "Car4", imageName: "car4"),
            CollectionTableCellModel(title: "Car5", imageName: "car5"),
        ],
        rows: 2))
        
        models.append(.list(models: [
            ListCellModel(title: "A"),
            ListCellModel(title: "B"),
            ListCellModel(title: "C"),
            ListCellModel(title: "D"),
            ListCellModel(title: "E")
        ]))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch models[section] {
        case .list(let models): return models.count
        case .collectionView(_, _): return 1
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .list(let models):
            let model = models[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                     for: indexPath)
            cell.textLabel?.text = model.title
            return cell
        case .collectionView(let models, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier,
                                                     for: indexPath) as! CollectionTableViewCell
            cell.configure(with: models)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch models[indexPath.section] {
        case .list(_): return 50
        case .collectionView(_, let rows): return 180 * CGFloat(rows)
        }
    }
}

 
