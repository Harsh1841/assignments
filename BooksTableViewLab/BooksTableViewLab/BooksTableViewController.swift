//
//  BooksTableViewController.swift
//  BooksTableViewLab
//
//  Created by Student on 25/08/25.
//

import UIKit

class BooksTableViewController: UITableViewController {

    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    
    var booksData : Books?
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    
    
    
    
    init?(coder: NSCoder, books: Books?) {
        self.booksData = books
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


  


}
