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
        if let path  = Bundle(for: Report.self).path(forResource: "Reports", ofType: "plist"),
            let data = NSData(contentsOfFile: path),
            let items = try? PropertyListSerialization.propertyList(from: data as Data, options: [], format: nil) as? [[String:String]] {
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
