//
//  Globals.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 29/07/24.
//

import Foundation
import XCTest
import ScreenObject

public var navBackButton: XCUIElement { XCUIApplication().navigationBars.element(boundBy: 0).buttons.element(boundBy: 0) }

// This list has all the navBarButton labels currently covered by UI tests and must be updated when adding new ones.
public let navBackButtonLabels = ["Post Settings", "Back", "Get Started"]

public func navigateBack() {
    let app = XCUIApplication()
    let isBackButonAvailableInNavigationBar = navBackButtonLabels.contains(navBackButton.label)

    if isBackButonAvailableInNavigationBar {
        navBackButton.tap()
    } else {
        let leftEdge = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0.5))
        let center = app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))

        leftEdge.press(forDuration: 0.01, thenDragTo: center)
    }
}

// Ok button
public var okButton: XCUIElement { XCUIApplication().buttons["OK"] }

// Done button
public var returnButton: XCUIElement { XCUIApplication().keyboards.buttons["Return"] }

public func dismissKeyboard() {
    XCTAssert(returnButton.exists)
    returnButton.tap()
}



