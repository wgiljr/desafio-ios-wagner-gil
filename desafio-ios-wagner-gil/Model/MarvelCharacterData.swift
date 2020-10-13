//
//  MarvelCharacterData.swift
//  desafio-ios-wagner-gil
//
//  Created by Wagner Gil Junior on 12/10/20.
//  Copyright © 2020 Wagner Gil Junior. All rights reserved.
//

import Foundation

struct MarvelCharacterData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [MarvelHero]
}
