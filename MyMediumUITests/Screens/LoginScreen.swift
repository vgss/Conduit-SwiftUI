//
//  LoginScreen.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 24/07/24.
//

import Foundation
import XCTest

struct LoginScreen {
    
    let loginNavigationTitle: XCUIElement
    let titleConduit: XCUIElement
    let descConduit: XCUIElement
    let backButton: XCUIElement
    
    //email field
    let emailText: XCUIElement
    let emailTextField: XCUIElement
    let emailIconTextField: XCUIElement
    
    //password field
    let passwordText: XCUIElement
    let passwordTextField: XCUIElement
    let passwordIconTextField: XCUIElement
    
    let loginButton: XCUIElement
    let createAccountTextButton: XCUIElement

    
    init(_ app: XCUIApplication) {
        loginNavigationTitle = app
            .navigationBars
            .staticTexts["Login"]

        titleConduit = app
            .staticTexts["Conduit"]

        descConduit = app
            .staticTexts["Login using Email And Password"]

        backButton = app
            .navigationBars
            .buttons["Back Button"]

        // Email field
        emailText = app
            .staticTexts["Email"]

        emailTextField = app
            .textFields["Email"]

        emailIconTextField = app
            .images["Get Mail"]

        // Password field
        passwordText = app
            .staticTexts["Password"]

        passwordTextField = app
            .secureTextFields["Password"]

        passwordIconTextField = app
            .images["Lock"]

        loginButton = app
            .buttons["Login"]

        createAccountTextButton = app
            .buttons["Don't have an account?\n Create here"]
    }

}
