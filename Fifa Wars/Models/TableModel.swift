//
//  TableModel.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 18/01/2023.
//

import Foundation

struct Player: Identifiable, Hashable {
    var username: String
    var goals: Int
    var points: Int
    var id: String {
        username
    }
    
    static var sample:  [Player]  {
        [
            Player(username: "Sharma", goals: 45, points: 135),
            Player(username: "Nash", goals: 20, points: 34),
            Player(username: "Jayblac", goals: 120, points: 360)
        ]
    }
    
    static var users: [Int] {
        return Array(Set(sample.map{$0.points})).sorted(by: <)
    }
}


