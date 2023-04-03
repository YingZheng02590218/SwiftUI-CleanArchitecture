//
//  AuthSignOutViewModel.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/06.
//

import Foundation

final class AuthSignOutViewModel: ObservableObject {
    @Published var isShowSuccessSignOutAlert = false
    @Published var isShowFailSignOutAlert = false
}
