//
//  AuthSignInViewModel.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/23.
//

import Foundation

final class AuthSignInViewModel: ObservableObject {
    @Published var isShowSuccessSignInAlert = false
    @Published var isShowFailInvalidEmailAlert = false
    @Published var isShowFailWeakPasswordAlert = false
    @Published var isShowFailEmailAlreadyInUseAlert = false
    @Published var isShowFailNetworkErrorAlert = false
    @Published var isShowFailOtherErrorAlert = false
}
