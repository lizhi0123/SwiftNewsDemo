//
//  NewsModel.swift
//  AlamofireDemo
//
//  Created by SunnyZhang on 17/3/28.
//  Copyright © 2017年 Sunny. All rights reserved.
//

import UIKit
import ObjectMapper

class NewsModel: Mappable {
    
    var reason :String?
     var result :NewsResultModel?
     var error_code : Int?
   

   required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        /*
        "reason":"成功的返回",
        "result":{
            "stat":"1",
            "data":[
            */
        reason <- map["reason"]
        result <- map["result"]
        
    }
}

class NewsResultModel: Mappable {
    
    var stat:String?
    var newsDatailList:[NewsDatailModel]?
    
   required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
        /*
        result":{
        "stat":"1",
        "data":[
        */
        stat <- map["stat"]
        newsDatailList <- map["data"]
    }
}

class NewsDatailModel: Mappable {
    
    var title:String?;
    var date:Date?
    var author_name:String?
    var url:String?
    
    /*
    "uniquekey":"e7b150d3e1ca9ceb46247657b9165022",
    "title":"原来女人这里越大，湿气就越重，美女们可自测！",
    "date":"2017-03-28 13:53",
    "category":"头条",
    "author_name":"带着相机看世界",
    "url":"http://mini.eastday.com/mobile/170328135338337.html",
    "thumbnail_pic_s":"http://00.imgmini.eastday.com/mobile/20170328/20170328_55acc3a7926d828e8eea3ff3a64dd967_cover_mwpm_03200403.png",
    "thumbnail_pic_s02":"http://00.imgmini.eastday.com/mobile/20170328/20170328_9c374f9d84d934639e62bbdbfd2a95eb_cover_mwpm_03200403.png",
    "thumbnail_pic_s03":"http://00.imgmini.eastday.com/mobile/20170328/20170328_1b6776e9796dd82bcc40726a582a1174_cover_mwpm_03200403.png
    */
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        title <- map["title"];
        date <- (map["date"],DateTransform());
        author_name <- map["author_name"];
        url <- map["url"];
      
    }
}
