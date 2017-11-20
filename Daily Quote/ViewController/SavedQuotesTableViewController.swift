//
//  SavedQuotesTableViewController.swift
//  Daily Quote
//
//  Created by Kuba Pilch on 16.11.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import UIKit

class SavedQuotesTableViewController: UITableViewController {
    
    var quotes = [Quote]()
    let databaseManager = DatabaseManager()
    let cellId = "quoteCell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        quotes = databaseManager.retriveQuotesFromDatabase()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set height of cells
        tableView.rowHeight = 150.0
        
        tableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: cellId)
        
        //Retrive quotes from database
        quotes = databaseManager.retriveQuotesFromDatabase()
        tableView.reloadData()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<-Back", style: .done, target: self, action: #selector(SavedQuotesTableViewController.goBack))
        self.title = "Quotes"
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! QuoteTableViewCell

        // Configure the cell...
        let quote = quotes[indexPath.item]
        cell.setImageAndText(dataImage: quote.image!, text: quote.text, author: quote.author)
        return cell
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
           databaseManager.deleteQuote(quote: quotes[indexPath.item])
            quotes = databaseManager.retriveQuotesFromDatabase()
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let savedQuoteView = SavedQuoteViewController()
        savedQuoteView.quote = quotes[indexPath.item]
        navigationController?.pushViewController(savedQuoteView, animated: true)
    }
}
