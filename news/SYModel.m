//
//  SYModel.m
//  news
//
//  Created by 李飞艳 on 2017/10/22.
//  Copyright © 2017年 李飞艳. All rights reserved.
//

#import "SYModel.h"
#import <AFNetworking.h>
#import "Firstcellmodel.h"
@implementation SYModel
- (instancetype)init{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    //热点
    [manger GET:@"https://is.snssdk.com/api/news/feed/v51/" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dict = responseObject;
        //新闻条数
        _data = dict[@"data"];  //数组
        _newsNum = _data.count;
        
        for(int i = 0;i < _data.count;i++){
            NSDictionary *dict1 = _data[i];
            NSString *string = dict1[@"content"];
            //将Json字符串转换成字典
            NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
            NSError *err;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
//            _data[i] = dic;
//            NSLog(@"%@",_data[i][@"title"]);

        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"data" object:nil userInfo:@{@"value":_data}];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    return self;
}
@end
//   NSURL *url = [NSURL URLWithString:@"https://interface.sina.cn/wap_api/layout_col.d.json?&showcid=56261"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        //解析请求到的数据
//        id objc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"---%@",objc);
//    }];
//    [dataTask resume];

//    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
//    [manger GET:@"https://interface.sina.cn/wap_api/layout_col.d.json?&showcid=56261" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        NSLog(@"%@",responseObject);
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];

