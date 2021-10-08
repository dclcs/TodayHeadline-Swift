//
//  GTNormalTableViewCell.swift
//  TodayHeadline-Swift
//
//  Created by dcl on 2021/10/5.
//

import UIKit
import SDWebImage
class GTNormalTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        addSubview(titleLabel)
        addSubview(sourceLabel)
        addSubview(commentLabel)
        addSubview(timeLabel)
        addSubview(rightImageView)
    }
    
    
    func layoutTableViewCellWithItem(item: GTListItem) {
        //TODO: 是否已读
//        BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniqueKey];
//
//        if(hasRead){
//            self.titleLabel.textColor = [UIColor grayColor];
//        }else{
//            self.titleLabel.textColor = [UIColor blackColor];
//        }
        
        
        titleLabel.text = item.title
        sourceLabel.text = item.authorName
        sourceLabel.sizeToFit()
        
        commentLabel.text = item.category;
        commentLabel.sizeToFit()
        
        commentLabel.frame = CGRect(x: sourceLabel.frame.origin.x + self.commentLabel.frame.size.width +  15, y: commentLabel.frame.origin.y, width: commentLabel.frame.size.width, height: commentLabel.frame.size.height)
        
        timeLabel.text = item.date
        timeLabel.sizeToFit()
        
        timeLabel.frame = CGRect(x: commentLabel.frame.origin.x + self.timeLabel.frame.size.width +  15, y: timeLabel.frame.origin.y, width: timeLabel.frame.size.width, height: timeLabel.frame.size.height)
        
        
        self.rightImageView.sd_setImage(with: URL.init(string: item.picUrl!)) { image, Error, cacheType, imageUrl in
            
            print("download img")
        }
        
    }
    
    
    //MARK: - lazy variable
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 15, width: 300, height: 50))
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    lazy var sourceLabel: UILabel = {
        let label = UILabel.init(frame: CGRect(x: 20, y: 70, width: 50, height: 20))
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = .gray
        return label
    }()
    
    lazy var commentLabel: UILabel = {
        let label = UILabel.init(frame: CGRect(x: 100, y: 70, width: 50, height: 20))
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = .gray
        return label
    }()
    
    
    lazy var timeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 70, width: 50, height: 20))
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = .gray
        return label
    }()
    
    lazy var rightImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 300, y: 15, width: 100, height: 70))
        return view
    }()
    
}
