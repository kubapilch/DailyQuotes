//
//  QuoteView.swift
//  Daily Quote
//
//  Created by Kuba Pilch on 27.10.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import UIKit

class QuoteView: UIView {

    let quoteTextLabel:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let quoteImageView:UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let transparentView:UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //Add constraints for image view
        self.addSubview(quoteImageView)
        quoteImageView.topAnchor.constraintEqualToSystemSpacingBelow(self.topAnchor, multiplier: 1).isActive = true
        quoteImageView.bottomAnchor.constraintEqualToSystemSpacingBelow(self.bottomAnchor, multiplier: 1).isActive = true
        quoteImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        quoteImageView.rightAnchor.constraintEqualToSystemSpacingAfter(self.rightAnchor, multiplier: 1).isActive = true
        
        //Add constraints for transparent view
        self.addSubview(transparentView)
        transparentView.topAnchor.constraintEqualToSystemSpacingBelow(self.topAnchor, multiplier: 1).isActive = true
        transparentView.rightAnchor.constraintEqualToSystemSpacingAfter(self.rightAnchor, multiplier: 1).isActive = true
        transparentView.bottomAnchor.constraintEqualToSystemSpacingBelow(self.bottomAnchor, multiplier: 1).isActive = true
        transparentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -8).isActive = true
        
        //Add constraints for label
        self.addSubview(quoteTextLabel)
        quoteTextLabel.topAnchor.constraintEqualToSystemSpacingBelow(self.topAnchor, multiplier: 1).isActive = true
        quoteTextLabel.bottomAnchor.constraintEqualToSystemSpacingBelow(self.bottomAnchor, multiplier: 1).isActive = true
        quoteTextLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        quoteTextLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    }
}
