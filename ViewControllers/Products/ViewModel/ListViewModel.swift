//
//  ListViewModel.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

protocol ListViewModelDelegate {
    func getImage(urlString: String, completion: @escaping (UIImage?) -> Void)
    func toggleFavorite(id: String) -> Bool
}


class ListViewModel: NSObject {
    var sections: [[Product]]
    var apiService: ProductApiService
    var curSection: Int
    var count: Int {
        return sections[curSection].count
    }
    subscript(index: Int) -> ProductViewModel {
        return ProductViewModel(product: sections[curSection][index])
    }
    
    init(sections: [[Product]], curSegment: Int, apiService: ProductApiService) {
        self.sections = sections
        self.curSection = curSegment
        self.apiService = apiService
    }
        
    
    func setCurSectionIndex(curSectionIndex: Int) {
        self.curSection = curSectionIndex
        if curSection == 1 {
            sections[1] = sections[0].filter({ Cache.shared.isFavorite(id: $0.id) })
        }        
    }
    
    func loadData(completion: @escaping () -> Void) -> Void {
        apiService.loadData { [weak self] (items) in
            self?.sections = items
            completion()
        }
    }

}

extension ListViewModel: ListViewModelDelegate {
    
    func getImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let image = Cache.shared.thumbnail[urlString] {
            completion(image)
        }else {
            Util.loadImage(urlString: urlString, completion: { (image) in
                completion(image)
                Cache.shared.thumbnail[urlString] = image
            })
        }
    }
    
    func toggleFavorite(id: String) -> Bool {
        let toggleMyFavorite = !Cache.shared.isFavorite(id: id)
        Cache.shared.setFavorite(id: id, favorite: toggleMyFavorite)
        return toggleMyFavorite
    }
}
