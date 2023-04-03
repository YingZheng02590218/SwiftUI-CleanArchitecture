//
//  AuthSignUpViewModel.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

// Presentation層　ViewModel　ViewController　View
final class AuthSignUpViewModel: ObservableObject {
    @Published var isShowSuccessSignUpAlert = false
    @Published var isShowFailInvalidEmailAlert = false
    @Published var isShowFailWeakPasswordAlert = false
    @Published var isShowFailEmailAlreadyInUseAlert = false
    @Published var isShowFailNetworkErrorAlert = false
    @Published var isShowFailOtherErrorAlert = false
}
