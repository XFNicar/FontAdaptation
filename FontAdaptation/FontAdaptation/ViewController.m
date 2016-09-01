//
//  ViewController.m
//  FontAdaptation
//
//  Created by 谢飞 on 16/9/1.
//  Copyright © 2016年 谢飞. All rights reserved.
//

#import "ViewController.h"
#import "FontAdaptation.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self contentTest];
}

- (void)contentTest {
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/2)];
    myView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:myView];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width- 40, 30)];
    label.backgroundColor = [UIColor purpleColor];
    label.text = @"hello world !";
    label.font = Font(30);
    [myView addSubview: label];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
