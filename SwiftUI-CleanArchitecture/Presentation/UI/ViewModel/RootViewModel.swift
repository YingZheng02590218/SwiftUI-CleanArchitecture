//
//  RootViewModel.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/29.
//

import Foundation

final class RootViewModel: ObservableObject {
    @Published private(set) var rootView: RootViews = .signUp
    static let shared = RootViewModel()
    
    enum RootViews {
        case signIn
        case signUp
        case profile
    }
    
    func changeRootView(rootView: RootViews) {
        self.rootView = rootView
    }
}
