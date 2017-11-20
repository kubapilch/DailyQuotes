//
//  DailyQuoteViewController.swift
//  Daily Quote
//
//  Created by Kuba Pilch on 27.10.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import UIKit

class DailyQuoteViewController: UIViewController {

    let quoteView = QuoteView() 
    let apiManager = ApiManager()
    let databaseManager = DatabaseManager()
    var quote:Quote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuoteView()
        setTopBar()
        
        apiManager.downloadDailyQuote { (downloadedQuote) in
            self.quote = downloadedQuote
            DispatchQueue.main.async {
                self.quoteView.quoteTextLabel.text = downloadedQuote.text + " \n ~ " + downloadedQuote.author
                self.quoteView.quoteImageView.image = UIImage(data: downloadedQuote.image!)
            }
        }
    }
    
    @objc func showSavedQuotes() {
        let savedQuotesTableView = SavedQuotesTableViewController()
        navigationController?.pushViewController(savedQuotesTableView, animated: true)
    }
    
   @objc func saveQuote() {
        if quote != nil && quote?.isSaved == nil || !(quote?.isSaved)! {
            databaseManager.saveQuoteInDatabase(quote: quote!)
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(DailyQuoteViewController.saveQuote))
            quote?.isSaved = true
            return
        }
    
        if quote != nil {
            databaseManager.deleteQuote(quote: quote!)
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(DailyQuoteViewController.saveQuote))
            quote?.isSaved = false
        }
    }
}
