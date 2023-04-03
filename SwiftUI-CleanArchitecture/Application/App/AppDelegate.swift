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
        // 現在ログインしているユーザーを取得する
        // 現在ログインしているユーザーを取得するには、Auth オブジェクトでリスナーを設定することをおすすめします。
//        handle = Auth.auth().addStateDidChangeListener { auth, user in
//          // ...
//        }
        // リスナーを使うと、現在ログインしているユーザーを取得するときに Auth オブジェクトが中間状態（初期化など）ではないことを確認できます。

        // currentUser を使用することでも、現在ログインしているユーザーを取得できます。ユーザーがログインしていない場合、currentUser は nil です。
        let user = Auth.auth().currentUser
        
        if user == nil {
            // サインアップ
            RootViewModel.shared.changeRootView(rootView: .signUp)
        } else {
            // プロフィール登録画面
            RootViewModel.shared.changeRootView(rootView: .profile)
        }
    }
}
