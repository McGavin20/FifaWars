//
//  Fifa_WarsApp.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 17/01/2023.
//

import SwiftUI
import Firebase
@main
struct Fifa_WarsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        
        WindowGroup {
            let viewModel = AppViewModel()
            
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
