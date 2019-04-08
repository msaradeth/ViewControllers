//
//  ProductApiService.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import Alamofire


enum ApiEndpoint {
    static let productUrl = "https://s3.us-east-2.amazonaws.com/juul-coding-challenge/products.json"
}

class ProductApiService: NSObject {
    
    
    func loadData(completion: @escaping ([[Product]]) -> Void)  {
        let emptyArray = [Product]()
        var items: [[Product]] = [emptyArray, emptyArray]
        
        HttpHelper.request(ApiEndpoint.productUrl, method: .get, params: nil, success: { (responseObj) in
            guard let data = responseObj.data else { completion(items); return }
            do {
                let productService = try JSONDecoder().decode(ProductService.self, from: data)
                items[0] = productService.items
            }catch let error {
                print(error.localizedDescription)
            }
            completion(items)
            
        }) { (error) in
            print(error.localizedDescription)
            completion(items)
        }
    }    
    
}
