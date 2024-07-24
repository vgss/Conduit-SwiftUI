//
//  WelcomeScreenTests.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 23/07/24.
//

import Foundation
import XCTest

open class AuthenticationTests: BaseTest {
    
    func test1_verifyAllElementsArePresented() {
        Welcome()
            .verifyAllElementsWelcomeScreen()
    }
    
    func test2_verifyUserIsRedirectedToLoginScreen() {
        _ = Login()
            .accessLoginFromWelcomeScreen()
    }
    
    func test3_failedToLoginWithWrongCredentials() {
        _ = Login()
            .accessLoginFromWelcomeScreen()
            .performLoginRegisteredAccount(is: false)
    }
}
