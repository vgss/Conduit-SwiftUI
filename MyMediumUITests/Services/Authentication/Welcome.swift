//
//  Welcome.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 24/07/24.
//

import Foundation
import XCTest

class Welcome: XCTestCase {
    let welcomeScreen = WelcomeScreen(app)
    
    func verifyAllElementsWelcomeScreen() {
        runActivityWithScreenshot(named: "Verify all welcome screen elements") {
            XCTAssertTrue(welcomeScreen.logoConduitImage.exists)
            XCTAssertTrue(welcomeScreen.titleConduit.exists)
            XCTAssertTrue(welcomeScreen.descConduit.exists)
            XCTAssertTrue(welcomeScreen.loginButton.exists)
            XCTAssertTrue(welcomeScreen.signUpButton.exists)
            XCTAssertTrue(welcomeScreen.skipButton.exists)
        }
    }
}
