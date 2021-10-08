//
//  GTListItem.swift
//  TodayHeadline-Swift
//
//  Created by dcl on 2021/10/5.
//

import Foundation

class GTListItem {
    var category : String?
    var picUrl : String?
    var uniqueKey : String?
    var title : String?
    var date : String?
    var authorName : String?
    var articleUrl : String?
    
    public func configureWithDictionary(dictionary: NSDictionary) {
        category = dictionary.object(forKey: "category") as! String

        self.picUrl = dictionary.object(forKey: "thumbnail_pic_s") as! String
        self.uniqueKey  = dictionary.object(forKey: "uniquekey") as! String
        self.date  = dictionary.object(forKey: "date") as! String
        self.title = dictionary.object(forKey: "title") as! String
        self.authorName  = dictionary.object(forKey: "author_name") as! String
        self.articleUrl  = dictionary.object(forKey: "url") as! String
    }
}
