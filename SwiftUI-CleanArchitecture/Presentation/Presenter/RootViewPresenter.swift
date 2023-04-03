//
//  RootViewPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/29.
//

import Foundation

final class RootViewPresenter: RootViewUseCaseOutput {
    
    func changeProfileView() {
        RootViewModel.shared.changeRootView(rootView: .profile)
    }
    
    func changeSignInView() {
        RootViewModel.shared.changeRootView(rootView: .signIn)
    }
    
    func alreadySignedUpUser() {
        RootViewModel.shared.changeRootView(rootView: .signIn)
    }
    
    func notSignedUpUser() {
        RootViewModel.shared.changeRootView(rootView: .signUp)
    }
}
