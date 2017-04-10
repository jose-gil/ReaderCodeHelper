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
            
            if let favorites = UserDefaults.standard.object(forKey: Constants.UserDefaultsKey.Favorites) as? [String] {
                return favorites.contains(identifier)
            }
            
            return false
        }
        set {
            guard let identifier = identifier else { return }
            
            _favorite = newValue 

            var favorites = UserDefaults.standard.object(forKey: Constants.UserDefaultsKey.Favorites) as? [String] ?? []
            if let index = favorites.index(of: identifier) {
                if !_favorite! {
                    favorites.remove(at: index)
                }
            } else {
                if _favorite! {
                    favorites.append(identifier)
                }
            }
            UserDefaults.standard.set(favorites, forKey: Constants.UserDefaultsKey.Favorites)
            UserDefaults.standard.synchronize()
            
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
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Notification.FavoriteUpdate), object: self)
    }
}
