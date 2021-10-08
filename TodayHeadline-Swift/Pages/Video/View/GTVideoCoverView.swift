//
//  GTVideoCoverView.swift
//  TodayHeadline-Swift
//
//  Created by dcl on 2021/10/8.
//

import UIKit

class GTVideoCoverView: UICollectionViewCell {
    var videoURL = ""
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .black
        setupUI()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapToPlay() {
        GTVideoPlayer.player.playVideoWithURL(videoURL: videoURL, attachView: coverView)
    }
    
    func setupUI() {
        self.contentView.addSubview(coverView)
        self.coverView.addSubview(playButton)
    }
    
    
    func layoutWithVideoCoverUrl(videoURL: String, videoCoverURL: String) {
        coverView.image = UIImage(named: videoCoverURL)
        self.videoURL = videoURL
//        [_toolBar layoutWithModel:nil];
    }
    
    
    func setupGesture() {
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapToPlay))
        self.addGestureRecognizer(tapGesture)
    }
    
    lazy var coverView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height - GTVideoToolBarHeight))
        return view
    }()
    
    
    lazy var playButton: UIImageView = {
        let view = UIImageView(frame: CGRect(x: (frame.size.width - 50) / 2, y: (frame.size.height - GTVideoToolBarHeight - 50) / 2, width: 50, height: 50))
        view.image = #imageLiteral(resourceName: "like_selected")
        return view
    }()
}
