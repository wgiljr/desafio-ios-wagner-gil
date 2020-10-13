//
//  MarvelAPI.swift
//  desafio-ios-wagner-gil
//
//  Created by Wagner Gil Junior on 05/08/20.
//  Copyright © 2020 Wagner Gil Junior. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI {
    
    static let basePath = "https://gateway.marvel.com/v1/public"
    static let pathCharacters = "/characters?"
    static let limit = 20
    static private let privateKey = "6121805bd71d1179e2e29e24cc96cc640113d1aa"
    static private let publicKey = "45f8900c524b0543f32e1799aac30cc8"
    
    static func loadCharacters (page: Int = 0, onComplete: @escaping (MarvelData?) -> Void) {
        let offset = page * limit
        
        let url = basePath + pathCharacters + "offset=\(offset)&limit=\(limit)&" + getCredentials()
        
        AF.request(url)
                    .validate()
                    .responseJSON { response in
                        print(response)
                        switch response.result {
                        case .success:
        //                    guard let jsonData = response.data, let value = response.value, let marvelData = try?  JSONDecoder().decode(MarvelData.self, from: jsonData) else {
        //                        onComplete(nil)
        //                        return
        //                    }
        //
        //                    onComplete(marvelData)
        //                    return
                            
                            guard let data = response.data,
                                let marvelInfo = try? JSONDecoder().decode(MarvelData.self, from: data),
                                marvelInfo.code == 200 else {
                                    onComplete(nil)
                                    return
                            }
                            onComplete(marvelInfo)
                            
                        case .failure(let error):
                            print(error)
                        }
                }
    }
    
    static func getCredentials() -> String{
        let ts = Date().timeIntervalSince1970.description
        let hash = MD5(ts+privateKey+publicKey).lowercased()

        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
