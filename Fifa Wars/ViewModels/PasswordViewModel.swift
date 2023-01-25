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
    @Binding var emails: [String]
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
    
    func authenticateEmail(email: String) {
        //@StateObject var register = RegisterViewModel()
        @Binding var emails: [String]

        if self.email {
            showAlert.toggle()
            alertMessage = "Username exists"
        } else {
            print("Email is not in database.")
        }
    }
    
    
}
    
