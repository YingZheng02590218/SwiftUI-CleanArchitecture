//
//  AuthUserFetchViewModel.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/10.
//

import Foundation

final class AuthUserFetchViewModel: ObservableObject {
    @Published var authUserModel = AuthUserModel(uid: "", displayName: "", email: "")
}
