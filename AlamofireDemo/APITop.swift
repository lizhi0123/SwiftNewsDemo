//
//  APITop.swift
//  AlamofireDemo
//
//  Created by Sunny Zhang on 17/3/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

import UIKit
import Alamofire
//import ObjectMapper



typealias APITopCallBack = (_ responseNewsModel:NewsModel) -> Void;


class APITop: NSObject {
    
    override init() {

    }
    
  
}


//MARK: ------  request  --------
extension APITop{
    
   class func  requestTop(callback:@escaping APITopCallBack, failCallBack:@escaping APITopFailCallBack){
        
    let topUrlStr = House.TopType;
    
   let topUrl = "\(baseUrl)?type=\(topUrlStr)&key=\(appkey)";
    
        Alamofire.request(topUrl).responseString { (response) in
            
            if(response.result.isSuccess){
                
                let reusultData = response.data;
                
                let resultStr:String! = String(data: reusultData!, encoding: .utf8);
                
                let newsResult:NewsModel! = NewsModel(JSONString: resultStr);
                print("request 返回值 + \(newsResult)") ;
                
                callback(newsResult);
                
            }else{
                let error = response.error.debugDescription;
                
                failCallBack(error);
            }

        }
        
    }
    
}
