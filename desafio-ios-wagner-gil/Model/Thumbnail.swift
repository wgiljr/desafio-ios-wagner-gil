//
//  Thumbnail.swift
//  desafio-ios-wagner-gil
//
//  Created by Wagner Gil Junior on 05/08/20.
//  Copyright © 2020 Wagner Gil Junior. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    let path: String
    let ext: String
    
    enum CodinKey: String, CodingKey {
        case path
        case ext = "extension"
    }
    
    func getUrl() -> String{
        return path + "." + ext
    }
}
