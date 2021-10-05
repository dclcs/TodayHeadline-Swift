//
//  GTListLoader.swift
//  TodayHeadline-Swift
//
//  Created by dcl on 2021/10/5.
//

import Foundation

typealias GTListLoaderFinishBlock = ((Bool, [GTListItem]?)->Void)

class GTListLoader{
    var finshBlock:(() -> ())?
    
    func loadListDataWithFinishBlock(finishBlock: GTListLoaderFinishBlock?) {
        let data = _readFromLocal()
        if(data != nil) {
            finishBlock!(true, data)
        }
        let url = "https://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
//        let listURL = URL.init(fileURLWithPath: url)
        let listURL = URL.init(string: url)!
        let session = URLSession.shared
     
        let dataTask = session.dataTask(with: listURL) { data, response, error in
            print(data)
            do {
                let jsonObj = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(jsonObj)
                let dataArray = (((jsonObj as! NSDictionary).object(forKey: "result")) as! NSDictionary).object(forKey: "data") as! NSArray
                print(dataArray)
                var listItemArray: [GTListItem] = []
                for info in (dataArray ) {
                    let listItem = GTListItem()
                    listItem.configureWithDictionary(dictionary: info as! NSDictionary)
                    listItemArray.append(listItem)
                }
                print(listItemArray)
                
                if ((finishBlock) != nil) {
                    finishBlock!(error == nil, listItemArray)
                }
                
            }catch {
                
            }
        }
        
        dataTask.resume()

    }
    
    //TODO: 从本地存储读取
    func _readFromLocal() -> [GTListItem]? {
//        NSArray *pathArray= NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//        let pathArray = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .allDomainsMask, true)
//
//        let cachePath = pathArray.first
//
//        guard let listDataPath = cachePath?.appending("GTData/list") else { return nil }
////        NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
//        let fileManager = FileManager.default
////        NSFileManager *fileManager =  [NSFileManager defaultManager];
//        guard let readDataList = fileManager.contents(atPath: listDataPath) else { return nil }
////        NSData *readDataList = [fileManager contentsAtPath:listDataPath];
////        id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readDataList error:nil];
//        let unarchiveObj = NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClasses: Set([NSArray.self, GTListItem.self,nil]), from: readDataList)
//
////        if([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0){
////            return  (NSArray<GTListItem *> *)unarchiveObj;
////        }
//        if(unarchiveObj.isKind(of: [NSArray]) && unarchiveObj.count > 0) {
//            return unarchiveObj as [GTListItem]
//        }
//
        return nil;
    }
}
