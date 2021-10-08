//
//  GTVideoViewController.swift
//  TodayHeadline-Swift
//
//  Created by dcl on 2021/10/8.
//

import UIKit
let GTVideoToolBarHeight:CGFloat  = 60.0

class GTVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
        
    }
    
    func setupUI()  {
        self.view.addSubview(collectionView)
    }

    lazy var collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.minimumLineSpacing = 10
        flowlayout.minimumInteritemSpacing = 10
        flowlayout.itemSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.width / 16 * 9 + GTVideoToolBarHeight)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GTVideoCoverView.self, forCellWithReuseIdentifier: "GTVideoCoverView")
        return collectionView
    }()
}


extension GTVideoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "GTVideoCoverView", for: indexPath) as! GTVideoCoverView
        cell.layoutWithVideoCoverUrl(videoURL: "http://ftp6483909.host124.sanfengyun.cn/1.mp4", videoCoverURL: "http://ftp6483909.host124.sanfengyun.cn/1.png")
        return cell
    }
    
   
    
    
}
