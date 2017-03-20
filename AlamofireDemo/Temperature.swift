//
//  Temperature.swift
//  AlamofireDemo
//
//  Created by SunnyZhang on 17/3/20.
//  Copyright © 2017年 Sunny. All rights reserved.
//

import UIKit
import ObjectMapper

struct Temperature: Mappable {
    var celsius: Double?
    var fahrenheit: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        celsius 	<- map["celsius"]
        fahrenheit 	<- map["fahrenheit"]
    }
}
