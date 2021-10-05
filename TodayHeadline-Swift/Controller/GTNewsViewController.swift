//
//  GTNewsViewController.swift
//  TodayHeadline-Swift
//
//  Created by dcl on 2021/10/4.
//

import UIKit

class GTNewsViewController: UIViewController {
    
    var loader: GTListLoader?
    var dataArray: [GTListItem]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
        fetchData()
    }
    
    
    func fetchData() {
        loader = GTListLoader()
        loader?.loadListDataWithFinishBlock(finishBlock: { success, data in
            
            self.dataArray = data 
            
            self.tableView.reloadData()
        })
        
    }
    
    func setupUI() {
        self.view.addSubview(tableView)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}



extension GTNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
