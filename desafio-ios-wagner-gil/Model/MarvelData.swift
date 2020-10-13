//
//  MarvelCharacter.swift
//  desafio-ios-wagner-gil
//
//  Created by Wagner Gil Junior on 05/08/20.
//  Copyright © 2020 Wagner Gil Junior. All rights reserved.
//

import Foundation
import UIKit

struct MarvelData: Codable {
    let code: Int
    let status: String
    let data: MarvelCharacterData
}
