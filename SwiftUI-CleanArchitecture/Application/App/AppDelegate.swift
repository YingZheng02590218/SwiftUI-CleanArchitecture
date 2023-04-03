//
//  AppDelegate.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/08.
//

import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        firebaseConfigure()
        setRootView()
        return true
    }
     
    private func firebaseConfigure() {
        #if DEBUG
        let filePath = Bundle.main.path(forResource: "GoogleService-Info-Debug", ofType: "plist")
        #else
        let filePath = Bundle.main.path(forResource: "GoogleService-Info-Release", ofType: "plist")
        #endif
        
        guard let filePath = filePath else {
            return
        }
        guard let options = FirebaseOptions(contentsOfFile: filePath) else {
            return
        }
        
        print("filePath:", filePath)
        print("options:", options)

        FirebaseApp.configure(options: options)
    }
    
    func setRootView() {
        let user = Auth.auth().currentUser
        
        if user == nil {
            RootViewModel.shared.changeRootView(rootView: .signUp)
        } else {
            RootViewModel.shared.changeRootView(rootView: .profile)
        }
    }
}
