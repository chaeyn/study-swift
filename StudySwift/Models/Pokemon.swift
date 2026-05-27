//
//  Pokemon.swift
//  StudySwift
//
//  Created by chaeyn on 5/27/26.
//

import Foundation

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let image: String
    let types: [String]
    let height: Int
    let weight: Int
    let description: String
}
