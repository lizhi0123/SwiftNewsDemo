# Swift 显示新闻简单Demo
## 介绍
说起来真是惭愧，swift 都出来这么长时间了，还没有去用过，主要是自己OC 用习惯了。感觉现在不学不行了，就写了个简单的Swift 项目。
项目适合菜鸟，大神们请绕路。
> * 首页显示新闻，有下拉刷新，UITableviewCell里显示图片，标题，
> * 点击cell 跳转到详情页 同时也把cell 的数据传递到详情页。

## 效果
先上张效果图

![swiftRequest效果图](http://wx3.sinaimg.cn/mw690/b28b586fgy1ffqrznw63lg20ae0j47ik.gif)
## 源码地址
想看源码的可以到[github](https://github.com/lizhi0123/SwiftRequestDemo) 上下载
## 开发环境

* Xcode 8.3.2
* Swift 3

## 运行项目

在终端cd到你的项目路径 然后执行
`pod install`

## 使用的第三方框架

##### 1.Alamofire 
 网络请求框架

##### 2.CRRefresh 
CRRefresh 有下拉刷新，也有上拉加载更多，因为找的这个api没有更多，demo里就没有写。
##### 3. PKHUD 
loading框
##### 4.Kingfisher 
图片缓存加载
##### 5.ObjectMapper
 json转model。个人认为比swiftyjson好用。

> 打字很辛苦，喜欢请点赞。






