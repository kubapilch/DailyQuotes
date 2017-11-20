//
//  QuoteModel.swift
//  Daily Quote
//
//  Created by Kuba Pilch on 24.10.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import Foundation

struct Quote {
    var text: String
    var author: String
    var imageURL: String?
    var image: Data?
    var isSaved: Bool?
}
