//
//  ServiceArea.swift
//  TSCleaning_PT
//
//  Created by BigHand on 2021/02/03.
//

import Foundation

struct UserLocation: Codable {
    let resCode: String
    let serviceArea: [ServiceArea]

    enum CodingKeys: String, CodingKey {
        case resCode
        case serviceArea = "service_area"
    }
}


struct ServiceArea: Codable {
    let sigunguKey: Int
    let sigungu, sido: String
    
    enum CodingKeys: String, CodingKey {
        case sigunguKey = "sigungu_key"
        case sigungu, sido
    }
}
