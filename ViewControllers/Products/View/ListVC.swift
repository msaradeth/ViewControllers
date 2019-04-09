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
        
        //Add Segmented Controll to titleView
        let segmentedControl = UISegmentedControl(items: ["All", "Favorites"])
        segmentedControl.sizeToFit()
        segmentedControl.selectedSegmentIndex = viewModel.curSection
        self.navigationItem.titleView = segmentedControl
        segmentedControl.addTarget(self, action: #selector(segControlAction(_:)), for: .valueChanged)
    }
    
    @IBAction func segControlAction(_ sender: UISegmentedControl) {
        viewModel.setCurSectionIndex(curSectionIndex: sender.selectedSegmentIndex)
        tableView.reloadData()
    }
}


extension ListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.cellIdentifier, for: indexPath) as! ListCell
        cell.configure(item: viewModel[indexPath.row], delegate: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewModel = DetailViewModel(item: viewModel[indexPath.row])
        let vc = DetailVC.createWith(storyboardName: "Product", vcIdentifier: "DetailVC", title: "Product Detail", viewModel: detailViewModel)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
