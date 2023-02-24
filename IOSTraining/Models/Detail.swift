//
//  Detail.swift
//  IOSTraining
//
//  Created by VIETLAMTR on 24/02/2566 BE.
//

import Foundation

import Foundation
import UIKit
struct Detail: Identifiable, Codable {
    let id: String = UUID().uuidString
//    var id: String
    var name: String
    var avatar_url: String
    var email: String
}
