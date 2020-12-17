//
//  PersonData.swift
//  TableViewExample
//
//  Created by Fury on 29/05/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation
import UIKit

class PersonData {
    var personImage: UIImage!
    var personName: String!
    var personAge: Int!
    
    init(personImage: UIImage, personName: String, personAge: Int) {
        self.personImage = personImage
        self.personName = personName
        self.personAge = personAge
    }
}
