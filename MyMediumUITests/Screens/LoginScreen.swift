//
//  LoginScreen.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 29/07/24.
//

import Foundation
import XCTest
import ScreenObject

class LoginScreen: ScreenObject {
    private let logInButtonGetter: (XCUIApplication) -> XCUIElement = {
        $0.buttons["Login"]
    }
    
    private let emailTextFieldGetter: (XCUIApplication) -> XCUIElement = {
        $0.textFields["Email"]
    }
    
    private let passwordTextFieldGetter: (XCUIApplication) -> XCUIElement = {
        $0.secureTextFields["Password"]
    }
    
    private let createAccountButtonGetter: (XCUIApplication) -> XCUIElement = {
        $0.buttons["create-account"]
    }
    
    private let invalidCredentialsAlertGetter: (XCUIApplication) -> XCUIElement = {
        $0.staticTexts["Email Or Password Is Invalid"]
    }
    
    var emailTextField: XCUIElement { emailTextFieldGetter(app) }
    var passwordTextField: XCUIElement { passwordTextFieldGetter(app) }
    var logInButton: XCUIElement { logInButtonGetter(app) }
    var createAccountButton: XCUIElement { createAccountButtonGetter(app) }
    var invalidCredentialsAlertMessage: XCUIElement { invalidCredentialsAlertGetter(app) }
    
    
    public init(app: XCUIApplication = XCUIApplication()) throws {
        try super.init(
            expectedElementGetters: [logInButtonGetter, emailTextFieldGetter, passwordTextFieldGetter, createAccountButtonGetter, invalidCredentialsAlertGetter],
            app: app
        )
    }
    
    public func proceedWith(email: String) throws -> Self {
        emailTextField.tap()
        emailTextField.typeText(email)
        
        dismissKeyboard()
        return self
    }
    
    private func proceedWith(password: String) throws -> Self {
        passwordTextField.tap()
        passwordTextField.typeText(password)
        
        dismissKeyboard()
        
        logInButton.tap()
        return self
    }
    
    public func proceedWithValid(password: String) throws -> ForYouScreen {
        _ = try proceedWith(password: password)
        return try ForYouScreen()
    }
    
    public func proceedWithInvalidPassword() throws -> Self {
        _ = try proceedWith(password: "invalidPW")
        return self
    }
    
    public func verifyErrorToLoginInvalidCredentials() -> Self {
        let alertPresented = invalidCredentialsAlertMessage.waitForExistence(timeout: 5)
        XCTAssertTrue(alertPresented)
        return self
    }
}
