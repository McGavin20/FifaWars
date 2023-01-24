//
//  PasswordResetView.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 23/01/2023.
//

import SwiftUI

struct PasswordResetView: View {
    
    @ObservedObject var reset: PasswordViewModel = PasswordViewModel()
    @ObservedObject var register: RegisterViewModel = RegisterViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Enter Email:", text: $reset.email).autocapitalization(.none).keyboardType(.emailAddress)
                .border(.black)
                .padding()
                .frame(width: 400, height: 30)
        }
        Button(action: {
//                $reset.autheticateEmail(email: register.email)
        }) {
            Text("Reset Password")
                .frame(width: 200, height: 40)
                .background(Color.green)
                .cornerRadius(8)
                .foregroundColor(.black)
        }
        .navigationTitle("Forgot password?")
        .padding()
        .alert($reset.alertMessage.wrappedValue, isPresented: $reset.showAlert){
            Button("OK", role: .cancel) { }
        }
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}
