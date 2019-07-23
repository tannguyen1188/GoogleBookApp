//
//  BookAPI.swift
//  GoogleBook-T
//
//  Created by Consultant on 7/22/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import Foundation



struct BookAPI {
    
    var titleBook: String!
    init(with title: String){
        self.titleBook = title
    }
    let baseLink = "https://www.googleapis.com/books/v1/volumes?q="
    func getBookURL() -> URL? {
    let urlString = baseLink + titleBook
        return URL(string: urlString)
    }
 
}
