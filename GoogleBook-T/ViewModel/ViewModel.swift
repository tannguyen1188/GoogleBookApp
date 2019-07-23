//
//  ViewModel.swift
//  GoogleBook-T
//
//  Created by Consultant on 7/22/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func updateView()
}


class ViewModel{
    weak var delegate: ViewModelDelegate?
    
    var books = [Book](){
        didSet {
            delegate?.updateView()
        }
    }
    func takeBooks(for bookName: String) {
        
        bookService.getBook(for: bookName) { [unowned self] boks in
            
            self.books = boks
            print("Book count \(self.books.count)")
        }
    }
    
    
}
