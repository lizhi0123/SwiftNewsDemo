//
//  FirstViewController.swift
//  AlamofireDemo
//
//  Created by SunnyZhang on 17/3/20.
//  Copyright © 2017年 Sunny. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        requestTop();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ------  Click Method --------

    @IBAction func ButtonClick(_ sender: Any) {
        
        let str1 = "\"1\"";
        print(str1);
        
        
//        let str = "{\"username\":\"张三\",\"age\":1}";
//        
//        let user = User(JSONString: str)
//        print("user=\(user)");
        
        let apiTop = APITop();
        
//        apiTop.requestTop();
        apiTop.requestTop { (resultStr) in
            print("resultStr=\(resultStr)");
        }
    }

    

}


//MARK: ------------ private method --------------

extension FirstViewController{
    
    fileprivate func requestTop(){
        
    }
    
}

