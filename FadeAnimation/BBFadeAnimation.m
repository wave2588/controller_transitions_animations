//
//  BBFadeAnimation.m
//  animation
//
//  Created by wave on 15/12/9.
//  Copyright © 2015年 wave. All rights reserved.
//

#import "BBFadeAnimation.h"

@interface BBFadeAnimation ()

@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation BBFadeAnimation

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView           *containerView      = [transitionContext containerView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (!self.reverse) {
        toViewController.view.alpha = 0;
        [containerView addSubview:toViewController.view];
        [UIView animateWithDuration:duration animations:^{
            fromViewController.view.alpha = 0;
            toViewController.view.alpha   = 1;
        }                completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    } else {
        
        [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
        [UIView animateWithDuration:duration animations:^{
            fromViewController.view.alpha = 0;
            toViewController.view.alpha   = 1;
        }                completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    }
}

@end
