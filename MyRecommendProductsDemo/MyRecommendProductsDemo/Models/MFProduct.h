//
//  MFProduct.h
//  MyRecommendProductsDemo
//
//  Created by chang on 15/12/6.
//  Copyright © 2015年 chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFProduct : NSObject

//"title": "网易电影票",
//"id": "com.netease.movie",
//"url": "http://itunes.apple.com/app/id583784224?mt=8",
//"icon": "movie@2x.png",
//"customUrl": "movieticket163"
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *customUrl;


+ (instancetype)productWithDic:(NSDictionary *)dic;

@end
