//
//  ViewController.m
//  MCButtonDemo
//
//  Created by chh on 2018/1/2.
//  Copyright © 2018年 chh. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+MCLayout.h"
#import <Masonry/Masonry.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 50, 120, 40);
    [btn setImage:[UIImage imageNamed:@"tab_me"] forState:UIControlStateNormal];
    [btn setTitle:@"默认样式" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    
    UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn0.frame = CGRectMake(250, 50, 120, 40);
    [btn0 setImage:[UIImage imageNamed:@"tab_me"] forState:UIControlStateNormal];
    [btn0 setTitle:@"右图左字" forState:UIControlStateNormal];
    [btn0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn0.backgroundColor = [UIColor grayColor];
    [btn0 layoutWithStatus:MCLayoutStatusImageRight andMargin:0];
    [self.view addSubview:btn0];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(50, 120, 80, 60);
    [btn1 setImage:[UIImage imageNamed:@"tab_me"] forState:UIControlStateNormal];
    [btn1 setTitle:@"上图下字" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 layoutWithStatus:MCLayoutStatusImageTop andMargin:4];
    [self.view addSubview:btn1];

    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(50, 200, 80, 60);
    [btn3 setImage:[UIImage imageNamed:@"tab_me"] forState:UIControlStateNormal];
    [btn3 setTitle:@"下图上字" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor greenColor];
    [btn3 layoutWithStatus:MCLayoutStatusImageBottom andMargin:6];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] init];
    [btn4 setImage:[UIImage imageNamed:@"tab_me"] forState:UIControlStateNormal];
    [btn4 setTitle:@"首页" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn4.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn4];
    [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(60);
        make.left.offset(50);
        make.top.mas_equalTo(btn3.mas_bottom).offset(20);
    }];
    [btn4 layoutWithStatus:MCLayoutStatusImageBottom andMargin:3];
    
}

- (void)buttonAction:(UIButton *)button{
    NSLog(@"click");
}
@end
