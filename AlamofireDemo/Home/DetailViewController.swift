//
//  DetailViewController.swift
//  AlamofireDemo
//
//  Created by SunnyZhang on 2017/5/5.
//  Copyright © 2017年 Sunny. All rights reserved.
//

import UIKit
import Kingfisher
//import NewsDatailModel

class DetailViewController: UIViewController {
    
// 我靠属性
    var newDatailModel:NewsDatailModel?

    //标题
    @IBOutlet weak var titleLbl: UILabel!
    //图片展示
    @IBOutlet weak var iconImgV: UIImageView!
    //详情
    @IBOutlet weak var detailWebV: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "详情";
        
        self.reloadData();

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

    //MARK: ------  Public Method --------

    public func setupInitWith(newsDatailModel:NewsDatailModel?){
        
        self.newDatailModel = newsDatailModel
//        self.reloadData();
    }
}

//MARK: ------   Private Method --------
extension DetailViewController {
    /** 添加view */
    fileprivate func reloadData(){
        self.titleLbl.text = self.newDatailModel?.title;
        let defaultImage = UIImage(named: "ImgDefaultSmall");
        
        let iconUrlString = self.newDatailModel?.thumbnail_pic_s ?? "http://wx3.sinaimg.cn/mw1024/b28b586fly1fdk99euvgqj20go0godj2.jpg";
        let iconUrl = URL(string: iconUrlString) ;
        self.iconImgV?.kf.setImage(with: iconUrl, placeholder: defaultImage, options: [KingfisherOptionsInfoItem.cacheMemoryOnly], progressBlock: nil, completionHandler: nil);
        
        let webUrlStr:String? = self.newDatailModel?.url ?? "http://www.baidu.com";
        let webUrl:URL = URL(string: webUrlStr!)! ;
       let request =  URLRequest(url: webUrl)
        self.detailWebV.loadRequest(request);
    }
}

