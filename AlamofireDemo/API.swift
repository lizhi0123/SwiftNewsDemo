//
//  API.swift
//  AlamofireDemo
//
//  Created by Sunny Zhang on 17/3/21.
//  Copyright © 2017年 Sunny. All rights reserved.
//

import UIKit

let appkey = "f1db1cefce44c93b2549b592a7fe6039";
let baseUrl  = "http://v.juhe.cn/toutiao/index"


enum House: String {
    case TopType = "top"
    case Greyjoy = "We Do Not Sow"
    case Martell = "Unbowed, Unbent, Unbroken"
    case Stark = "Winter is Coming"
    case Tully = "Family, Duty, Honor"
    case Tyrell = "Growing Strong"
}


class API: NSObject {
    
   
    let topUrlStr = House.TopType
    let topUrl:String ;
    
   
    
    override init() {
//         let topUrl:String = baseUrl + topUrlStr;
         topUrl = "\(baseUrl)?type=\(topUrlStr)&key=\(appkey)";
        print(topUrl);
    }
    

}
