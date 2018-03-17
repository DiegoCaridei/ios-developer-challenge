//
//  DCConfiguration.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
import SwiftHash
public struct DCConfiguration {
    let baseURL: String
    let timeStamp : Int
    let limit:Int
    let publicKey : String
    let privateKey:String
    let hash:String
    init(baseURL:String="http://gateway.marvel.com"
        ,publicKey:String="1d627cdc79e2abfdb408ea522ba448e9",
         privateKey:String="c3163c7c97eea6fad855668fc71f179088fd667c",
         limit:Int = 50) {
        self.baseURL = baseURL
        self.timeStamp = Int(Date().timeIntervalSince1970)
        self.publicKey = publicKey
        self.privateKey = privateKey
        self.hash = MD5(String(timeStamp) + privateKey + publicKey).lowercased()
        self.limit = limit
    }
}
