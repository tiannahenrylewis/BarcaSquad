//
//  FCBarcelonaAPITests.swift
//  FCBarcelonaAPITests
//
//  Created by Tianna Henry-Lewis on 2019-06-03.
//  Copyright © 2019 Tianna Henry-Lewis. All rights reserved.
//

import XCTest
@testable import Pods_BarcaSquad
@testable import BarcaSquad

class FCBarcelonaAPITests: XCTestCase {

    var client: FCBarcelonaAPI!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        client = FCBarcelonaAPI()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchesData() {
        let exp = expectation(description: "API Result Received")
        client.fetchPlayerList { result in
            exp.fulfill()
            switch result {
            case .success(let response):
                XCTAssert(response.players.count != 0)
                print(response.players)

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }

        wait(for: [exp], timeout: 3.0)
    }

}
