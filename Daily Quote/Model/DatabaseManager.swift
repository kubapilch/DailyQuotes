//
//  DatabaseManager.swift
//  Daily Quote
//
//  Created by Kuba Pilch on 02.11.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import UIKit
import CoreData

class DatabaseManager: NSObject {
    
    var manageObjectContext:NSManagedObjectContext!
    
    override init() {
        super.init()
        manageObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func saveQuoteInDatabase(quote: Quote) {
        let savingQuote = SavedQuote(context: manageObjectContext)
        savingQuote.author = quote.author
        savingQuote.image = quote.image
        savingQuote.text = quote.text
        
        do{
            try manageObjectContext.save()
        }catch{
            print(error)
        }
    }
    
    func deleteQuote(quote:Quote) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedQuote")
        
        do {
            let results = try manageObjectContext.fetch(fetchRequest)
            
            for i in results as! [SavedQuote] {
                if quote.text == i.text && quote.author == i.author {
                    manageObjectContext.delete(i)
                    do{
                        try manageObjectContext.save()
                        print("Saved!")
                    }catch{
                        print(error)
                    }
                }
            }
        }catch{
            print(error)
        }
    }
    
    func retriveQuotesFromDatabase() ->[Quote] {
        let fetchRequest:NSFetchRequest<SavedQuote> = SavedQuote.fetchRequest()
        var quotes = [Quote]()
        
        do{
            let data = try manageObjectContext.fetch(fetchRequest)
            for i in data{
                let quote = Quote(text: i.text!, author: i.author!, imageURL: nil, image: i.image!, isSaved: nil)
                quotes.append(quote)
            }
        }catch{
            print(error)
        }
        return quotes
    }
}
