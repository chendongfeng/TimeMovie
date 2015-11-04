//
//  TopViewController.m
//  TimeMovie
//
//  Created by cdf on 15/8/19.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "TopViewController.h"
#import "Movie.h"
#import "TopCell.h"
#import "MovieDetailViewController.h"


@interface TopViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_topData;
}

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Top250";
    
    [self loadData];
}

#pragma mark - 读取数据
-(void)loadData{
    
    _topData = [[NSMutableArray alloc] init];
    
    NSDictionary *dic = [MovieJSON1 readJSONFile:@"top250"];
    for (NSDictionary *dictionary in dic[@"subjects"]) {
        Movie *movie = [[Movie alloc] initWithContentsOfDictionary:dictionary];
        [_topData addObject:movie];
    }
    
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _topData.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
    cell.movie = _topData[indexPath.item];
    
    return cell;
    
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellWidth = (kScreenWidth-40)/3;
    CGFloat cellHeight = cellWidth*1.5;
    return CGSizeMake(cellWidth, cellHeight);
    
}

// 单元格的选中事件
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MovieDetailViewController *detail = [storyBoard instantiateViewControllerWithIdentifier:@"detail"];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
    
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
