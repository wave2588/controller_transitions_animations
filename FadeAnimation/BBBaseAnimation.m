//
//  BBBaseAnimation.m
//  FadeAnimation
//
//  Created by wave on 16/5/18.
//  Copyright © 2016年 wave. All rights reserved.
//

#import "BBBaseAnimation.h"

@interface BBBaseAnimation ()

@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation BBBaseAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return self.duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    NSLog(@"啦啦啦啦啦,我没什么用");
}

@end
