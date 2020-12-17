//
//  ViewController.swift
//  CustomCellTable_practice
//
//  Created by BigHand on 2020/11/19.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    
    let bandCellId = "bandCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //register the CustomCell
        tableView.register(BandCell.self, forCellReuseIdentifier: bandCellId)

        view.addSubview(tableView)
        
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    //Section의 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    //table 한 섹션당 cell의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    //table의 cell을 정해주는것(?)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bandCellId, for: indexPath) as! BandCell
            return cell
    }
    //Cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return   200  }
    //Cell title 제목 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Top Songs"
        }
        return "Top Brands"
    }
}
class BandCell: UITableViewCell {

    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        //view.setCellShadow()
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10.0, y: 40.0, width: UIScreen.main.bounds.size.width - 20, height: 21)
        label.text = "제목"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .left
        label.textColor = .blueyPurple
        label.numberOfLines = 0
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setStackView()
        stackView.addArrangedSubview(title)
        addButtonsToStackView()
    }
    
    func setStackView() {
        addSubview(stackView)

        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
    


    func addButtonsToStackView() {
        let buttonText: [String] = [
                 "a",
                 "b",
                 "c"
        ]
             
        let numberOfButtons = buttonText.count
        
        let column = 2
        let row: Int
        
        if numberOfButtons % column != 0 {
            row = (numberOfButtons / column) + 1
        } else {
            row = numberOfButtons / column
        }

        
        for i in 0 ..< row {
            
            let horizontalSv = UIStackView()
            horizontalSv.axis = .horizontal
            //horizontalSv.alignment = .fill

            horizontalSv.distribution = .fillEqually
            horizontalSv.spacing = 10
            
            for j in 0 ..< column {
                if buttonText.count  == i*column + j {
                    let hideButton = SurveyButton()
                    // make tranparant !
                    // no tag
                    // no selector
                    // no like View
                    horizontalSv.addArrangedSubview(hideButton)
                    break
                }
                let button = SurveyButton()
                button.setTitle("\(buttonText[ i*column + j  ])",for: .normal)
                button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 15)
                button.tag = i*column + j + 1
                //button.addTarget(self, action: #selector(handleCleaningKinds(_:)), for: .touchUpInside)
                horizontalSv.addArrangedSubview(button)
            }
            stackView.addArrangedSubview(horizontalSv)
        }
        

    }
    
    func setup() {
        addSubview(cellView)
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 4, paddingRight: 8)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func setAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
                   paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant:  paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant:  paddingLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant:  -paddingRight).isActive = true
        }
    }
}
extension UIColor {
    func hexStringToUIColor (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor (
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat((rgbValue & 0x0000FF) ) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    @nonobjc class var blueyPurple: UIColor {
        return UIColor(red: 95.0/255.0, green: 61.0 / 255.0, blue: 196.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var white: UIColor {
        return UIColor(red: 248.0/255.0, green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    }
    
    static func fromRGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
class SurveyButton: UIButton {
    override init(frame: CGRect){
        super.init(frame: frame)
        setupButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    func setupButton() {
        setTitleColor(UIColor.fromRGB(173, 181, 189), for: .normal)
        backgroundColor  = .white
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 20)
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        //shadow
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 4.0
        layer.masksToBounds = false
    }
}
