//
//  BaseTabBarController.m
//  TimeMovie
//
//  Created by cdf on 15/8/20.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "BaseTabBarController.h"
#import "TabBarButton.h"

//#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface BaseTabBarController ()

{
    UIView *_newTabBar;
    UIImageView *_selectView;
}

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTabBar];
    
    
}

-(void)setTabBarHidden:(BOOL)isHidden{
    _newTabBar.hidden = isHidden;
}

-(void)createTabBar{
    self.tabBar.hidden = YES;
    
    _newTabBar = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-49, kScreenWidth, 49)];
    _newTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bg_all"]];
    [self.view addSubview:_newTabBar];
    
    
    //创建按钮
    CGFloat buttonWidth = kScreenWidth/self.viewControllers.count;
    
    // 创建选中框
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, 49)];
    _selectView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [_newTabBar addSubview:_selectView];
    
    
    NSArray *titles = @[@"电影",
                        @"新闻",
                        @"Top",
                        @"影院",
                        @"更多"];
    NSArray *imageNames = @[@"movie_cinema",
                            @"msg_new",
                            @"start_top250",
                            @"icon_cinema",
                            @"more_setting"];
    
    for (int i=0; i<self.viewControllers.count; i++) {
        TabBarButton *button = [[TabBarButton alloc] initWithTitle:titles[i] imageName:imageNames[i] frame:CGRectMake(i*buttonWidth, 0, buttonWidth, 49)];
        
        button.tag = i;
        //添加点击事件
        [button addTarget:self
                   action:@selector(tabBarButtonAction:)
         forControlEvents:UIControlEventTouchUpInside];
        
        [_newTabBar addSubview:button];
        
    }
    
}

-(void)tabBarButtonAction:(TabBarButton *)button{
    
    NSInteger tag = button.tag;
    
    // 根据按钮的tag 来切换显示的页面
    self.selectedIndex = tag;
    
    //选中框移动
    [UIView animateWithDuration:0.2 animations:^{
        _selectView.center = button.center;
    }];
    
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
