//
//  BBBaseAnimation.h
//  FadeAnimation
//
//  Created by wave on 16/5/18.
//  Copyright © 2016年 wave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBBaseAnimation : NSObject<UIViewControllerAnimatedTransitioning>

//动画时间
@property (nonatomic, assign) CGFloat duration;

@end
