//
//  AuthRequestEntity.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/20.
//

import Foundation

// Data層　Repositorylmpl　DataStore　Entity
struct AuthRequestEntity {
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
