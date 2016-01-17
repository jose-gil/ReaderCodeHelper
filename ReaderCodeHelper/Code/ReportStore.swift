//
//  ReportStore.swift
//  ReaderCodeHelper
//
//  Created by Jose Gil on 8/1/15.
//  Copyright (c) 2015 Tollaga Software. All rights reserved.
//

import UIKit

public class ReportStore {
    
    private static let reports:[Report] = {
        if let path  = NSBundle(forClass: Report.self).pathForResource("Reports", ofType: "plist"),
            data = NSData(contentsOfFile: path),
            items = try? NSPropertyListSerialization.propertyListWithData(data, options: .Immutable, format: nil) as? [[String:String]] {
                var result:[Report] = []
                for item in items! {
                    if let report = Report(dictionary: item) {
                        result.append(report)
                    }
                }
                return result
                
        }
        return []
    }()

    
    // MARK: Public

    public class func allReports () -> [Report] {
        return reports
    }
    
    public class func favoriteReports () -> [Report] {
        return reports.filter {
            $0.favorite == true
        }
    }
    
}
