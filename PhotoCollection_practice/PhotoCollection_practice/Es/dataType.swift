//
//  dataType.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/17.
//

import Foundation
import UIKit


enum Section {
    case main
}

enum ListItem: Hashable {
    case header(HeaderItem)
    case symbol(SFSymbolItem)
}

struct HeaderItem: Hashable {
    let title: String
    let symbols: [SFSymbolItem]
}

struct Item: Hashable {
    let title: String
}

struct SFSymbolItem: Hashable {
    let name: String
    let image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(systemName: name)!
    }
}
