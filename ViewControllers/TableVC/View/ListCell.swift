//
//  ListCell.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    @IBOutlet weak var tumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var favContainerView: UIView!
    @IBOutlet weak var favorite: UIImageView!
    let favoriteImage = UIImage(named: "favorite")
    let notFavoriteImage = UIImage(named: "notFavorite")
    static let cellIdentifier = "Cell"
    
    var item: ProductViewModel!
    var delegate: ListViewModelDelegate?
    
    func configure(item: ProductViewModel, delegate: ListViewModelDelegate?) {
        self.item = item
        self.delegate = delegate
        titleLabel.text = item.name
        detailLabel.text = item.price

        //Set favorite/
        favorite.image = Cache.shared.isFavorite(id: item.id) ? favoriteImage : notFavoriteImage
        
        delegate?.getImage(urlString: item.thumbnailUrl, completion: { [weak self] (image) in
            DispatchQueue.main.async {
                self?.tumbnail.image = image
            }            
        })
    }

    
    
}
