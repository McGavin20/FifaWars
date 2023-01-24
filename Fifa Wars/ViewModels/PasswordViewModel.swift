//
//  PasswordViewModel.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 23/01/2023.
//

import Foundation
import SwiftUI

@MainActor


class PasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var showingPasswordScreen: Bool = false
    @Published var alertMessage: String = ""
    @Published var denyMessage: String = ""
    @Published var showAlert: Bool = false
    
    init(email: String, showingPasswordScreen: Bool, alertMessage: String, denyMessage: String, showAlert: Bool) {
        self.email = email
        self.showingPasswordScreen = showingPasswordScreen
        self.alertMessage = alertMessage
        self.denyMessage = denyMessage
        self.showAlert = showAlert
    }
    
    init() {
        self.email = ""
    }
    
//    func authenticateEmail(email: String) {
//        @StateObject var register = RegisterViewModel()
//        var emails: [String] = [$register.emails]
//
////        if email.contains(emails) {
////            showAlert.toggle()
////            alertMessage = "Username exists"
////        } else {
////            print("Email is not in database.")
////        }
//    }
    
    
}
    
