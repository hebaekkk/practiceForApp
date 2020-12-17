//
//  MainTableViewCell.swift
//  TableViewExample
//
//  Created by Fury on 29/05/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    
    let personImage: UIImageView = {
        let personImage = UIImageView()
        personImage.translatesAutoresizingMaskIntoConstraints = false
        return personImage
    }()
    
    let personName: UILabel = {
        let personName = UILabel()
        personName.translatesAutoresizingMaskIntoConstraints = false
        personName.font = UIFont.boldSystemFont(ofSize: 20)
        return personName
    }()
    
    let personAge: UILabel = {
        let personAge = UILabel()
        personAge.translatesAutoresizingMaskIntoConstraints = false
        personAge.font = UIFont.boldSystemFont(ofSize: 20)
        return personAge
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        autoLayout()
    }
    
    private func addContentView() {
        contentView.addSubview(personImage)
        contentView.addSubview(personName)
        contentView.addSubview(personAge)
    }
    
    private func autoLayout() {
        let margin: CGFloat = 10
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: self.topAnchor),
            personImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            personImage.widthAnchor.constraint(equalToConstant: 100),
            personImage.heightAnchor.constraint(equalToConstant: 100),
            
            personName.topAnchor.constraint(equalTo: self.topAnchor),
            personName.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: margin),
            personName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            personAge.topAnchor.constraint(equalTo: personName.bottomAnchor),
            personAge.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: margin),
            personAge.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            personAge.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            personAge.heightAnchor.constraint(equalTo: personName.heightAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
