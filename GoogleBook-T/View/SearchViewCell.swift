//
//  SearchViewCell.swift
//  GoogleBook-T
//
//  Created by Consultant on 7/22/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import UIKit

class SearchViewCell: UITableViewCell {

    @IBOutlet weak var tittleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    
    @IBOutlet weak var bookImage: UIImageView!
    
    static let identifier = "SearchViewCell"
    
    func configureBook (with book: Book) {
        
//        tittleLabel.text = book.volumeInfo.title
//        let author = book.volumeInfo.authors.joined(separator: "'")
//        authorLabel.text = author
//        yearLabel.text = book.volumeInfo.publishedDate
 }
    
}
