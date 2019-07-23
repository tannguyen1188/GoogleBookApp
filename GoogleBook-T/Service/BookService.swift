//
//  BookService.swift
//  GoogleBook-T
//
//  Created by Consultant on 7/22/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import Foundation



typealias BookHandler = ([Book]) -> Void
let bookService = BookService.shared

final class BookService {
    
    static let shared = BookService()
    private init() {}
    
    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 50
        return URLSession(configuration: config)
    }()
    
    func getBook(for bookName: String, completion: @escaping BookHandler ) {
        
        guard let url = BookAPI(with: bookName).getBookURL() else {
            completion([])
            return
            
        }
        print(url)
        session.dataTask(with: url) { (dat, _, err) in
            
            if let error = err {
                completion([])
                print("API Request Error: \(error.localizedDescription)")
                return
            }
            
            if let data = dat {
                do {
                    let bookJSON = try JSONDecoder().decode(BooksItems.self, from: data)
                    
                  let book = bookJSON.items
                    completion(book)
                    
                } catch {
                    print("Couldn't Serialiaze Object: \(error.localizedDescription)")
                    completion([])
                    return
                }
                
            }
            
            }.resume()
        
    }
    
    
    
}
