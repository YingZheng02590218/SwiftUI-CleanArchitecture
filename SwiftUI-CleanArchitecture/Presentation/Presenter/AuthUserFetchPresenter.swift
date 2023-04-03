//
//  AuthUserFetchPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/08.
//

import Foundation

final class AuthUserFetchPresenter: AuthUserFetchUseCaseOutput {
    let authUserFetchVM: AuthUserFetchViewModel
    
    init(authUserFetchVM: AuthUserFetchViewModel) {
        self.authUserFetchVM = authUserFetchVM
    }
    
    func successFetchedUser(model: AuthUserModel) {
        authUserFetchVM.authUserModel = model
    }
    
    func failFetchedUser() {
        
    }
}
