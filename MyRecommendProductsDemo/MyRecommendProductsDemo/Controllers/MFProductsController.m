//
//  MFProductsController.m
//  MyRecommendProductsDemo
//
//  Created by chang on 15/12/6.
//  Copyright © 2015年 chang. All rights reserved.
//

#import "MFProductsController.h"
#import "MFProduct.h"
#import "MFProductCell.h"

@interface MFProductsController ()
@property (nonatomic,strong) NSArray *products;
@end

@implementation MFProductsController

//0 懒加载
- (NSArray *)products{
    if (_products ==nil) {
        //0.1  加载json文件
        NSString *path = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        //0.2  字典转模型
        NSMutableArray *mArray = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            MFProduct *pro = [MFProduct productWithDic:dic];
            [mArray addObject:pro];
        }
        _products = mArray.copy;
    }
    return _products;
}

//1 设置flowLayout
- (instancetype)init{
    UICollectionViewFlowLayout *flow = [UICollectionViewFlowLayout new];
    //设置cell的大小
    flow.itemSize = CGSizeMake(75, 75);
    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 15;
    flow.headerReferenceSize = CGSizeMake(0, 20);
    return [super initWithCollectionViewLayout:flow];
}

static NSString *reuseId = @"product";

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    //    self.view.backgroundColor = [UIColor whiteColor];
    //    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    
    
    //2 注册nib或者自定义类
    UINib *nib = [UINib nibWithNibName:@"MFProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseId];
}

//数据源的方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.products.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //1
    
    MFProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseId forIndexPath:indexPath];
    //2
    cell.product = self.products[indexPath.item];
    
    //    cell.backgroundColor = [UIColor redColor];
    //3
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    MFProduct *product = self.products[indexPath.item];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",product.customUrl,product.id]];
    
    //判断是否能够打开该应用
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }else{
        //跳转到appStore
        url = [NSURL URLWithString:product.url];
        [[UIApplication sharedApplication] openURL:url];
    }

}


@end
