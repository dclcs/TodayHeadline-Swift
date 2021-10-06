//
//  GTNewsViewController.swift
//  TodayHeadline-Swift
//
//  Created by dcl on 2021/10/4.
//

import UIKit

class GTNewsViewController: UIViewController {
    
    var loader: GTListLoader?
    var dataArray: [GTListItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
        fetchData()
    }
    
    
    func fetchData() {
        loader = GTListLoader()
        loader?.loadListDataWithFinishBlock(finishBlock: { [weak self] (success, data )in
            //TODO: 添加到主线程
            guard let self = self else { return }
            self.dataArray = data!
            self.tableView.reloadData()
        })
        
    }
    
    func setupUI() {
        self.view.addSubview(tableView)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.register(GTNormalTableViewCell.self, forCellReuseIdentifier: "id")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}



extension GTNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id") as! GTNormalTableViewCell
//        if((cell == nil)){
////            cell = [[GTNormalTableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"id"];
//            cell = GTNormalTableViewCell.init(style: .subtitle, reuseIdentifier: "id")
////            cell.delegate = self;
//        }
//        [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
        cell.layoutTableViewCellWithItem(item: dataArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
