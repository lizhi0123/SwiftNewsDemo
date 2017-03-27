//
//  APITop.swift
//  AlamofireDemo
//
//  Created by Sunny Zhang on 17/3/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

import UIKit
import Alamofire



//        let method:HTTPMethod! = HTTPMethod.get;
//        let encoding:ParameterEncoding! = URLEncoding.default;
//        let head = HTTPHeaders;

//Alamofire.request(url).responseString { (resultString) in
//    
//    print("resultString=\(resultString)");
//    
//}

typealias APITopCallBack = (_ responseString:String) -> Void;

class APITop: NSObject {

    let topUrlStr = House.TopType
    
    let topUrl:String ;
    
    
    
    override init() {
        //         let topUrl:String = baseUrl + topUrlStr;
        topUrl = "\(baseUrl)?type=\(topUrlStr)&key=\(appkey)";
        print(topUrl);
        
        
    }
    
  
}


//MARK: ------  request  --------
extension APITop{
    
    public func  requestTop(callback:@escaping APITopCallBack){
        
        
        
        Alamofire.request(topUrl).responseString { (resultString) in
            
            print("resultString=\(resultString)");
            
            let reusultData = resultString.data;
            let resultStr:String! = String(data: reusultData!, encoding: .utf8);
//            let resultStr:String = resultString;
            
            callback(resultStr);
            
        }
        
    }
    
}
