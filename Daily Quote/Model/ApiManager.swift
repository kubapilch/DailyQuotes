//
//  ApiManager.swift
//  Daily Quote
//
//  Created by Kuba Pilch on 27.10.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import Foundation

class ApiManager:NSObject {
    
    func downloadDailyQuote(completition: @escaping (Quote) -> Void) {
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
                var quote = Quote(text: finalQuoteData["quote"] as! String, author: finalQuoteData["author"] as! String, imageURL: finalQuoteData["background"] as? String, image: nil, isSaved: nil)
                do{
                    let imageData = try Data(contentsOf: URL(string: quote.imageURL!)!)
                    quote.image = imageData
                }catch{
                    print(error)
                }
                completition(quote)
            }catch{
                print(error)
                let emptyQuote = Quote(text: "Connection problems!", author: "App deweloper", imageURL: nil, image: nil, isSaved: nil)
                completition(emptyQuote)
            }
        }
        tache.resume()
    }
}
