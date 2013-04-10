//
//  ViewController.m
//  Animation
//
//  Created by Peter Bødskov on 4/8/13.
//  Copyright (c) 2013 Peter Bødskov. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@interface ViewController () {
    UIView *greenView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
    UIView* blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.frame = CGRectMake(50,50,100,100);
    
    UIView* grayView = [[UIView alloc] init];
    grayView.backgroundColor = [UIColor grayColor];
    grayView.frame = CGRectMake(50,50,100,100);
    
    [self.view addSubview:blueView];
    [self.view addSubview:grayView];    // gray covers the blue
    
    // Create a mask to allow the grey view to be visible and cover up the blue view
    CALayer* mask = [CALayer layer];
    mask.contentsScale   = grayView.layer.contentsScale;  // handle retina scaling
//    mask.frame           = grayView.layer.bounds;
    mask.frame           = CGRectMake(grayView.frame.size.width, 0, grayView.frame.size.width, grayView.frame.size.height);
    mask.backgroundColor = [UIColor blackColor].CGColor;
    grayView.layer.mask = mask;
    
    // Animate the position of the mask off the grey view, as the grey becomes unmasked,
    // that part of the grey "dissappears" and is no longer covering the blue underneath
    CABasicAnimation* a = [CABasicAnimation animationWithKeyPath:@"position"];
    a.duration  = 4;
//    a.fromValue = [NSValue valueWithCGPoint:mask.position];
    a.byValue = [NSNumber numberWithInt:50];
//    CGPoint newPosition = mask.position;
//    newPosition.x -= mask.bounds.size.width;
    
    CGPoint newPosition = CGPointMake(50, 50);
//    newPosition.x -= mask.bounds.size.width;

    
//    a.toValue   = [NSValue valueWithCGPoint:newPosition];
    a.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [mask addAnimation:a forKey:@"colorize"];   // animate presentation
    
    mask.position = newPosition;        // update actual position
     */
    
    greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.frame = CGRectMake(200, 200, 100, 100);
    [self.view addSubview:greenView];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint points[50];
    int pos = 0;
    for(int i = 200; i > 0; i-= 4){
        points[pos] = CGPointMake(i, 250);
        pos++;
    }
    
    CGPathMoveToPoint(path, NULL, greenView.frame.origin.x, greenView.frame.origin.y);
    CGPathAddLines(path, NULL, points, 50);
    CGPathCloseSubpath(path);
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.calculationMode = kCAAnimationDiscrete;
    keyFrameAnimation.path = path;
    keyFrameAnimation.duration = 10;
    keyFrameAnimation.delegate = self;
    keyFrameAnimation.fillMode = kCAFillModeForwards;
    [greenView.layer addAnimation:keyFrameAnimation forKey:@"keyframeAnimation"];
    CGPathRelease(path);
    


    
//    greenView.transform = CGAffineTransformMakeTranslation(-50, 0);
}

- (void)animationDidStart:(CAAnimation *)anim {
    greenView.frame = CGRectMake(-50, 200, 100, 100);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
