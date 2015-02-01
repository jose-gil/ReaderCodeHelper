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
    
    // MARK: - Properties
    
    public var identifier: String = ""
    public var header: String = ""
    public var body: String = ""
    
    private var _favorite: Bool?
    public var favorite: Bool {
        get {
            if let favorite = _favorite {
                return favorite;
            }
            
            _favorite = loadFavoriteFromUserDefaults(identifier)
            return _favorite!;
        }
        set {
            _favorite = newValue ?? false
            saveFavoriteToUserDefaults(identifier, value:newValue)
            notifyUpdate()
        }
    }
    
    // MARK: - Private
    
    private func loadFavoriteFromUserDefaults(identifier:String) -> Bool {
        if let favorites = NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaultsKey.Favorites) as? [String] {
            return contains(favorites, identifier)
        }
        return false
    }
    
    private func saveFavoriteToUserDefaults(identifier:String, value:Bool) {
        var favorites = NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaultsKey.Favorites) as? [String] ?? []
        if let index = find(favorites, identifier) {
            if !value {
                favorites.removeAtIndex(index)
            }
        } else {
            if value {
                favorites.append(identifier)
            }
        }
        NSUserDefaults.standardUserDefaults().setObject(favorites, forKey: Constants.UserDefaultsKey.Favorites)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    private func notifyUpdate () {
        NSNotificationCenter.defaultCenter().postNotificationName(Notification.FavoriteUpdate, object: self)
    }
    
    // MARK: - Lifecycle
    
    init(dictionary: [String : String])
    {
        identifier = dictionary[Constants.DictonaryKey.Identifier] ?? ""
        header = dictionary[Constants.DictonaryKey.Header] ?? ""
        body = dictionary[Constants.DictonaryKey.Body] ?? ""
    }
    
    
}