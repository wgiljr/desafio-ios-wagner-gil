//
//  MarvelHero.swift
//  desafio-ios-wagner-gil
//
//  Created by Wagner Gil Junior on 12/10/20.
//  Copyright © 2020 Wagner Gil Junior. All rights reserved.
//

import Foundation

struct MarvelHero: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let urls: [HeroUrl]
}
