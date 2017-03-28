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
        
        self.title = "今日头条";
//        requestTop();
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
        
        requestTop();
        
      
    }
}


//MARK: ------------ private method --------------

extension FirstViewController{
    
    fileprivate func requestTop(){
        let activityview = UIActivityIndicatorView(frame: CGRect.init(x: 100, y: 100, width: 50, height: 50));
        self.view.addSubview(activityview)
        
        activityview.backgroundColor = UIColor.yellow;
        activityview.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge;
        activityview.color = UIColor.red;
        activityview.center = self.view.center;
        
        // 停止转圈圈时，隐藏
        activityview.hidesWhenStopped = true
        activityview.startAnimating()
        
        activityview.tag = 1000
        
        APITop.requestTop(callback: { (responseNewsModel:NewsModel) in
            
            print(responseNewsModel.reason ?? "success");
            activityview.stopAnimating();
        }, failCallBack: { (responseFail) in
            print(responseFail);
            activityview.stopAnimating();
        });
        let a :String = "1";
       
//        apiTop.requestTop(callback: { (responseSuccss) in
//            print(responseSuccss);
//        }, failCallBack: { (responseFail) in
//            print(responseFail);
//        });
    }
    
}

