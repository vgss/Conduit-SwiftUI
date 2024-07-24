//
//  Login.swift
//  MyMediumUITests
//
//  Created by Victor Santos on 24/07/24.
//

import Foundation
import XCTest

class Login: XCTestCase {
    let welcomeScreen = WelcomeScreen(app)
    let loginScreen = LoginScreen(app)
    
    func accessLoginFromWelcomeScreen() -> Login {
        runActivityWithScreenshot(named: "Tap login button on Welcome screen then user is redirected to Login Screen") {
            welcomeScreen.loginButton.tap()
            XCTAssertTrue(loginScreen.loginNavigationTitle.waitForExistence(timeout: 2))
        }
        return self
    }
    
    func inputLoginCredentials(email: String, password: String) {
        runActivityWithScreenshot(named: "Inserting the expected email on the Email Text Field") {
            let emailField = loginScreen.emailTextField
            
            emailField.tap()
            emailField.typeText(email)
            XCTAssertEqual(emailField.value as? String, email, "The textfield does not contain the expected email")
            app.keyboards.buttons["Return"].tap()
        }
        
        
        runActivityWithScreenshot(named: "Inserting the expected password on the Password Text Field") {
            let pwField = loginScreen.passwordTextField
            
            pwField.tap()
            pwField.typeText(password)
            
            let value = pwField.value as? String ?? ""
            XCTAssertEqual(value.count, password.count, "The textfield does not contain the expected password")
            app.keyboards.buttons["Return"].tap()
        }
    }
    
    func tapLoginButton() {
        runActivityWithScreenshot(named: "Verifying Login button is hittable then tap") {
            let loginButton = loginScreen.loginButton
            
            XCTAssertTrue(loginButton.isHittable)
            loginButton.tap()
        }
    }
    
    func performLogin(email: String, password: String) {
        inputLoginCredentials(email: email, password: password)
        tapLoginButton()
    }
    
    func performLoginRegisteredAccount(is status: Bool) -> Login {
        if !status {
            runActivityWithScreenshot(named: "Perfoming login with a not registered account") {
                performLogin(email: "WrongEmail123321@wrong.com", password: "12345678")
                
                XCTAssertTrue(app.alerts["Error"].waitForExistence(timeout: 5))
            }
        } else {
            runActivityWithScreenshot(named: "Perfoming login with a registered account") {
                performLogin(email: "WrongEmail123321@wrong.com", password: "12345678")
            }
        }
        
        return self
    }
    
    
    
}
