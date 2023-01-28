//
//  SignIn-ViewModel.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 18/01/2023.
//

import Foundation
import SwiftUI

extension ContentView {
    @MainActor
    class SignInViewModel: ObservableObject {
        @Published var username: String = ""
        @Published var password: String = ""
//        @Published var wrongUsername = 0
//        @Published var wrongPassword = 0
//        @Published var showingLoginScreen: Bool = false
//        
//        func autheticateUsername(username: String, password: String) {
//            if username.lowercased() == "sharma" {
//                wrongUsername = 0
//                if password.lowercased() == "legend" {
//                    wrongPassword = 0
//                    showingLoginScreen = true
//                } else {
//                    wrongPassword = 2
//                }
//            } else {
//                wrongUsername = 2
//                }
//            }
    }
}
