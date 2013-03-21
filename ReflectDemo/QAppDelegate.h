//
//  QAppDelegate.h
//  ReflectDemo
//
//  Created by liubinbin on 13-3-21.
//  Copyright (c) 2013年 liubinbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QViewController;

@interface QAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) QViewController *viewController;

@end
