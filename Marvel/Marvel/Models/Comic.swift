//
//  Comic.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import Foundation
import SwiftyJSON
struct Comic {
    var thumbnailURL:String?
    var id:Int?
    var title:String?
    var coverURL:String?
    var description:String?
    init(json:JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        description = json["description"].stringValue
        let imagePath = json["thumbnail"]["path"].stringValue
        let ext = json["thumbnail"]["extension"].stringValue
        thumbnailURL = imagePath + "/portrait_medium." + ext
        coverURL = imagePath + "/portrait_uncanny." + ext
    }
    init(thumbnailURL:String,id:Int,title:String,coverURL:String,description:String) {
        self.thumbnailURL = thumbnailURL
        self.id = id
        self.title = title
        self.coverURL = coverURL
        self.description = description
    }
}
