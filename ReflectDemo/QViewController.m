//
//  QViewController.m
//  ReflectDemo
//
//  Created by liubinbin on 13-3-21.
//  Copyright (c) 2013年 liubinbin. All rights reserved.
//

#import "QViewController.h"

@interface QViewController ()

@end

@implementation QViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"reflectDemo.png"];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    
    [replicatorLayer setContentsScale:[[UIScreen mainScreen] scale]];

    [replicatorLayer setBounds:CGRectMake(0.0, 0.0, image.size.width, image.size.height*1.5)];
    
    [replicatorLayer setMasksToBounds:YES];
    
    [replicatorLayer setAnchorPoint:CGPointMake(0.5, 0.0)];
    
    [replicatorLayer setPosition:CGPointMake(self.view.frame.size.width/2.0, 10.0)];
    
    //copyImageLayer,反射被复制的layer
    [replicatorLayer setInstanceCount:2];
    
    CATransform3D transform = CATransform3DIdentity;
    
    transform = CATransform3DScale(transform, 1.0, -1.0, 1.0);
    
    transform = CATransform3DTranslate(transform, 0.0, -image.size.height*2.0, 1.0);
    
    [replicatorLayer setInstanceTransform:transform];
    
    
    //接下来,我们创建一个层,显示image
    CALayer *imageLayer_ = [CALayer layer];
    
    [imageLayer_ setContentsScale:[[UIScreen mainScreen] scale]];
    
    [imageLayer_ setContents:(id)image.CGImage];
    
    [imageLayer_ setBounds:CGRectMake(0.0, 0.0, image.size.width, image.size.height)];
    
    [imageLayer_ setAnchorPoint:CGPointMake(0.0, 0.0)];
    
    [replicatorLayer addSublayer:imageLayer_];
    
    //最后叠加一个梯度层顶部的“反射”层
    //梯度层绘制渐变背景对其颜色、填充层的形状
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    [gradientLayer setContentsScale:[[UIScreen mainScreen] scale]];
    
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)[[UIColor whiteColor] colorWithAlphaComponent:0.25].CGColor,[UIColor whiteColor].CGColor, nil]];
    
    //记住,反射的层是一半的大小,这就是为什么梯度层的高度是减少一半
    [gradientLayer setBounds:CGRectMake(0.0, 0.0, replicatorLayer.frame.size.width, image.size.height*0.5+1.0)];
    
    [gradientLayer setAnchorPoint:CGPointMake(0.5, 0.0)];
    
    [gradientLayer setPosition:CGPointMake(self.view.frame.size.width/2, image.size.height+10)];
    
    //确保梯度是放在顶部的反射
    [gradientLayer setZPosition:1.0];
    
    [self.view.layer addSublayer:replicatorLayer];
    [self.view.layer addSublayer:gradientLayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
