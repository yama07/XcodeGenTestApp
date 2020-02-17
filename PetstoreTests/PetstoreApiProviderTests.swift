//
//  PetstoreApiProviderTests.swift
//  PetstoreTests
//
//  Created by Yamamoto on 2020/02/16.
//

@testable import Petstore
import XCTest

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
        PetstoreApiProvider.shared.request(targetType) {
            switch $0 {
            case let .success(response):
                XCTAssertEqual(pet, response)
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
            functionAnswered.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
