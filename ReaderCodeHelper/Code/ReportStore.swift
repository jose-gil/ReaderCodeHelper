//
//  ReportStore.swift
//  ReaderCodeHelper
//
//  Created by Jose Gil on 8/1/15.
//  Copyright (c) 2015 Tollaga Software. All rights reserved.
//

import UIKit

public class ReportStore {
    
    // MARK: Properties

    private class var sharedInstance: ReportStore {
        struct Singleton {
            static let instance: ReportStore = ReportStore()
        }
        return Singleton.instance
    }

    private var _reports:[Report] = []

    // MARK: Lifecycle

    init() {
        populateReports()
    }
    
    // MARK: Private

    private func populateReports () {
        if let path = NSBundle(forClass: Report.self).pathForResource("Reports", ofType: "plist") {
            if let items = NSPropertyListSerialization.propertyListFromData(NSData(contentsOfFile: path)!, mutabilityOption: NSPropertyListMutabilityOptions.Immutable, format: nil, errorDescription: nil) as? [[String : String]] {
                for item in items {
                    if let report = Report(dictionary: item) {
                        self._reports.append(report)
                    }
                }
            }
        }
    }
    
    // MARK: Public

    public class func allReports () -> [Report] {
        return sharedInstance._reports
    }
    
    public class func favoriteReports () -> [Report] {
        return sharedInstance._reports.filter {
            $0.favorite == true
        }
    }
    
}