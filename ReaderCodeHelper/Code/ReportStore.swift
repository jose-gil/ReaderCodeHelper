//
//  ReportStore.swift
//  ReaderCodeHelper
//
//  Created by Jose Gil on 8/1/15.
//  Copyright (c) 2015 Tollaga Software. All rights reserved.
//

import UIKit

public class ReportStore {
    
    // MARK: - Properties

    private class var reports: [Report] {
        if let path = NSBundle(forClass: ReportStore.self).pathForResource("Reports", ofType: "plist") {
            if let items = NSPropertyListSerialization.propertyListFromData(NSData(contentsOfFile: path)!, mutabilityOption: NSPropertyListMutabilityOptions.Immutable, format: nil, errorDescription: nil) as? [[String : String]] {
                return items.map { Report(dictionary: $0) }
            }
        }
        return []
    }
    
    // MARK: - Public

    public class func allReports () -> [Report] {
        return reports
    }
    
    public class func favoriteReports () -> [Report] {
        return reports.filter { $0.favorite == true }
    }
}
