//
//  RegisterViewModel.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 20/01/2023.
//

import Foundation
import SwiftUI

@MainActor
class RegisterViewModel: ObservableObject {
    @Published var fname: String = ""
    @Published var lname: String = ""
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showingRegisterScreen: Bool = false
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    @Published var usernames: [String] = []
    @Published var emails: [String] = []
    
    
    func autheticateUsername(username: String){
        if usernames.contains(username) {
            showAlert.toggle()
            alertMessage = "Username exists"
        } else {
            usernames.append(username)
        } 
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //    length 6 to 16.
    //    One Alphabet in Password.
    //    One Special Character in Password.
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,16}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        return result
    }
}


