//
//  Report.swift
//  ReaderCodeHelper
//
//  Created by Jose Gil on 8/1/15.
//  Copyright (c) 2015 Tollaga Software. All rights reserved.
//

import UIKit

public class Report {
    
    public struct Notification {
        public static let FavoriteUpdate = "ReportNotificationFavoriteUpdate"
    }
    
    private struct Constants {
        struct DictonaryKey {
            static let Identifier = "identifier"
            static let Header = "header"
            static let Body = "body"
        }
        struct UserDefaultsKey {
            static let Favorites = "ReportConstantsUserDefaultKeyFavorites"
        }
    }
    
    // MARK: Properties
    
    public var identifier: String?
    public var header: String?
    public var body: String?
    
    private var _favorite: Bool?
    public var favorite: Bool {
        get {
            guard let identifier = identifier else { return false }
            
            if let favorite = _favorite {
                return favorite;
            }
            
            if let favorites = NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaultsKey.Favorites) as? [String] {
                return favorites.contains(identifier)
            }
            
            return false
        }
        set {
            guard let identifier = identifier else { return }
            
            _favorite = newValue ?? false

            var favorites = NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaultsKey.Favorites) as? [String] ?? []
            if let index = favorites.indexOf(identifier) {
                if !_favorite! {
                    favorites.removeAtIndex(index)
                }
            } else {
                if _favorite! {
                    favorites.append(identifier)
                }
            }
            NSUserDefaults.standardUserDefaults().setObject(favorites, forKey: Constants.UserDefaultsKey.Favorites)
            NSUserDefaults.standardUserDefaults().synchronize()
            
            notifyUpdate()
        }
    }
   
    // MARK: Lifecycle
    
    required public init?(dictionary: [String : String])
    {
        if dictionary[Constants.DictonaryKey.Identifier] == nil {
            return nil
        }

        identifier = dictionary[Constants.DictonaryKey.Identifier]
        header = dictionary[Constants.DictonaryKey.Header] ?? ""
        body = dictionary[Constants.DictonaryKey.Body] ?? ""
    }

    // MARK: Private
    
    private func notifyUpdate () {
        NSNotificationCenter.defaultCenter().postNotificationName(Notification.FavoriteUpdate, object: self)
    }
}
