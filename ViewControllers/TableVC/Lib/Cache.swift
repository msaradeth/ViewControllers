//
//  Cache.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

class Cache: NSObject {
    static let shared = Cache()
    private let defaults = UserDefaults.standard
    private var favorites: [String:Bool]
    var image: [String:UIImage]
    var thumbnail: [String:UIImage]
    
    override init() {
        favorites = [:]
        image = [:]
        thumbnail = [:]
    }
    
    func isFavorite(id: String) -> Bool {
        return favorites[id] ?? false
    }
    func setFavorite(id: String, favorite: Bool) {
        favorites[id] = favorite
        defaults.set(favorite, forKey: id)
    }

}

