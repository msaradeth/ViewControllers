//
//  DetailViewModel.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

class DetailViewModel: NSObject {
    var item: ProductViewModel
    
    init(item: ProductViewModel) {
        self.item = item
    }
}
