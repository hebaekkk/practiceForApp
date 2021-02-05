//
//  SigunguJSON.swift
//  TSCleaning_PT
//
//  Created by BigHand on 2021/01/25.
//

import Foundation

// MARK: - Address
struct Address: Codable {
    let resCode: String
    let rows: [Row]?
}

// MARK: - Row
struct Row: Codable {
    let sidoID: Int
    let sigungus: [Sigungus]
    let sidoName: String

    enum CodingKeys: String, CodingKey {
        case sidoID = "sido_id"
        case sigungus
        case sidoName = "sido_name"
    }
}

// MARK: - Sigungus
struct Sigungus: Codable {
    let sigunguCode: Int
    let sigunguName: String

    enum CodingKeys: String, CodingKey {
        case sigunguCode = "sigungu_code"
        case sigunguName = "sigungu_name"
    }
}

