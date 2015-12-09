//
//  BBFadeAnimation.h
//  animation
//
//  Created by wave on 15/12/9.
//  Copyright © 2015年 wave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBFadeAnimation : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) CGFloat duration;
@property(nonatomic, assign) BOOL reverse;
@end
