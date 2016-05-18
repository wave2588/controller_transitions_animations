//
//  BBThreeViewController.m
//  FadeAnimation
//
//  Created by wave on 15/12/11.
//  Copyright © 2015年 wave. All rights reserved.
//

#import "BBThreeViewController.h"

@interface BBThreeViewController ()

@end

@implementation BBThreeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"第三层:%@",self.navigationController.viewControllers);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
}


@end
