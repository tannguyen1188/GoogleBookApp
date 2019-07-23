//
//  Book.swift
//  GoogleBook-T
//
//  Created by Consultant on 7/22/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import Foundation


struct BooksItems: Decodable {
    let items: [Book]
}

class Book: Decodable {
    
    let id: String
    let volumeInfo: VolumeInfo
}
struct VolumeInfo: Decodable {
    let title: String
    let authors: [String]
    let publisher: String?
    let publishedDate: String?
    let description: String?
}

