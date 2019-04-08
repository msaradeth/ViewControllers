//
//  File.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

struct Product: Codable {
    var id: String
    var name: String
    var description: String
    var price: Double
    var thumbnailUrl: String
    var imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case thumbnailUrl = "thumbnail_url"
        case imageUrl = "image_url"
    }
}

struct ProductService: Codable {
    var items: [Product]
    
    enum CodingKeys: String, CodingKey {
        case items = "pods"
    }
}

