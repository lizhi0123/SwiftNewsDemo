//
//  DetailViewController.swift
//  AlamofireDemo
//
//  Created by SunnyZhang on 2017/5/5.
//  Copyright © 2017年 Sunny. All rights reserved.
//

import UIKit
//import NewsDatailModel

class DetailViewController: UIViewController {
    
// 我靠属性
    var newDatailModel:NewsDatailModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//MARK: ---------  public method -----------

extension DetailViewController {
    public func setupInitWith(newsDatailModel:NewsDatailModel?){
    
        self.newDatailModel = newsDatailModel
    }
}
