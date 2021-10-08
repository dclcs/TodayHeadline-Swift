//
//  GTVideoPlayer.swift
//  TodayHeadline-Swift
//
//  Created by dcl on 2021/10/8.
//

import Foundation
import UIKit
import AVFoundation
class GTVideoPlayer {
    static let player = GTVideoPlayer()
    
    var videoItem: AVPlayerItem?
    var avPlayer : AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    init() {
        
    }
    
    func playVideoWithURL(videoURL: String, attachView: UIView) {
        let videoURL = URL.init(string: videoURL)
        let asset = AVAsset.init(url: videoURL!)
        
        videoItem = AVPlayerItem.init(asset: asset)
//        videoItem!.addObserver(self as! NSObject, forKeyPath: "staus", options: .new, context: nil)
//        videoItem!.addObserver(self as! NSObject, forKeyPath: "loadedTimeRanges", options: .new, context: nil)
        
        let duration = videoItem!.duration
        let videoDuration = duration.seconds
        
        avPlayer = AVPlayer.init(playerItem: videoItem)
        avPlayer!.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 1), queue: dispatch_queue_main_t.global()) { time in
            print("播放进度\(time)")
        }
        
        playerLayer = AVPlayerLayer.init(player: avPlayer)
        
        playerLayer!.frame = attachView.bounds
        
        attachView.layer.addSublayer(playerLayer!)
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
//        NSLog(@"");
    }
}
