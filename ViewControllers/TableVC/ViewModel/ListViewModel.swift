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
}


class ListViewModel: NSObject {
    var sections: [[Product]]
    var apiService: ProductApiService
    private var curSection: Int
    
    init(sections: [[Product]], curSegment: Int, apiService: ProductApiService) {
        self.sections = sections
        self.curSection = curSegment
        self.apiService = apiService
    }
    
    
    subscript(indexPath: IndexPath) -> ProductViewModel {
        return ProductViewModel(product: sections[indexPath.section][indexPath.row])
    }
    
    func setCurSectionIndex(curSectionIndex: Int) {
        self.curSection = curSectionIndex
        sections[1] = sections[0].filter({ Cache.shared.isFavorite(id: $0.id) })
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
            Util.loadImage(urlString: urlString, completion: completion)
        }
    }
}
