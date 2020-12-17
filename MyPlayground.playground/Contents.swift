//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
protocol ProductCellDelegate {
    func increaseNumber(cell: ProductCell,number : Int)
    func decreaseNumber(cell: ProductCell,number : Int)
}
class MyViewController : UIViewController {


        var delegate : ProductCellDelegate?
        let minValue = 0
        

        private let decreaseButton : UIButton = {
            let btn = UIButton(type: .custom)
            btn.setImage(#imageLiteral(resourceName: "minusTb"), for: .normal)
            btn.imageView?.contentMode = .scaleAspectFill
            return btn
        }()
        
        private let increaseButton : UIButton = {
            let btn = UIButton(type: .custom)
            btn.setImage(#imageLiteral(resourceName: "addTb"), for: .normal)
            btn.imageView?.contentMode = .scaleAspectFill
            return btn
        }()
    
        var productQuantity : UILabel =  {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            label.text = "1"
            label.textColor = .black
            return label
            
        }()
        
        @objc func decreaseFunc() {
            changeQuantity(by: -1)
            
        }
        
        @objc func increaseFunc() {
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
        
        
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            addSubview(productImage)
            addSubview(productNameLabel)
            addSubview(productDescriptionLabel)
            addSubview(decreaseButton)
            addSubview(productQuantity)
            addSubview(increaseButton)
            
            productImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
            productNameLabel.anchor(top: topAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
            productDescriptionLabel.anchor(top: productNameLabel.bottomAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
            
            
            let stackView = UIStackView(arrangedSubviews: [decreaseButton,productQuantity,increaseButton])
            stackView.distribution = .equalSpacing
            stackView.axis = .horizontal
            stackView.spacing = 5
            addSubview(stackView)
            stackView.anchor(top: topAnchor, left: productNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: 0, height: 70, enableInsets: false)
            
            increaseButton.addTarget(self, action: #selector(increaseFunc), for: .touchUpInside)
            decreaseButton.addTarget(self, action: #selector(decreaseFunc), for: .touchUpInside)
        
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
    }

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
