//
//  ViewController.m
//  MyRecommendProductsDemo
//
//  Created by chang on 15/12/6.
//  Copyright © 2015年 chang. All rights reserved.
//

#import "ViewController.h"
#import "MFProductsController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)recommendProductsBtnClicked:(id)sender {
    
    MFProductsController * productsController = [[MFProductsController alloc] init];
    [self.navigationController pushViewController:productsController animated:YES];
}

@end
