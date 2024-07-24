//
//  RunActivityWithScreenshot.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 24/07/24.
//

import Foundation
import XCTest

extension XCTestCase {
    func runActivityWithScreenshot(named name: String, steps: () -> Void) {
        XCTContext.runActivity(named: name) { _ in
            steps()
            takeScreenshot(name: name.lowercased().replacingOccurrences(of: " ", with: "_"))
        }
        
    }
    
    private func takeScreenshot(name: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways // Change to .deleteOnSuccess if you want to keep only failing test screenshots
        add(attachment)
    }
}
