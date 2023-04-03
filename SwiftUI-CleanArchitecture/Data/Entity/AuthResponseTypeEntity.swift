//
//  AuthResponseTypeEntity.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/20.
//

import Foundation

// Data層　Repositorylmpl　DataStore　Entity
enum AuthResponseTypeEntity {
    case success
    case invalidEmail
    case weakPassword
    case emailAlreadyInUse
    case networkError
    case otherError
}
