//
//  BBFadeController.m
//  
//
//  Created by wave on 16/5/18.
//
//

#import "BBFadeController.h"

#import "UIView+Frame.h"

@interface BBFadeController ()

@end

@implementation BBFadeController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, (self.view.height - 30) * 0.5, self.view.width, 30)];
    label.text = @"哈哈哈哈哈";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}




@end
