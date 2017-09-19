//
//  ViewController.m
//  HYButton
//
//  Created by  huiyuan on 2017/9/19.
//  Copyright © 2017年 张宇超. All rights reserved.
//
// 主屏幕高
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
// 主屏幕宽
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,weak) UIView *bottomView;//选择控制器底部状态显示视图

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:@"4",@"5",@"5", nil];
    [array1 arrayByAddingObjectsFromArray:array2];
    NSLog(@"%@",array1);
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    for (NSInteger i = 0; i < array.count; i++) {
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*Main_Screen_Width/array.count, 100, Main_Screen_Width/array.count, 38);
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        btn.tag = 100 + i;
        btn.showsTouchWhenHighlighted = YES;
        [btn addTarget:self action:@selector(onClickSegmentBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        //未选中状态
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        //选中状态
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        
        [self.view addSubview:btn];
    }
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor blueColor];
    view.frame = CGRectMake(0, 138, Main_Screen_Width/array.count, 2);
    [self.view addSubview:view];
    self.bottomView = view;
}
- (void)onClickSegmentBtn:(UIButton *)sender
{
    for (UIView * view in self.view.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton * btn = (UIButton *)view;
            btn.selected = NO;
        }
    }
    
    sender.selected = !sender.isSelected;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect tmpRect = CGRectMake(sender.frame.origin.x, self.bottomView.frame.origin.y, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
        self.bottomView.frame = tmpRect;
    }];
    
    if (sender.tag == 100) {
    }else if (sender.tag == 101){
    }else if (sender.tag == 102){
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
