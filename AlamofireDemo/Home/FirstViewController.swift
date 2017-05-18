//
//  FirstViewController.swift
//  AlamofireDemo
//
//  Created by SunnyZhang on 17/3/20.
//  Copyright © 2017年 Sunny. All rights reserved.
//

import UIKit
import PKHUD
import Kingfisher
import CRRefresh

let ShowDetailControllerSegue:String = "ShowDetailControllerSegue";



class FirstViewController: UIViewController {
    
     let tableviewID:String! = "firstTableviewID";
    var newsListArr = [NewsDatailModel]();
    var currentPage:Int = 0 ;

    @IBOutlet weak var mainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "今日头条";
        
        HUD.dimsBackground = false
        HUD.allowsInteraction = false
        
        initMainTable();
        self.mainTable.cr.addHeadRefresh(animator: NormalHeaderAnimator()){ [weak self] in
            self!.startRequestTop()
        }
        
        self.mainTable.cr.beginHeaderRefresh()
        
        
        
        
//        requestTop();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let newsDatail: NewsDatailModel = self.newsListArr[indexPath.row];
        if segue.identifier == ShowDetailControllerSegue{
            let controller = segue.destination as! DetailViewController
            controller.newDatailModel = (sender as? NewsDatailModel)!;
        }
        
    }

    
}


//MARK: ------------ private method --------------

extension FirstViewController{
    
    fileprivate func startRequestTop(){
        
        HUD.show(.labeledProgress(title: nil, subtitle: "正在加载..."))
        
        APITop.requestTop(callback: { (responseNewsModel:NewsModel) in
            
            let stat:String = responseNewsModel.result!.stat!;
            
            self.currentPage = Int(stat) ?? 0 ;
            
            print(responseNewsModel.reason ?? "success");
            
            let newsResult:NewsResultModel = responseNewsModel.result!;
            
            self.newsListArr = newsResult.newsDatailList!;
            print(self.newsListArr);
            self.mainTable.reloadData();
            
            HUD.hide();
            self.mainTable.cr.endHeaderRefresh();
            
        }, failCallBack: { (responseFail) in
            print(responseFail);
            HUD.hide();
            HUD.flash(HUDContentType.label("请求失败"));
            self.mainTable.cr.endHeaderRefresh();
        });
       

    }
    
}

//MARK: ------  private Method --------

extension FirstViewController{
    
    fileprivate func initMainTable(){
//        mainTable.register(UITableViewCell.self, forCellReuseIdentifier: tableviewID)
    }
}

//MARK: --------- UITableview Datasource -----------
extension FirstViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let count = newsListArr.count;
        return count;
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: tableviewID);
      
        let newsDatail: NewsDatailModel = self.newsListArr[indexPath.row];
        cell.textLabel?.text = newsDatail.title;
        
//        let url = URL(string: newsDatail.url!)
//        let urlString = newsDatail.thumbnail_pic_s ?
        let urlString = newsDatail.thumbnail_pic_s ?? "http://wx3.sinaimg.cn/mw1024/b28b586fly1fdk99euvgqj20go0godj2.jpg";
        let url = URL(string: urlString) ;
        print(urlString);
        
        

        let imageView = cell.imageView;
        let defaultImage = UIImage(named: "ImgDefaultSmall");
        imageView?.kf.setImage(with: url, placeholder: defaultImage, options: [KingfisherOptionsInfoItem.cacheMemoryOnly], progressBlock: nil, completionHandler: nil);
        


        
        return cell;
    }
    
   
}

extension FirstViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("点击cell")
//        self.mainTable!.deselectRow(at: indexPath, animated: true)
        let newsDetailModel:NewsDatailModel! = self.newsListArr[indexPath.row];
        
        self.performSegue(withIdentifier: "ShowDetailControllerSegue", sender: newsDetailModel)
        
        
    }
}


