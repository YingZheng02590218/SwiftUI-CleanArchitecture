//
//  AuthUserModel.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/11.
//

import Foundation

struct AuthUserModel {
    var uid: String
    var displayName: String
    var email: String
    
    init(uid: String, displayName: String, email: String) {
        self.uid  = uid
        self.displayName = displayName
        self.email = email
    }
}
