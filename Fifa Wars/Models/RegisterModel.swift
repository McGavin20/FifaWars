//
//  RegisterModel.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 20/01/2023.
//

import Foundation

struct Account: Identifiable, Hashable {
    var username: String
    var email: String
    var password: String
    var fname: String
    var lname:String
    var id: String {
        username
    }
    
    
    var sample:  [Account]  {
        [
            Account(username: "sharma", email: "romecaselo@gmail.com", password: "legend", fname: "Sharma", lname: "Mcgavin")
            
        ]
    }
}
