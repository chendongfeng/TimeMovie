//
//  BaseViewController.m
//  TimeMovie
//
//  Created by cdf on 15/8/20.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTabBarController.h"

@interface BaseViewController ()
{
    UILabel *_titleLabel;
    BOOL _isHiddenTabBar;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _titleLabel.text = @"title";
    
    self.navigationItem.titleView = _titleLabel;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    
    
    
    
}



#pragma mark - 标签栏的隐藏和显示
-(void)viewWillAppear:(BOOL)animated
{
    if (_isHiddenTabBar)
    {
        BaseTabBarController *tab = (BaseTabBarController *)self.tabBarController;
        [tab setTabBarHidden:YES];
    }
    else
    {
        BaseTabBarController *tab = (BaseTabBarController *)self.tabBarController;
        [tab setTabBarHidden:NO];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    BaseTabBarController *tab = (BaseTabBarController *)self.tabBarController;
    [tab setTabBarHidden:NO];
}
- (void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
{
    _isHiddenTabBar = hidesBottomBarWhenPushed;
}


- (void)setTitle:(NSString *)title
{
    // _title 是一个 @package 修饰的属性 所以不能直接修改
    // _title = title;
    // 所以需要使用父类中的setTitle方法来修改_title
    [super setTitle:title];
    _titleLabel.text = title;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
