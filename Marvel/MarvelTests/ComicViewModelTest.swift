//
//  ComicViewModelTest.swift
//  MarvelTests
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import XCTest
@testable import Marvel
class ComicViewModelTest: XCTestCase {
    var comic:Comic!
    var comicViewModel:ComicViewModel!
    var comicListViewModel:ComicListViewModel!
    let thumbnailURL = "http://marvel.com"
    let id = 2
    let title = "Venom"
    let coverURL = "http://marvel.com/cover"
    let comicDescription = "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend"
    
    override func setUp() {
        super.setUp()
        comic = Comic(thumbnailURL: thumbnailURL, id: id, title:title , coverURL: coverURL, description: comicDescription )
        comicViewModel = ComicViewModel(comic: comic)
        comicListViewModel = ComicListViewModel(comics: [comic])
    }
    override func tearDown() {
        comic = nil
        comicViewModel = nil
        comicListViewModel = nil
        super.tearDown()
    }
    func testComic() {
        XCTAssertNotNil(comic)
        XCTAssertEqual(comic.id!, id)
        XCTAssertEqual(comic.thumbnailURL!, thumbnailURL)
        XCTAssertEqual(comic.title!, title)
        XCTAssertEqual(comic.coverURL!, coverURL)
        XCTAssertEqual(comic.description!, comicDescription)
    }
    func testComicViewModel()  {
        XCTAssertNotNil(comicViewModel)
        XCTAssertEqual(comicViewModel.title!, title)
        XCTAssertEqual(comicViewModel.coverURL!, coverURL)
        XCTAssertEqual(comicViewModel.description!, comicDescription)
    }
    func testComicListViewModel(){
        XCTAssertNotNil(comicListViewModel)
        XCTAssertEqual(comicListViewModel.comicsViewModel.count, 1)
    }
}
