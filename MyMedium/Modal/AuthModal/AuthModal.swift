//
//  AuthModal.swift
//  MyMedium
//
//  Created by neosoft on 11/01/23.
//

import Foundation
// MARK: - Welcome
struct LoginScuccess: Codable {
    let user: User
}

// MARK: - User
struct User: Codable {
    let email, token, username, bio: String
    let image: String
}


//struct LoginScuccess: Codable {
//    let token: String?
//}

struct LoginFail: Codable {
    let error: String?
}

// MARK: - CreateAccoutResponse
struct CreateAccoutResponse: Codable {
    let id: Int?
    let token: String?
}
