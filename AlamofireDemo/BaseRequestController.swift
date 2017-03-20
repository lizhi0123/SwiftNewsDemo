//
//  BaseRequestController.swift
//  AlamofireDemo
//
//  Created by SunnyZhang on 17/3/20.
//  Copyright © 2017年 Sunny. All rights reserved.
//

import UIKit
import Alamofire


class BaseRequestController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: ------  click method --------

    @IBAction func requestData(_ sender: Any) {
        let appkey = "f1db1cefce44c93b2549b592a7fe6039"
        let url:String! = "http://v.juhe.cn/toutiao/index?type=top&key=\(appkey)";
//        let method:HTTPMethod! = HTTPMethod.get;
//        let encoding:ParameterEncoding! = URLEncoding.default;
//        let head = HTTPHeaders;
        
       Alamofire.request(url).responseString { (resultString) in
        
        print("resultString=\(resultString)");
        
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
