//
//  MFProduct.m
//  MyRecommendProductsDemo
//
//  Created by chang on 15/12/6.
//  Copyright © 2015年 chang. All rights reserved.
//

#import "MFProduct.h"

@implementation MFProduct

+ (instancetype)productWithDic:(NSDictionary *)dic{
    MFProduct *pro = [MFProduct new];
    [pro setValuesForKeysWithDictionary:dic];
    
    return pro;
}

@end
