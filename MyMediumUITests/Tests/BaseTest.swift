//
//  BaseTest.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 23/07/24.
//

import Foundation
import XCTest

open class BaseTest: XCTestCase {

    public enum Constants {

        public static let defaultWaitTime = 10.0
        public static let defaultLoadingTime = 30.0
    }

    open override func setUp() {
        XCTContext.runActivity(named: "Launching the app") { _ in
            app.launch()
            app.launchArguments = ["enable-testing"]
            continueAfterFailure = false
        }
    }

    open override func tearDown() {
        XCTContext.runActivity(named: "Terminating the app") { _ in
            app.terminate()
        }
    }
}
