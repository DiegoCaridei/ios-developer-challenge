//
//  URLBuilder.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
import Alamofire
class URLBuilder {
    func applicationURL(with configuration: DCConfiguration) -> URL? {
        return URL(string: configuration.baseURL)?
            .appendingPathComponent("v1")
            .appendingPathComponent("public")
            .appendingPathComponent("comics")
    }
    func getParameters(with configuration: DCConfiguration) ->Parameters?{
       return  [
            "apikey": configuration.publicKey,
            "ts": configuration.timeStamp,
            "hash": configuration.hash,
            "orderBy":"-focDate",
            "limit":configuration.limit,
            "offset": "1"
        ]
    }
}
