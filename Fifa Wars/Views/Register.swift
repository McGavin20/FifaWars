//
//  Register.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 20/01/2023.
//

import SwiftUI

struct Register: View {
    @ObservedObject var register: RegisterViewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Text("Register Your Account:")
                    .font(.title)
                    .foregroundColor(.accentColor)
                    .bold()
                Form {
                    TextField("First Name:", text: $register.fname)
                    TextField("Last Name:", text: $register.lname)
                    TextField("Prefered Username:", text: $register.username)
                   
                    TextField("Email:", text: $register.email)
                    
                    SecureField("Password:", text: $register.password)
                    
                    SecureField("Re-enter Password:", text: $register.password)

                }
                Button(action: {
                    register.autheticateUsername(username: register.username)
                }) {
                    Text("Sign Up")
                        .frame(width: 200)
                        .background(Color.green)
                        .cornerRadius(8)
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .padding()
                .alert($register.alertMessage.wrappedValue, isPresented: $register.showAlert){
                    Button("OK", role: .cancel) { }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
