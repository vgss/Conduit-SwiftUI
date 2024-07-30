//
//  LoginTests.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 29/07/24.
//

import Foundation
import XCTest

class LoginTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        
        app.launchArguments = ["-ui-testing", "-welcome-screen-not-skipped", "-mock-article"]
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //TEST01: Verify login when user has invalid credentials
    func testInvalidLogin() throws {
        _ = try WelcomeUIScreen()
            .selectLogin()
            .proceedWith(email: UITestCredentials.invalidEmail)
            .proceedWithInvalidPassword()
            .verifyErrorToLoginInvalidCredentials()
    }
    
    //Test02: Verify login when user has valid credentials
    func testValidLogin() throws {
        _ = try WelcomeUIScreen()
            .selectLogin()
            .proceedWith(email: UITestCredentials.validEmail)
            .proceedWithValid(password: "123456")
            .verifyForYouTitleScreen()
    }
}
