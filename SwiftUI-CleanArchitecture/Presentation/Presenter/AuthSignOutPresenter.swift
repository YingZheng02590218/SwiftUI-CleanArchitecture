//
//  AuthSignOutPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/06.
//

import Foundation

final class AuthSignOutPresenter: AuthSignOutUseCaseOutput {
    let authSignOutVM: AuthSignOutViewModel
    
    init(authSignOutVM: AuthSignOutViewModel) {
        self.authSignOutVM = authSignOutVM
    }
    // サインアウト
    func successSignOut() {
        authSignOutVM.isShowSuccessSignOutAlert = true
    }
    
    func failSignOut() {
        authSignOutVM.isShowFailSignOutAlert = true
    }
}
