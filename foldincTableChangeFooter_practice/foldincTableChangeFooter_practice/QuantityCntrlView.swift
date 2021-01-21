//
//  QuantityCntrlView.swift
//  foldincTableChangeFooter_practice
//
//  Created by BigHand on 2021/01/21.
//
import UIKit

protocol ProductCellDelegate {
    func increaseNumber(cell: QuantityBtnView,number : Int)
    func decreaseNumber(cell: QuantityBtnView,number : Int)
}
class QuantityBtnView: UIView {
    
    var delegate : ProductCellDelegate?
    let minValue = 0
    
    let title: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10.0, y: 40.0, width: UIScreen.main.bounds.size.width - 20, height: 21)
        label.text = "제목"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    private let decreaseButton : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 10.0, y: 40.0, width: 28, height: 28)//UIScreen.main.bounds.size.width / 3
        //btn.setImage(UIImage(named: "minus_x1"), for: .normal)
        btn.imageView?.contentMode = .scaleToFill
        btn.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        //btn.imageView.image = #imageLiteral(resourceName: <#T##String#>)
        //btn.setImage(UIImage(named: "minus_x1"), for: .normal)
        //btn.backgroundColor = .blueyPurple
//        btn.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
//        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    private let increaseButton : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 10.0, y: 40.0, width: 28, height: 28)
        btn.imageView?.contentMode = .scaleAspectFit
        //btn.setImage(UIImage(named: "minus_x1"), for: .normal)
        //btn.setImage(UIImage(named: "plus_x1"), for: .normal)
        btn.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        //btn.backgroundColor = .black
        return btn
    }()

    var productQuantity : UILabel =  {
        let label = UILabel()
        label.frame = CGRect(x: 10.0, y: 40.0, width: 158, height: 28)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "1"
        label.textColor = .black
        
        //label.layer.borderColor = UIColor.black.cgColor
        //label.layer.borderWidth = 3
        label.layer.cornerRadius = 5
        
        //shadow
        label.backgroundColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5
       // label.backgroundColor = .yellow
        return label
        
    }()
    
    @objc func decreaseFunc(_sender: Any) {
        changeQuantity(by: -1)
        
    }
    
    @objc func increaseFunc(_sender: Any) {
        changeQuantity(by: 1)
    }
    
    
    func changeQuantity(by amount: Int) {
        var quality = Int(productQuantity.text!)!
        quality += amount
        if quality < minValue {
            quality = 0
            productQuantity.text = "0"
        } else {
            productQuantity.text = "\(quality)"
        }
        delegate?.decreaseNumber(cell: self, number: quality)
    }
    
    let View: UIView = {
        let view = UIView()
        //view.backgroundColor = .red//.white
        //view.setCellShadow()
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 100
        //stackView.distribution = .fillEqually
        return stackView
    }()
    let stackView1: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.contentMode = .scaleAspectFit
        return stackView
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        //self.addSubview(stackView)
        //stackView.addArrangedSubview(<#T##view: UIView##UIView#>)
        setup()
        setStackView()
        stackView.addArrangedSubview(title)
        
        stackView1.addArrangedSubview(decreaseButton)
        stackView1.addArrangedSubview(productQuantity)
        stackView1.addArrangedSubview(increaseButton)
        
        stackView.addArrangedSubview(stackView1)
         
        increaseButton.addTarget(self, action: #selector(increaseFunc), for: .touchUpInside)
        decreaseButton.addTarget(self, action: #selector(decreaseFunc), for: .touchUpInside)
     
    }

    func setup() {
        addSubview(View)
        
        View.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        View.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        View.topAnchor.constraint(equalTo: topAnchor).isActive = true
        View.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    func setStackView() {
        addSubview(stackView)

        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
