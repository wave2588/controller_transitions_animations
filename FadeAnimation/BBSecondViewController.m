//
//  BBSecondViewController.m
//  FadeAnimation
//
//  Created by wave on 15/12/9.
//  Copyright © 2015年 wave. All rights reserved.
//

#import "BBSecondViewController.h"
#import "BBThreeViewController.h"

#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>

@interface BBSecondViewController ()

@property (nonatomic,strong) UIButton *nextBtn;

@end

@implementation BBSecondViewController

-(BOOL)fd_interactivePopDisabled{

    return YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"第二层:%@",self.navigationController.viewControllers);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.nextBtn];
}

-(void)clickNextBtn{
    BBThreeViewController *threeVC = [[BBThreeViewController alloc]init];
    [self showViewController:threeVC sender:self];
}

-(UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
        [_nextBtn setTitle:@"-->第三个" forState:UIControlStateNormal];
        _nextBtn.backgroundColor = [UIColor redColor];
        [_nextBtn addTarget:self action:@selector(clickNextBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}
@end
