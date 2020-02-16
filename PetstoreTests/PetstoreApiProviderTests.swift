//
//  PetstoreApiProviderTests.swift
//  PetstoreTests
//
//  Created by Yamamoto on 2020/02/16.
//

import XCTest
@testable import Petstore

class PetstoreApiProviderTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAddPet() {
        let functionAnswered = expectation(description: "addPet")
        
        let pet = Pet(id: 100,
                      category: Category(id: 0, name: "string"),
                      name: "foobar",
                      photoUrls: [],
                      tags: [],
                      status: .available)
        let targetType = AddPet(pet)
        PetstoreApiProvider.shared.request(targetType){
            switch $0 {
            case .success(let response):
                XCTAssertEqual(pet, response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            functionAnswered.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
