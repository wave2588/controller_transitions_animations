//
//  BBBaseNavigationController.m
//  FadeAnimation
//
//  Created by wave on 15/12/9.
//  Copyright © 2015年 wave. All rights reserved.
//

#import "BBBaseNavigationController.h"
#import "BBProtocolView.h"
#import "BBRegulateAnimation.h"

@interface BBBaseNavigationController ()

@end

@implementation BBBaseNavigationController
{
    BBProtocolView *_protocolView;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        _protocolView = [[BBProtocolView alloc]initWithInterceptedProtocol:@protocol(UINavigationControllerDelegate)];
        _protocolView.middleMan = self;
        self.transitioningDelegate = [BBRegulateAnimation defaultCoordinator];
        super.delegate             = (id <UINavigationControllerDelegate>) _protocolView;
    }
    return self;
}

- (void)setDelegate:(id <UINavigationControllerDelegate>)delegate
{
    _protocolView.receiver = delegate;
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    return [[BBRegulateAnimation defaultCoordinator] navigationController:navigationController
                                  animationControllerForOperation:operation
                                               fromViewController:fromVC
                                                 toViewController:toVC];
}

@end
