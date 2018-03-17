//
//  DataProvider.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
class DataProvider {
    typealias comicsDataHandeler = (ComicListViewModel)->()
    static func getComics(completion: @escaping comicsDataHandeler){
        APIComic.shared.getComics { (results) in
            switch results {
            case .success(let comics):
                completion(ComicListViewModel(comics: comics))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
