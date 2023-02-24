//
//  User.swift
//  IOSTraining
//
//  Created by VIETLAMTR on 20/02/2566 BE.
//

import Foundation
import UIKit
struct User: Identifiable, Codable {
    let id: String = UUID().uuidString
//    var id: String
    var login: String
    var html_url: String
    var avatar_url: String
}

extension Array where Element == User{
    func indexOfUser(withId id: User.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

