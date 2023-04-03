//
//  AuthSignUpPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

// Presentation層　ViewModel　ViewController　View
final class AuthSignUpPresenter: AuthSignUpUseCaseOutput {
    let authSignUpVM: AuthSignUpViewModel
    
    init(authSignUpVM: AuthSignUpViewModel) {
        self.authSignUpVM = authSignUpVM
    }
    
    func successSignUp() {
        // ViewModel Presenterから受けとったデータやステータスによってViewの表示を切り替えます。
        authSignUpVM.isShowSuccessSignUpAlert = true
    }
    
    func failInvalidEmail() {
        authSignUpVM.isShowFailInvalidEmailAlert = true
    }
    
    func failWeakPassword() {
        authSignUpVM.isShowFailWeakPasswordAlert = true
    }
    
    func failEmailAlreadyInUse() {
        authSignUpVM.isShowFailEmailAlreadyInUseAlert = true
    }
    
    func failNetworkError() {
        authSignUpVM.isShowFailNetworkErrorAlert = true
    }
    
    func failOtherError() {
        authSignUpVM.isShowFailOtherErrorAlert = true
    }
}
