//
//  AuthUserModelTranslator.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/11.
//

import Foundation

final class AuthUserModelTranslator {
    static let shared = AuthUserModelTranslator()
    
    private init() {}
    
    func translate(entity: AuthUserEntity) -> AuthUserModel {
        let model = AuthUserModel(
            uid: entity.uid,
            displayName: entity.displayName,
            email: entity.email
        )
        
        return model
    }
}
