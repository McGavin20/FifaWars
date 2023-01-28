//
//  ContentView.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 17/01/2023.
//

import SwiftUI

import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    var email: String = ""
    
    @Published var signedIn = false
    
    var isLoggedIn: Bool {
        return auth.currentUser != nil
    }
    func autheticateUser(username: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            // Success Login
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self]
            result, error in
            guard result != nil, error == nil else {
                return
            }
            //Success account creation
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}


struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.isLoggedIn {
                VStack {
                    Text("You are logged in")
                        .padding()
                    
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("Log Out")
                            .frame(width: 200, height: 50)
                            .background(Color.accentColor)
                            .foregroundColor(Color.green)
                    })
                }
            }
            else {
                SignInView()
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isLoggedIn
        }
    }
}

//Sign In View

struct SignInView: View {
    @StateObject private var register = RegisterViewModel()
    @StateObject private var login = SignInViewModel()
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        var email: String = ""
        var password: String = ""
        
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
                TextField("Username", text: $login.username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(login.wrongUsername))
                SecureField("Password", text: $login.password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(login.wrongPassword))
                Button("Sign In") {
                    //Authentication
                    guard !email?.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.autheticateUser(username: email, password: password)
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.accentColor)
                .cornerRadius(10)
                HStack {
                    NavigationLink(destination: EmptyView()) {
                        Text("Reset your password?")
                    }
                    .font(.footnote)
                    .padding(.leading)
                    .foregroundColor(.gray)
                    Spacer()
                    NavigationLink(destination: Register(register: register)) {
                        Text("Create Account")
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

//Create Account View
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
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    SecureField("Password:", text: $register.password)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    SecureField("Re-enter Password:", text: $register.password)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                }
                Button(action: {
                    register.autheticateUsername(username: register.username)
                }) {
                    Text("Sign Up")
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                }
                .padding()
            }
            .navigationTitle("Create Account")
        }
        .ignoresSafeArea()
    }
}

//Reset Password View
struct PasswordResetView: View {
    
    var body: some View {
        VStack {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
