//
//  File.swift
//  
//
//  Created by Gabriel Aderaldo on 04/04/23.
//

import MongoDBVapor
import Vapor
import Foundation

enum TYPE_BOOK: String , Codable{
    case design_patterns
    case divercities
    case mathematics
    case physical
    case ed
    case electronics
}

struct Book: Content {
    let _id:BSONObjectID?
    let name:String
    let author:String
    let type:TYPE_BOOK
    let isAvailable:Bool
    let lastPersonToPickUp:String?
    var createdAt: Date?
}
