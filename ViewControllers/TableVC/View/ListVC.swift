//
//  ListVC.swift
//  ViewControllers
//
//  Created by Mike Saradeth on 4/8/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit




class ListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: ListViewModel!
    
    static func createWith(storyboardName: String, vcIdentifier: String, title: String, viewModel: ListViewModel) -> ListVC {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcIdentifier) as! ListVC
        vc.title = title
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVC()
        viewModel.loadData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setVC() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: ListCell.cellIdentifier)
    }
}


extension ListVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.cellIdentifier, for: indexPath) as! ListCell
        cell.configure(item: viewModel[indexPath], delegate: viewModel)
        
        return cell
    }
}
