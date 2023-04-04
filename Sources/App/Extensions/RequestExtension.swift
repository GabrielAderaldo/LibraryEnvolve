//
//  File.swift
//  
//
//  Created by Gabriel Aderaldo on 04/04/23.
//

import Foundation
import MongoDBVapor
import Vapor


extension Request {
    
    var bookCollection: MongoCollection<Book> {
        self.application.mongoDB.client.db("home").collection("book", withType: Book.self)
        
    }
}
