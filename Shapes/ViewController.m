//
//  ViewController.m
//  Shapes
//
//  Created by Ricardo Reyes on 6/17/14.
//  Copyright (c) 2014 Ricardo Reyes. All rights reserved.
//

#import "ViewController.h"

@import CoreGraphics;
@import QuartzCore;

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.frame) - 50.0f, CGRectGetMidY(self.view.frame) - 50.0f, 100.0f, 100.0f);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = frame;
    layer.path = path.CGPath;
    layer.fillColor = [[UIColor blueColor] CGColor];
    layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    layer.shadowOpacity = 0.5f;
    layer.shadowPath = path.CGPath;
    layer.shadowRadius = 3.0f;
    [self.view.layer addSublayer:layer];
    
    CGPoint initialPosition = layer.position;
    CGPoint finalPosition = CGPointMake(50.0, 50.0f);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:initialPosition];
    animation.toValue = [NSValue valueWithCGPoint:finalPosition];
    animation.duration = 5.0f;
    [layer addAnimation:animation forKey:@"position"];
    layer.position = finalPosition;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
