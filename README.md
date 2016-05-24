# FadeAnimation
任何在A控制器showviewcontroller到B控制器,实现自定义跳转动画,跳转动画需要自己实现.
拦截跳转时机,将自定义跳转动画展示.
抽取一个类,专门来控制跳转动画.
只需要在BBRegulateAnimation类中注册动画,使用动画即可.
  //注册动画          A控制器                   B控制器
  registerTransition([BBFadeController class], [BBFirstViewController class], ^id<UIViewControllerAnimatedTransitioning>{
            //自定义动画
            BBFadeAnimation *animationController = [[BBFadeAnimation alloc]init];
            //动画时间
            animationController.duration = 0.5f;
            //返回时是否执行相同动画
            animationController.reverse = YES;
            return animationController;
        });

