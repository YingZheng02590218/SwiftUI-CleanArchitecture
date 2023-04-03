//
//  AuthSignInBuilder.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/23.
//

import Foundation

final class AuthSignInBuilder {
    static let shared = AuthSignInBuilder()
    
    private init() {}
    
    func build() -> AuthSignInView {
        let signUpVM = AuthSignUpViewModel()
        let signInVM = AuthSignInViewModel()
        let signOutVM = AuthSignOutViewModel()
        
        let view = AuthSignInView(
            authSignInVM: signInVM,
            authController: AuthController(
                authSignUpUseCase: AuthSignUpUseCase(
                    authRepository: AuthRepository(
                        authDataStore: AuthDataStore()
                    ),
                    output: AuthSignUpPresenter(
                        authSignUpVM: signUpVM
                    )
                ),
                authSignInUseCase: AuthSignInUseCase(
                    authRepository: AuthRepository(
                        authDataStore: AuthDataStore()
                    ),
                    output: AuthSignInPresenter(
                        authSignInVM: signInVM
                    )
                ),
                authSignOutUseCase: AuthSignOutUseCase(
                    authRepository: AuthRepository(
                        authDataStore: AuthDataStore()
                    ),
                    output: AuthSignOutPresenter(
                        authSignOutVM: signOutVM
                    )
                ),
                authUserFetchUseCase: AuthUserFetchUseCase(
                    authRepository: AuthRepository(
                        authDataStore: AuthDataStore()
                    ),
                    output: AuthUserFetchPresenter(
                        authUserFetchVM: AuthUserFetchViewModel()
                    )
                )
            ),
            rootViewController: RootViewController(
                rootViewUseCase: RootViewUseCase(
                    output: RootViewPresenter()
                )
            )
        )
        return view
    }
}
