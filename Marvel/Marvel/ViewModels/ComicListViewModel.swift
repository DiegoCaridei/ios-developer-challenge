//
//  ComicListViewModel.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
struct ComicListViewModel {
    var comicsViewModel : [ComicViewModel]
    init(comics:[Comic]) {
        self.comicsViewModel =  comics.flatMap { comic in
            return ComicViewModel(comic: comic)
        }
    }
}
