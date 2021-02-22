//
//  dVCViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/16.
//

import UIKit
import SnapKit

class dVC: UIViewController {
    
    var height: CGFloat = 300.0
    
//    func viewHeight(height: CGFloat) {
//        self.height = 400.0//Int(height)
//        setupView()
//        v.updateConstraints()
//
//
//    }
    let v: dView = {
        let view = dView()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7700186968, green: 0.6806464195, blue: 0.9275339246, alpha: 1)
        //case 1 view.addSubview(child.view)

        
        setupView()
        
        
    }
    
    //case 2
    func setupView() {
        view.addSubview(v)
        
        v.snp.makeConstraints{ make in
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.height.equalTo(self.height)
        }
    }
    
}
protocol dViewDelegate: class {
    func viewHeight(height: CGFloat)
}

class dView: UIView, UITableViewDelegate, UITableViewDataSource, DyTableCellDelegate {
    
    var tableHeight: CGFloat?
    //var delegate: dViewDelegate?
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    func moreTapped(cell: DyTableViewCell) {
        
        table.beginUpdates()
        
        //delegate?.viewHeight(height: table.contentSize.height)
        table.endUpdates()
        print(" update : \(table.contentSize.height)")
    }
    

    var myArray = [String]()
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return view
    }()
    
    let table = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        //MARK : Create random data
        for _ in 1...1 {
            let n = arc4random_uniform(6) + 4
            var str = ""
            for i in 1..<n {
                str += "Line \(i)\n"
            }
            str += "Line \(n)"
            
            self.myArray.append(str)
        }
        
        
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("dView 안되네")
    }
    
    func setupView() {
        //addSubview(view)
        //view.translatesAutoresizingMaskIntoConstraints = false
        
//        view.snp.makeConstraints{ make in
//            make.width.equalToSuperview()
//            make.height.equalTo(200)
//        }
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        
        
        let footer = UIView(frame: .zero)//(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        footer.backgroundColor = .systemBlue
        
        table.tableFooterView = footer
        
        addSubview(table)
        table.snp.makeConstraints{ make in
            make.leading.equalTo(self).offset(12)
            make.trailing.equalTo(self).offset(-12)
            //make.bottom.equalTo(self.view)
            make.height.equalTo(250)
            make.top.equalTo(self)//.offset(20)
        }
        
        addSubview(bottomView)
        bottomView.snp.makeConstraints{ make in
            make.leading.equalTo(self).offset(12)
            make.trailing.equalTo(self).offset(-12)
            make.height.equalTo(10)
            make.top.equalTo(self.table.snp_bottom).offset(4)
        }
        table.register(DyTableViewCell.self, forCellReuseIdentifier: DyTableViewCell.identifier)
        print("Table ContentSize : \(table.contentSize)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.isScrollEnabled = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DyTableViewCell.identifier, for: indexPath) as! DyTableViewCell
        
        //cell.textLabel!.text = "CHANEL"
        let str = myArray[indexPath.row]
        let aTmp = str.components(separatedBy: "\n")
        
        cell.myInit(theTitle: "\(indexPath) with \(aTmp.count) rows", theBody: str)
        cell.delegate = self
        return cell
    }
    
}

class dTableCell: UITableViewCell {
    
    static let identifier = "dTableCell"
    
    let adrLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "주우우우우우우우우소오오오오오오오"
        return label
    }()
    let cleanKindLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "청소 종류"
        return label
    }()
    
    let starLabel: UIView = {
        let view = starAndLabel()
        view.starLabel.textAlignment = .right
        view.starLabel.text = "별점"
        return view
    }()
    
    var days: String = "0"
    
    let passedDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "일 전"
        return label
    }()
    
    let imageCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionViewWidth = UIScreen.main.bounds.width - 48
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: collectionViewWidth, height: 20), collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .red
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //MARK : Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("dTableCell init coder has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(adrLabel)
        contentView.addSubview(cleanKindLabel)
        contentView.addSubview(starLabel)
        contentView.addSubview(passedDayLabel)
        contentView.addSubview(imageCollection)
        
        adrLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(12)
            make.leading.equalTo(contentView).offset(24)
            make.height.equalTo(24)
        }
        cleanKindLabel.snp.makeConstraints{ make in
            make.top.equalTo(adrLabel.snp_bottom)
            make.leading.equalTo(contentView).offset(24)
            make.height.equalTo(24)
        }
        starLabel.snp.makeConstraints{ make in
            make.width.equalTo(60)
            make.top.equalTo(contentView).offset(12)
            make.trailing.equalTo(contentView.snp_trailing).offset(-24)
            make.height.equalTo(24)
        }
        passedDayLabel.snp.makeConstraints { make in
            make.top.equalTo(starLabel.snp_bottom)
            make.trailing.equalTo(contentView).offset(-24)
            make.height.equalTo(24)
        }
        
        
        imageCollection.delegate = self
        imageCollection.dataSource = self
        imageCollection.register(dTableCollectionCell.self, forCellWithReuseIdentifier: dTableCollectionCell.identifier)
        imageCollection.snp.makeConstraints{ make in
            make.leading.equalTo(contentView).offset(24)
            make.trailing.equalTo(contentView).offset(-24)
            //make.bottom.equalTo(contentView).offset(-10)
            make.top.equalTo(cleanKindLabel.snp_bottom).offset(4)
            make.top.equalTo(passedDayLabel.snp_bottom).offset(4)
            make.height.equalTo(30)
                                  
        }
        
        
        
    }
}

extension dTableCell: UICollectionViewDelegate {
    
}
extension dTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dTableCollectionCell.identifier, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    
}

extension dTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20, height: 20)
    }
}

class dTableCollectionCell: UICollectionViewCell {
    static let identifier = "dTableCollectionCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.setupViews()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViews()
        
    }
    
    func setupViews(){
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
