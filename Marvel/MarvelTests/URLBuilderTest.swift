//
//  URLBuilderTest.swift
//  MarvelTests
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import XCTest
import Alamofire
import SwiftHash
@testable import Marvel
class URLBuilderTest: XCTestCase {
    var urlBulilder:URLBuilder!
    var configuration: DCConfiguration!
    var parameter: Parameters!
    
    override func setUp() {
        super.setUp()
        urlBulilder = URLBuilder()
        configuration = DCConfiguration()
        parameter = urlBulilder.getParameters(with: configuration)
    }
    override func tearDown() {
        urlBulilder = nil
        configuration = nil
        parameter = nil
        super.tearDown()
    }
    func testHash(){
        let hash  = MD5(String(configuration.timeStamp) + configuration.privateKey + configuration.publicKey).lowercased()
        XCTAssertEqual(hash, configuration.hash)
    }
    func testApikeyParameter()  {
        let apiKey = String(describing: parameter["apikey"]!)
        XCTAssertEqual(configuration.publicKey, apiKey)
    }
    func testOffsetParameter() {
        let offset = String(describing: parameter["offset"]!)
        XCTAssertEqual(offset, "1")
    }
}
