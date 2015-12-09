//
//  BBRegulateAnimation.h
//  FadeAnimation
//
//  Created by wave on 15/12/9.
//  Copyright © 2015年 wave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBRegulateAnimation : NSObject <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

+ (instancetype)defaultCoordinator;

@end
