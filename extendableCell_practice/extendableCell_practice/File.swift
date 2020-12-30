////
////  File.swift
////  extendableCell_practice
////
////  Created by BigHand on 2020/12/30.
////
//
//import UIKit
//
// 
//
//protocol selectDelegate {
//
//    func sendCell(selectText:tableCell, str : String)
//
//}
//
// 
//
//class ViewController: UIViewController, selectDelegate {
//
//    var selectRow : Int?
//
//    var arr = [String](repeating: "", count: 100)   // 이 예제에서 100개의 cell 만들었음
//
// 
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view, typically from a nib.
//
//        table.delegate = self
//
//        table.dataSource = self
//
//        table.register(tableCell.self, forCellReuseIdentifier: "cell")
//
//        
//
//        view.addSubview(table)
//
//        
//
//        NSLayoutConstraint.activate([
//
//            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//
//            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//
//            table.topAnchor.constraint(equalTo: view.topAnchor),
//
//            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//
//            ])
//
// 
//
//    }
//
// 
//
//    let table : UITableView = {
//
//        let table = UITableView()
//
//        table.translatesAutoresizingMaskIntoConstraints = false
//
//        return table
//
//    }()
//
//    
//
//    func sendCell(selectText: tableCell, str: String) {
//
//        if let index = table.indexPath(for: selectText) {
//
//            arr[index.row] = str
//
//        }
//
//    }
//
//}
//
// 
//
//extension ViewController : UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return arr.count
//
//    }
//
// 
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! tableCell
//
//        cell.delegate = self
//
//        cell.textField.text = arr[indexPath.row]
//
//        return cell
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 50
//
//    }
//
//}
//
//class tableCell : UITableViewCell {
//
//    
//
//    var delegate : selectDelegate?
//
//    
//
//    override func layoutSubviews() {
//
//        super.layoutSubviews()
//
//        
//
//        addSubview(textField)
//
//        textField.addTarget(self, action: #selector(textSelect), for: UIControl.Event.editingChanged)
//
// 
//
//        NSLayoutConstraint.activate([
//
//            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
//
//            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
//
//            textField.topAnchor.constraint(equalTo: topAnchor),
//
//            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
//
//            ])
//
//    }
//
//    
//
//    @objc func textSelect() {
//
//        delegate?.sendCell(selectText: self, str: textField.text ?? "")
//
//    }
//
//    let textField : UITextField = {
//
//        let text = UITextField()
//
//        text.translatesAutoresizingMaskIntoConstraints = false
//
//        return text
//
//    }()
//
// 
//
//}
