//
//  ComicViewModel.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
struct ComicViewModel {
    let title:String?
    let description:String?
    let coverURL:String?
    let miniCover:String?
    init(comic:Comic) {
        self.title = comic.title
        self.description = comic.description
        self.coverURL =  comic.coverURL
        self.miniCover =  comic.thumbnailURL
    }
}
