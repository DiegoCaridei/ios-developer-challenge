//
//  MainViewControllerTest.swift
//  MarvelTests
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import XCTest
@testable import Marvel
class MainViewControllerTest: XCTestCase {
    var mainViewController:MainViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard.init(name: IDENTIFIER.storyboardName, bundle: nil)
        mainViewController = storyboard.instantiateViewController(withIdentifier: IDENTIFIER.mainViewControllerID) as! MainViewController
        _ = mainViewController.view
    }
    override func tearDown() {
        mainViewController = nil
        super.tearDown()
    }
    func testCollectionViewDataSource() {
        XCTAssertNotNil(mainViewController.comicsCollectionView.dataSource)
    }
}
