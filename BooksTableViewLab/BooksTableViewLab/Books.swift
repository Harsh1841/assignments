//
//  Books.swift
//  BooksTableViewLab
//
//  Created by Student on 26/08/25.
//

import Foundation


struct Books{
    var title : String
    var author : String
    var pages : String
}


var books: [Books] = [
    Books(title: "To Kill a Mockingbird", author: "Harper Lee", pages: "281"),
    Books(title: "1984", author: "George Orwell", pages: "328"),
    Books(title: "The Great Gatsby", author: "F. Scott Fitzgerald", pages: "180"),
    Books(title: "Pride and Prejudice", author: "Jane Austen", pages: "279"),
    Books(title: "The Hobbit", author: "J.R.R. Tolkien", pages: "310"),
    Books(title: "Moby Dick", author: "Herman Melville", pages: "635"),
    Books(title: "War and Peace", author: "Leo Tolstoy", pages: "1225"),
    Books(title: "The Catcher in the Rye", author: "J.D. Salinger", pages: "277"),
    Books(title: "The Lord of the Rings", author: "J.R.R. Tolkien", pages: "1178"),
    Books(title: "Brave New World", author: "Aldous Huxley", pages: "311")
]
