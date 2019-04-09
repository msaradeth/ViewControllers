//
//  DetailViewModel.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

class DetailViewModel: NSObject {
    var item: ProductViewModel
    
    init(item: ProductViewModel) {
        self.item = item
    }
    
    func getImage(completion: @escaping (UIImage?) -> Void) {
        if let image = Cache.shared.image[item.imageUrl] {
            completion(image)
        }else {
            Util.loadImage(urlString: item.imageUrl, completion: { [weak self] (image) in
                completion(image)
                guard let self = self else { return }
                Cache.shared.image[self.item.imageUrl] = image
            })
        }
    }
}
