//
//  EightView.m
//  TheEightDiagrams
//
//  Created by 王召洲 on 16/8/7.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "EightView.h"
#define outRadius 200
#define innerRadius 40
#define innerArcRadius outRadius*0.5

@interface EightView ()
@property (strong,nonatomic) NSTimer * controlTimer;
@end
@implementation EightView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.controlTimer = [NSTimer scheduledTimerWithTimeInterval:1/60.0 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
        self.controlTimer.fireDate = [NSDate distantPast];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGPoint center = CGPointMake(rect.size.width*0.5, rect.size.height*0.5);
    
    //static  CGFloat outRadius = 200;// 外圆半径
    //static CGFloat innerRadius = 40;// 内圆半径
     //CGFloat innerArcRadius = outRadius*0.5;// 内弧半径
    // 控制旋转 角度
    static CGFloat angelChange = 0;
    angelChange +=3;
    CGFloat startAngle = -M_PI_2+angelChange*M_PI/180.0;
    CGFloat endAngle = M_PI_2+angelChange*M_PI/180.0;
    
    // 内弧&内圆 圆心点坐标
    CGFloat dx = innerArcRadius * cos(endAngle);
    CGFloat dy = innerArcRadius *sin(endAngle);
    CGPoint innerCenter = CGPointMake(center.x+dx, center.y+dy);
    CGPoint innerCenter2 = CGPointMake(center.x-dx, center.y-dy);
    
    // 外弧1
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:outRadius startAngle:startAngle endAngle:endAngle clockwise:YES];
    // 内弧1.1
    [path1 addArcWithCenter:innerCenter radius:innerArcRadius startAngle:endAngle endAngle:endAngle+M_PI clockwise:YES];
    // 内弧1.2
    [path1 addArcWithCenter:innerCenter2 radius:innerArcRadius startAngle:endAngle endAngle:endAngle+M_PI clockwise:NO];
    
    [[UIColor whiteColor] setFill];
    [path1 fill];
    
    // 内圆1
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 addArcWithCenter:innerCenter radius:innerRadius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [[UIColor blackColor] setFill];
    [path2 fill];

    // 外弧2
    UIBezierPath *path3 = [UIBezierPath bezierPathWithArcCenter:center radius:outRadius startAngle:startAngle endAngle:endAngle clockwise:NO];
    //外弧2.1
    [path3 addArcWithCenter:innerCenter radius:innerArcRadius startAngle:endAngle endAngle:startAngle clockwise:YES];
    
    // 外弧2.2
    
    [path3 addArcWithCenter:innerCenter2 radius:innerArcRadius startAngle:endAngle endAngle:startAngle clockwise:NO];
    [[UIColor blackColor] setFill];
    [path3 fill];
    
    // 内圆2
    UIBezierPath *pathC = [UIBezierPath bezierPathWithArcCenter:innerCenter2 radius:innerRadius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [[UIColor whiteColor] setFill];
    [pathC fill];
}
-(void)dealloc {
    [self.controlTimer invalidate];
    self.controlTimer = nil;
}

@end
