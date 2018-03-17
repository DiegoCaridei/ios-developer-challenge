//
//  ServicesTest.swift
//  MarvelTests
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//

import XCTest
import Alamofire
import SwiftyJSON
import OHHTTPStubs

@testable import Marvel
class ServicesTest: XCTestCase {
    var sessionManager: SessionManager!
    var urlBuilder: URLBuilder!
    var configuration : DCConfiguration!
    
    override func setUp() {
        super.setUp()
        setupStub()
        setupSessionManager()
        urlBuilder = URLBuilder()
        configuration = DCConfiguration()
    }
    override func tearDown() {
        sessionManager = nil
        urlBuilder = nil
        configuration = nil
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }
    func setupStub(){
        stub(condition: isHost("gateway.marvel.com")) { request -> OHHTTPStubsResponse in
            var stubData = Data()
            if let path = Bundle.main.path(forResource: "datasourse", ofType: "json") {
                if let  jsonString = try? String(contentsOfFile: path) {
                    stubData = jsonString.data(using: String.Encoding.utf8)!
                }
            }
            return OHHTTPStubsResponse(data:stubData, statusCode:200, headers: ["Content-Type":"application/json"])
        }
    }
    func setupSessionManager(){
        let configuration = URLSessionConfiguration.default
        OHHTTPStubs.setEnabled(true, for: configuration)
        configuration.urlCache = nil
        sessionManager = SessionManager(configuration: configuration)
    }
    func testOHHTTPStubs()  {
        let expectation0 = self.expectation(description: "alamonfire")
        guard let url = urlBuilder.applicationURL(with: configuration) else {return}
        guard let parameter = urlBuilder.getParameters(with: configuration) else {return}
        sessionManager.request(url, method: .get, parameters: parameter).validate().responseJSON { (response) in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let comic = Comic(json: json)
                XCTAssertNotNil(comic)
                expectation0.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        XCTWaiter().wait(for: [expectation0], timeout: 3)
    }
}
