//
//  SavedQuoteViewController.swift
//  Daily Quote
//
//  Created by Kuba Pilch on 24.10.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import UIKit

class SavedQuoteViewController: UIViewController {
    
    var quote = Quote(text: "", author: "", imageURL: nil, image: nil, isSaved: true)
    var quoteView = QuoteView()
    var databaseManager = DatabaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(quoteView)
        quoteView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        quoteView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        quoteView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        quoteView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        quoteView.quoteImageView.image = UIImage(data: quote.image!)
        quoteView.quoteTextLabel.text = quote.text + " - " + quote.author
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(SavedQuoteViewController.deleteQuote))
    }
    
    @objc func deleteQuote() {
        databaseManager.deleteQuote(quote: quote)
        navigationController?.popViewController(animated: true)
    }
}
