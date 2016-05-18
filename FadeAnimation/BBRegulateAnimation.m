//
//  BBRegulateAnimation.m
//  FadeAnimation
//
//  Created by wave on 15/12/9.
//  Copyright © 2015年 wave. All rights reserved.
//

#import "BBRegulateAnimation.h"
#import "BBFirstViewController.h"
#import "BBSecondViewController.h"
#import "BBThreeViewController.h"

//动画
#import "BBFadeAnimation.h"
#import "BBMoveAnimation.h"

typedef id <UIViewControllerAnimatedTransitioning> (^animation)(void);

static NSMutableDictionary *sTransitions;

static void inline registerTransition(Class fromViewControllerClass, Class toViewControllerClass, animation action) {
    sTransitions[[NSStringFromClass(fromViewControllerClass) stringByAppendingString:NSStringFromClass(toViewControllerClass)]] = action;
}

@interface BBRegulateAnimation ()

@end

@implementation BBRegulateAnimation

+ (instancetype)defaultCoordinator
{
    static dispatch_once_t         token;
    static BBRegulateAnimation *instance;
    
    dispatch_once(&token, ^{
        instance = [[BBRegulateAnimation alloc] init];
    });
    
    return instance;
}

+(void)initialize{
    if (self == [BBRegulateAnimation class]) {
        sTransitions = [[NSMutableDictionary alloc]init];
        
        //这里控制从哪个控制器到哪个控制器执行动画,比如从A到B执行动画,这样在任何情况下都可以使用showviewcontroller来跳转控制器.
        //1 -> 2
        registerTransition([BBFirstViewController class], [BBSecondViewController class], ^id<UIViewControllerAnimatedTransitioning>{
            BBFadeAnimation *animationController = [[BBFadeAnimation alloc]init];
            animationController.duration = 0.5f;
            animationController.reverse = NO;
            return animationController;
        });
        
        // 2 -> 1
        registerTransition([BBSecondViewController class], [BBFirstViewController class], ^id<UIViewControllerAnimatedTransitioning>{
            BBFadeAnimation *animationController = [[BBFadeAnimation alloc]init];
            animationController.duration = 0.5f;
            animationController.reverse = YES;
            return animationController;
        });
        
        // 2 -> 3
        registerTransition([BBSecondViewController class], [BBThreeViewController class], ^id<UIViewControllerAnimatedTransitioning>{
            BBMoveAnimation *animationController = [[BBMoveAnimation alloc]init];
            animationController.duration = 1.0;
            return animationController;
        });
        
        // 3 -> 2
        registerTransition([BBThreeViewController class], [BBSecondViewController class], ^id<UIViewControllerAnimatedTransitioning>{
            BBMoveAnimation *animationController = [[BBMoveAnimation alloc]init];
            animationController.duration = 1.0;
            return animationController;
        });
    }
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    animation action = sTransitions[[NSStringFromClass([fromVC class]) stringByAppendingString:NSStringFromClass([toVC class])]];
    return action ? action() : nil;
}

@end
