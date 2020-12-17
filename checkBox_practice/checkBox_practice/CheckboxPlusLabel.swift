//
//  CheckboxPlusLabel.swift
//  checkBox_practice
//
//  Created by BigHand on 2020/12/14.
//

import UIKit

class CheckboxPlusLabel: UIView {
    
        var isChecked = false
        
        let View: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 15
            stackView.distribution = .fillProportionally
            return stackView
        }()
        
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.isHidden = false
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = .gray
            imageView.image = UIImage(systemName: "checkmark.circle")
            return imageView
        }()
        
        let boxView: UIView = {
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            return view
        }()
        
        let label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
            
            label.text = ""
            label.font = UIFont.systemFont(ofSize: 15)
            label.textAlignment = .left
            label.textColor = .gray
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.backgroundColor = .green
            
            return label
        }()
        
        override init(frame: CGRect){
            super.init(frame: frame)
            //translatesAutoresizingMaskIntoConstraints = false
            backgroundColor = .yellow

            setup()
            //setStackView()
            boxView.backgroundColor = .white
            imageView.frame = bounds
            boxView.addSubview(imageView)
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            View.addSubview(boxView)
            //View.addSubview(imageView)
            View.addSubview(label)
            label.leftAnchor.constraint(equalTo: View.leftAnchor, constant: 44).isActive = true
            label.rightAnchor.constraint(equalTo: View.rightAnchor,constant: 0).isActive = true
            label.topAnchor.constraint(equalTo: View.topAnchor,constant: 0).isActive = true
            label.bottomAnchor.constraint(equalTo: View.bottomAnchor,constant: 0).isActive = true
            clipsToBounds = true
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox))
            addGestureRecognizer(gesture)
        }
        func setup() {
            addSubview(View)
            View.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            View.topAnchor.constraint(equalTo: topAnchor).isActive = true
            View.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            View.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
        @objc func didTapCheckbox() {
            print("하하하")
        }
    //    func setStackView() {
    //        View.addSubview(stackView)
    //
    //        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
    //        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    //        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
    //        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    //    }

        required init?(coder: NSCoder) {
            fatalError()
        }
        
        public func toggle() {
            if isChecked {
                imageView.tintColor = .purple
                label.textColor = .purple
                
            } else {
                imageView.tintColor = .gray
                label.textColor = .gray
            }
            
            self.isChecked = !isChecked

        }

    }
