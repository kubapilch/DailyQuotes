//
//  DataDownloading.swift
//  Daily Quote
//
//  Created by Kuba Pilch on 24.10.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import Foundation
import FirebaseDatabase
import UIKit

extension UIImageView{
    
    func downloadImageAndSaveItInCache(urlOfImage url:String) {
        //Set image to nil
        self.image = nil
        
        let imageCache = NSCache<NSString, UIImage>()
        
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            self.image = cachedImage
            return
        }
        
        let imageUrl = URL(string: url)
        let request = URLRequest(url: imageUrl!)

        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                
                if let downloadedImage = UIImage(data: data!){
                    self.image = downloadedImage
                    imageCache.setObject(downloadedImage, forKey: url as NSString)
                }
            }
        }).resume()
    }
}
