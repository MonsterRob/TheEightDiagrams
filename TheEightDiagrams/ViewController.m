//
//  ViewController.m
//  TheEightDiagrams
//
//  Created by 王召洲 on 16/8/7.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "EightView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    EightView *e = [[EightView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:e];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
