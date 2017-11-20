//
//  Color.swift
//  Quote Widget
//
//  Created by Kuba Pilch on 20.11.2017.
//  Copyright © 2017 Kuba Pilch. All rights reserved.
//

import CoreGraphics
import UIKit

class Color: NSObject {
    
    var uiColor = UIColor()
    
    init(r:CGFloat,g:CGFloat,b:CGFloat) {
        uiColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

