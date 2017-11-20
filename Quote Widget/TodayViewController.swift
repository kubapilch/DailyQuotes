//
//  TodayViewController.swift
//  Quote Widget
//
//  Created by Kuba Pilch on 20.11.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    let blue = Color(r: 63, g:81, b:181)
    let red = Color(r: 229, g: 57, b: 53)
    let green = Color(r: 76, g: 175, b: 80)
    let lightGreen = Color(r: 0, g: 150, b: 136)
    let orange = Color(r: 255, g: 152, b: 0)
    let grey = Color(r: 96, g: 152, b: 139)
    
    var colors = [Color]()
    
    let apiManager = ApiMangerLite()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let quoteLabel:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        colors = [blue,red,green,lightGreen,orange,grey]
        
        setupBackgroundViewAndLabel()
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        let color = colors[Int(arc4random_uniform(UInt32(colors.count)))]
        backgroundView.backgroundColor = color.uiColor
        print(color)
        
        apiManager.downloadDailyQuote { (quote) in
            DispatchQueue.main.async {
                self.quoteLabel.text = quote.text + "\n ~ " + quote.author
            }
        }
    }
    
    func setupBackgroundViewAndLabel() {
        self.view.addSubview(backgroundView)
        backgroundView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.view.addSubview(quoteLabel)
        quoteLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 3).isActive = true
        quoteLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 3).isActive = true
        quoteLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -3).isActive = true
        quoteLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -3).isActive = true
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
        preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 200) : maxSize
    }
    
}

