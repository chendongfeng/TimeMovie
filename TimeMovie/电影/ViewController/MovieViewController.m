//
//  MovieViewController.m
//  TimeMovie
//
//  Created by cdf on 15/8/19.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "starView.h"

@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton *_rightButton;
    
    //中间视图
    UITableView *_listView;
    UIView *_postView;
    //数据存储
    NSMutableArray *_movieData;
    
}
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"电影";
    //获取数据
    [self loadData];
    //右上角按钮
    [self createRightButton];
    //中间视图
    [self createViews];
    

}

#pragma mark - 读取数据
-(void)loadData{
    
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
    
    //读取文件
    NSData *data = [NSData dataWithContentsOfFile:path];
    //文件解析
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
                                                        options:NSJSONReadingMutableLeaves error:nil];
    
//    NSLog(@"%@",dic);
    //数据处理和存储
    NSArray *subjects = dic[@"subjects"];
    
    _movieData = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in subjects) {
        Movie *movie = [Movie movieWithContentsOfDictionary:dictionary];
        [_movieData addObject:movie];
        
    }
    
    
    
}



-(void)createViews{
    
    _listView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _listView.delegate = self;
    _listView.dataSource = self;
    [self.view addSubview:_listView];
    _listView.backgroundColor = [UIColor redColor];
    
    //创建海报视图
    _postView = [[UIView alloc] initWithFrame:self.view.bounds];
    _postView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_postView];
    _postView.hidden = YES;
    
    
}


-(void)createRightButton{
    
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(0, 0, 49, 25);
    [_rightButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [_rightButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateSelected];
    [_rightButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [_rightButton addTarget:self
                     action:@selector(rightButtonAction:)
           forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    
}

-(void)rightButtonAction:(UIButton *)button{
    
    
    UIViewAnimationOptions option = button.selected?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    
    
    [self filpView:_rightButton options:option];
    [self filpView:self.view options:option];
    _rightButton.selected = !_rightButton.selected;
    _listView.hidden = !_listView.hidden;
    _postView.hidden = !_postView.hidden;
    
    
}

-(void)filpView:(UIView *)view options:(UIViewAnimationOptions)options
{
    [UIView transitionWithView:view
                      duration:0.4
                       options:options
                    animations:^{
                    }
                    completion:nil];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 从闲置池中获取cell
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:nil options:nil] lastObject];
        
    }
    
    cell.movie = _movieData[indexPath.row];
    
    
    return cell;

}

//设置高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
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
