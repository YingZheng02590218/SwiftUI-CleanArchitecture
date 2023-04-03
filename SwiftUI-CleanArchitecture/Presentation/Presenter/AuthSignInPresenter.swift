//
//  AuthSignInPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/23.
//

import Foundation

final class AuthSignInPresenter: AuthSignUseCaseOutput {
    let authSignInVM: AuthSignInViewModel
    
    init(authSignInVM: AuthSignInViewModel) {
        self.authSignInVM = authSignInVM
    }
    
    func successSignIn() {
        authSignInVM.isShowSuccessSignInAlert = true
    }
    
    func failInvalidEmail() {
        authSignInVM.isShowFailInvalidEmailAlert = true
    }
    
    func failWeakPassword() {
        authSignInVM.isShowFailWeakPasswordAlert = true
    }
    
    func failEmailAlreadyInUse() {
        authSignInVM.isShowFailEmailAlreadyInUseAlert = true
    }
    
    func failNetworkError() {
        authSignInVM.isShowFailNetworkErrorAlert = true
    }
    
    func failOtherError() {
        authSignInVM.isShowFailOtherErrorAlert = true
    }
}
