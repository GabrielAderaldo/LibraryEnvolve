//
//  File.swift
//  
//
//  Created by Gabriel Aderaldo on 04/04/23.
//

import Foundation
import Vapor

struct BookController: RouteCollection{
    
    func isAvable(book:Book)-> Book?{
       if book.isAvailable != true {
            return nil
        }
        return book
    }
    
    
    func boot(routes: Vapor.RoutesBuilder) throws {}
    
    func createNewBook(req: Request) async throws -> Response {
        
        guard var newBook = try? req.content.decode(Book.self) else{
            return Response(status:.badRequest)
        }
        
        newBook.createdAt = Date.now
        
        guard  let _ =  try await req.bookCollection.insertOne(newBook) else {
            return Response(status:.badRequest)
        }
        
        return Response(status:.created)
    }
    
    func getAllBooks(req:Request) async throws -> [Book]{
        return try await req.bookCollection.find().toArray()
    }
    
    func getBookAvaible(req:Request) async throws -> [Book]{
        return try await req.bookCollection.find().toArray().compactMap({ book in isAvable(book: book)})
    }
    
    func getBookByName(req:Request) async throws -> Book{
        
        guard let name = req.parameters.get("name") else {
            return Book(_id: .init(), name: "", author: "", type: .design_patterns, isAvailable: false, lastPersonToPickUp: "")
        }
        
        return try await req.bookCollection.find().toArray().first(where: { book in book.name == name }) ?? Book(_id: .init(), name: "", author: "", type: .design_patterns, isAvailable: false, lastPersonToPickUp: "")
    }
    
    
    
    
    //TODO: CRIAR UMA ROTA PARA ALTERAR TODAS AS INFORMAÇÕES
    
    //TODO: Criar uma rota para alugar um livro
    
    //TODO: Deletar um livro do estoque
    
    
    
    
    
    
    
}
