//
//  AuthResponseType.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

enum AuthResponseType {
    case success
    case invalidEmail
    case weakPassword
    case emailAlreadyInUse
    case networkError
    case otherError
}
