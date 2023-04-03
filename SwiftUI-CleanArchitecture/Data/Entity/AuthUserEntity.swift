//
//  AuthUserEntity.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/08.
//

import Foundation

struct AuthUserEntity {
    var uid: String
    var displayName: String
    var email: String
    
    init(uid: String, displayName: String, email: String) {
        self.uid  = uid
        self.displayName = displayName
        self.email = email
    }
}
