//
//  ContentView.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 17/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var signIn = SignInViewModel()
    @StateObject private var register = RegisterViewModel()
    @StateObject private var reset = PasswordViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.green
                    .ignoresSafeArea()
            Circle()
                    .scale(1.7)
                    .foregroundColor(.black.opacity(0.15))
            Circle()
                    .scale(1.35)
                    .foregroundColor(.black)
                VStack {
                     Text("Sign In")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $signIn.username)
                        .autocapitalization(.none)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(signIn.wrongUsername))
                    SecureField("Password", text: $signIn.password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(signIn.wrongPassword))
                    Button("Sign In") {
                        //Authentication
                        signIn.autheticateUser(username: signIn.username, password: signIn.password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    HStack {
                        NavigationLink(destination: PasswordResetView(reset: reset), isActive: $reset.showingPasswordScreen){
                            Text("Forgot Password?")
                        }
                        .font(.footnote)
                        .padding(.leading)
                        .foregroundColor(.gray)
                        Spacer()
                        NavigationLink(destination: Register(register: register)) {
                            Text("Register")
                        }
                        
                    }
                    .font(.footnote)
                    .padding(.trailing)
                    .foregroundColor(.green)
                }
            }
            .navigationBarHidden(true)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
