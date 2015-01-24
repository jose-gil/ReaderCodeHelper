//
//  ReportStyleKit.swift
//  ReaderCodeHelper
//
//  Created by Jose Gil on 8/1/15.
//  Copyright (c) 2015 Tollaga Software. All rights reserved.
//

import UIKit

public class ReportStyleKit : NSObject {
    
    private struct Cache {
        static var primaryColor: UIColor = UIColor(red: 0.831, green: 0.243, blue: 0.216, alpha: 1.000)
        static var secondaryColor: UIColor = UIColor(red: 0.631, green: 0.631, blue: 0.631, alpha: 1.000)
    }
    
    public class var primaryColor: UIColor { return Cache.primaryColor }
    public class var secondaryColor: UIColor { return Cache.secondaryColor }
    
}

