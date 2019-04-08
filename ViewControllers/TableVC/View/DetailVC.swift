//
//  DetailVC.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    var viewModel: DetailViewModel!

    
    static func createWith(storyboardName: String, vcIdentifier: String, title: String, viewModel: DetailViewModel) -> DetailVC {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcIdentifier) as! DetailVC
        vc.title = title
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.productDescription.text = self.viewModel.item.description
            self.price.text = self.viewModel.item.price
            self.name.text = self.viewModel.item.name
        }
        
        viewModel.getImage { [weak self] (image) in
            DispatchQueue.main.async {
                self?.productImage.image = image
            }
        }
    }
    

}
