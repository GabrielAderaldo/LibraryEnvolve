import MongoDBVapor
import Vapor


func routes(_ app: Application) throws {
    
    let bookController = BookController()
    
    app.post("setNewBook", use: bookController.createNewBook)
    
    app.get("getBookAvaible", use: bookController.getBookAvaible)
    
    app.get("getAllBooks", use: bookController.getAllBooks)
    
    app.get("getBookByName",":name", use: bookController.getBookByName)
    
}
