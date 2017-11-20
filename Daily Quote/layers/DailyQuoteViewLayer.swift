//
//  DailyQuoteViewLayer.swift
//  Daily Quote
//
//  Created by Kuba Pilch on 16.11.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import UIKit


extension DailyQuoteViewController {
    
    func setQuoteView() {
        self.view.addSubview(quoteView)
        quoteView.leftAnchor.constraintEqualToSystemSpacingAfter(self.view.leftAnchor, multiplier: 1).isActive = true
        quoteView.topAnchor.constraintEqualToSystemSpacingBelow(self.view.topAnchor, multiplier: 1).isActive = true
        quoteView.bottomAnchor.constraintEqualToSystemSpacingBelow(self.view.bottomAnchor, multiplier: 1).isActive = true
        quoteView.rightAnchor.constraintEqualToSystemSpacingAfter(self.view.rightAnchor, multiplier: 1).isActive = true
    }
    
    func setTopBar() {
        self.title = "DailyQuote"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(DailyQuoteViewController.showSavedQuotes))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(DailyQuoteViewController.saveQuote))
    }
    
}
