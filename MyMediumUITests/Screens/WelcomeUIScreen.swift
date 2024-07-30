//
//  WelcomeScreen.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 29/07/24.
//

import Foundation
import XCTest
import ScreenObject

class WelcomeUIScreen: ScreenObject {
    private let logInButtonGetter: (XCUIApplication) -> XCUIElement = {
        $0.buttons["Login"]
    }
    
    private let signUpButtonGetter: (XCUIApplication) -> XCUIElement = {
        $0.buttons["Sign Up"]
    }
    
    private let skipButtonGetter: (XCUIApplication) -> XCUIElement = {
        $0.navigationBars["Pular"]
    }
    
    var logInButton: XCUIElement { logInButtonGetter(app) }
    var signUpButton: XCUIElement { signUpButtonGetter(app) }
    var skipButton: XCUIElement { skipButtonGetter(app) }
    
    public init(app: XCUIApplication = XCUIApplication()) throws {
        try super.init(
            expectedElementGetters: [logInButtonGetter, signUpButtonGetter, skipButtonGetter],
            app: app
        )
    }
    
    func selectLogin() throws -> LoginScreen {
        logInButton.tap()
        return try LoginScreen()
    }
}
