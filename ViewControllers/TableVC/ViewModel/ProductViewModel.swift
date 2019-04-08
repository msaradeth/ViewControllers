//
//  ProductViewModel.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

struct ProductViewModel {
    var id: String
    var name: String
    var description: String
    var price: String
    var thumbnailUrl: String
    var imageUrl: String
    
    init(product: Product) {
        self.id = product.id
        self.name = product.name
        self.description = product.description
        self.price = Util.priceString(price: product.price)
        self.thumbnailUrl = product.thumbnailUrl
        self.imageUrl = product.imageUrl
    }    
}
