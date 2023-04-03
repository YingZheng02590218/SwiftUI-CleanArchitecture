//
//  SwiftUI_CleanArchitectureApp.swift
//  SwiftUI-CleanArchitecture
//
//  Created by Hisashi Ishihara on 2023/04/03.
//

import SwiftUI

@main
struct SwiftUI_CleanArchitectureApp: App {
    @UIApplicationDelegateAdaptor (AppDelegate.self) var appDelegate
    @StateObject private var rootViewModel = RootViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            switch rootViewModel.rootView {
            case .signIn:
                AuthSignInBuilder.shared.build()
            case .signUp:
                AuthSignUpBuilder.shared.build()
            case .profile:
                UserProfileBuilder.shared.build()
            }
        }
    }
}
