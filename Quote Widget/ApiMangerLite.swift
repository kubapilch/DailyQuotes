//
//  ApiMangerLite.swift
//  Quote Widget
//
//  Created by Kuba Pilch on 20.11.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import UIKit

class ApiMangerLite: NSObject {
    
    func downloadDailyQuote(completition: @escaping (QuoteLite) -> Void) {
        let string = "https://quotes.rest/qod"
        let url = URL(string: string)
        let request = NSMutableURLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        let session = URLSession.shared
        let tache = session.dataTask(with: request as URLRequest) { (data, response, error) in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                let content = json ["contents"] as! [String:Any]
                let arraysOfQuotesData = content["quotes"] as! [[String:Any]]
                let finalQuoteData = arraysOfQuotesData[0]
                let quote = QuoteLite(text: finalQuoteData["quote"] as! String, author: finalQuoteData["author"] as! String)
                completition(quote)
            }catch{
                print(error)
                let emptyQuote = QuoteLite(text: "Connection problems!", author: "App deweloper")
                completition(emptyQuote)
            }
        }
        tache.resume()
    }
}
