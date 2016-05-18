//
//  BBMoveAnimation.m
//  FadeAnimation
//
//  Created by wave on 16/5/18.
//  Copyright © 2016年 wave. All rights reserved.
//

#import "BBMoveAnimation.h"
#import "UIView+Frame.h"

@interface BBMoveAnimation ()

@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation BBMoveAnimation

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *containerView      = [transitionContext containerView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    toViewController.view.alpha = 0;
    [containerView addSubview:toViewController.view];
    
    toViewController.view.frame = CGRectMake(0, -toViewController.view.height, toViewController.view.width, toViewController.view.height);
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:2.0 options:0 animations:^{
        fromViewController.view.alpha = 0;
        toViewController.view.alpha = 1;
        toViewController.view.top = 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}

@end
