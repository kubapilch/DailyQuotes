//
//  QuoteTableViewCell.swift
//  Daily Quote
//
//  Created by Kuba Pilch on 23.10.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    let quoteImageView:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let quoteTextLabel:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let transparentView:UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setImageAndText(dataImage:Data, text:String, author:String) {
        let image = UIImage(data: dataImage)
        let quoteText = text + " - " + author
        
        quoteImageView.image = image
        quoteTextLabel.text = quoteText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Disable highliting cell while selected
        self.selectionStyle = .none
        
        //Setup quote UIImageView
        self.addSubview(quoteImageView)
        quoteImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        quoteImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        quoteImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        quoteImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        //Setup transparent view
        self.addSubview(transparentView)
        transparentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        transparentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        transparentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        transparentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
        //Setup quote UILabel
        self.addSubview(quoteTextLabel)
        quoteTextLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        quoteTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        quoteTextLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        quoteTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
}
