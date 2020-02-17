//
//  GetPetById.swift
//  XcodeGenTestAppUITests
//
//  Created by Yamamoto Naoki on 2020/02/17.
//

import XCTest

class GetPetById: XCTestCase {
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetPetById() {
        let app = XCUIApplication()
        app.launch()
        
        XCTContext.runActivity(named: "Petページを開く") { _ in
            let petTabIBartem = app.tabBars.buttons["Pet"]
            XCTAssert(petTabIBartem.exists)
            petTabIBartem.tap()
        }
        
        XCTContext.runActivity(named: "GET /pet/{petId}を選択する") { _ in
            let getPetByIdCell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["GET ​/pet​/{petId}"]/*[[".cells.staticTexts[\"GET ​\/pet​\/{petId}\"]",".staticTexts[\"GET ​\/pet​\/{petId}\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            XCTAssert(getPetByIdCell.exists)
            getPetByIdCell.tap()
        }
        
        XCTContext.runActivity(named: "Pet IDを入力する") { _ in
            let petIdTextField = app.textFields["petId_textfield"]
            XCTAssert(petIdTextField.exists)
            petIdTextField.tap()
            petIdTextField.typeText("1")
        }
        
        XCTContext.runActivity(named: "リクエストボタンをタップする") { _ in
            let requestButton = app.buttons["request_button"]
            XCTAssert(requestButton.exists)
            requestButton.tap()
        }
        
        XCTContext.runActivity(named: "レスポンスが表示される") { _ in
            let responseTextView = app.textViews["response_textview"]
            XCTAssert(responseTextView.exists)
            
            expectation(for: NSPredicate(format: "%@ != \"\""),
                        evaluatedWith: responseTextView.value as? String ?? "",
                        handler: nil)
            waitForExpectations(timeout: 5, handler: nil)
        }
    }
}
