//
//  BBFirstViewController.m
//  FadeAnimation
//
//  Created by wave on 15/12/9.
//  Copyright © 2015年 wave. All rights reserved.
//

#import "BBFirstViewController.h"
#import "BBSecondViewController.h"

@interface BBFirstViewController ()

@property (nonatomic,strong) UIButton *nextBtn;

@end

@implementation BBFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.nextBtn];
}

-(void)clickNextBtn{
    BBSecondViewController *secondVC = [[BBSecondViewController alloc]init];
    [self showViewController:secondVC sender:self];
}

-(UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
        [_nextBtn setTitle:@"点我点我" forState:UIControlStateNormal];
        _nextBtn.backgroundColor = [UIColor redColor];
        [_nextBtn addTarget:self action:@selector(clickNextBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}


@end
