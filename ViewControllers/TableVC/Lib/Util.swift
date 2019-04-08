//
//  Lib.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit



class Util: NSObject {
    
    
    static func priceString(price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale = Locale.current
        
        let number = NSNumber(value: price/100.0)
        let priceString = formatter.string(from: number)!
        
        return priceString
    }
    
    static func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            guard let imageURL = URL(string: urlString),
                let data = try? Data(contentsOf: imageURL),
                let image = UIImage(data: data) else { completion(nil); return }
            completion(image)
        }
    }
    
}

