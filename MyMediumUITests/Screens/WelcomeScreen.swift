//
//  WelcomeScreen.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 23/07/24.
//

import Foundation
import XCTest

struct WelcomeScreen {
    
    let loginButton: XCUIElement
    let signUpButton: XCUIElement
    let skipButton: XCUIElement
    let titleConduit: XCUIElement
    let descConduit: XCUIElement
    let logoConduitImage: XCUIElement
    
    init(_ app: XCUIApplication) {
        loginButton = app
            .buttons["Login"]
        
        signUpButton = app
            .buttons["Sign Up"]
        
        skipButton = app
            .navigationBars
            .buttons["Skip"]
        
        titleConduit = app
            .staticTexts["Conduit"]
        
        descConduit = app
            .staticTexts["Conduit \nMother of all demo App"]
        
        logoConduitImage = app
            .images
            .matching(identifier: "ConduitLogo")
            .firstMatch
    }

}
