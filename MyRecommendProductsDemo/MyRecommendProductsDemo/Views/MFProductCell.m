//
//  MFProductCell.m
//  MyRecommendProductsDemo
//
//  Created by chang on 15/12/6.
//  Copyright © 2015年 chang. All rights reserved.
//

#import "MFProductCell.h"
#import "MFProduct.h"

@interface MFProductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;

@end

@implementation MFProductCell

- (void)awakeFromNib{
    //圆角
    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setProduct:(MFProduct *)product{
    _product = product;
    
    self.titleView.text = product.title;
    self.iconView.image = [UIImage imageNamed:product.icon];
}


@end
