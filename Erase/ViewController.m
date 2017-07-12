//
//  ViewController.m
//  Erase
//
//  Created by 聂康  on 2017/7/12.
//  Copyright © 2017年 com.nk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageView addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)panGes {
    
    CGPoint location = [panGes locationInView:self.imageView];
    // 擦除范围(正方形)
    CGFloat wh = 30;
    CGFloat x = location.x - wh * 0.5;
    CGFloat y = location.y - wh * 0.5;
    CGRect rect = CGRectMake(x, y, wh, wh);
    
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(_imageView.bounds.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //渲染
    [_imageView.layer renderInContext:ctx];
    
    CGContextClearRect(ctx, rect);
    
    _imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
}


@end
