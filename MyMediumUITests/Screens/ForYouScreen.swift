//
//  ForYouScreen.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 29/07/24.
//

import Foundation
import XCTest
import ScreenObject

class ForYouScreen: ScreenObject {
    
    private let forYouTitleGetter: (XCUIApplication) -> XCUIElement = {
        $0.navigationBars.staticTexts["For You"]
    }
    
    var forYouTitle: XCUIElement { forYouTitleGetter(app) }
    
    public init(app: XCUIApplication = XCUIApplication()) throws {
        try super.init(
            expectedElementGetters: [forYouTitleGetter],
            app: app
        )
    }
    
    public func verifyForYouTitleScreen() throws -> Self {
        forYouTitle.waitForExistence(timeout: Self.defaultWaitTimeout)
        XCTAssertTrue(forYouTitle.exists)
        return self
    }
}
