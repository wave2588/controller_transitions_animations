//
//  BBMoveController.m
//  FadeAnimation
//
//  Created by wave on 16/5/18.
//  Copyright © 2016年 wave. All rights reserved.
//

#import "BBMoveController.h"
#import "UIView+Frame.h"

@interface BBMoveController ()

@end

@implementation BBMoveController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, (self.view.height - 30) * 0.5, self.view.width, 30)];
    label.text = @"嘿嘿嘿嘿嘿";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}



@end
