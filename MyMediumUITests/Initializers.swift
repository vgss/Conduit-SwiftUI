//
//  Initializers.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 24/07/24.
//

import Foundation
import XCTest

/*
 Store all initializers containing the bundle identifiers of other apps
 */

let app = XCUIApplication()
let iosSettings = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
