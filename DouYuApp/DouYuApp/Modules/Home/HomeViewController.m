//
//  HomeViewController.m
//  DouYuApp
//
//  Created by ethan on 17/6/12.
//  Copyright © 2017年 ethan. All rights reserved.
//

#import "HomeViewController.h"
#import "WJItemsControlView.h"
#import "RecommendViewController.h"

@interface HomeViewController () <UIScrollViewDelegate>
{
    WJItemsControlView *_itemControlView;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavigationController];

    float widht = [UIScreen mainScreen].bounds.size.width;
    float heith = [UIScreen mainScreen].bounds.size.height;

    NSArray *array = @[@"推荐",@"手游",@"娱乐",@"游戏",@"趣玩"];


    //4页内容的scrollView
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, widht, heith-100)];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    scroll.contentSize = CGSizeMake(widht*array.count, 100);

    for (int i=0; i<array.count; i++) {

//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(widht*i, 0-64, widht, heith-100)];
//        label.text = array[i];
//        label.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
//        label.textAlignment = NSTextAlignmentCenter;
//        [scroll addSubview:label];
        RecommendViewController *recomendVC = [[RecommendViewController alloc] init];
        [scroll addSubview:recomendVC.view];
    }
    [self.view addSubview:scroll];




    //头部控制的segMent
    WJItemsConfig *config = [[WJItemsConfig alloc]init];
    config.itemWidth = widht/5.0;

    _itemControlView = [[WJItemsControlView alloc]initWithFrame:CGRectMake(0, 100-44, widht, 44)];
    _itemControlView.tapAnimation = YES;
    _itemControlView.config = config;
    _itemControlView.titleArray = array;

    __weak typeof (scroll)weakScrollView = scroll;
    [_itemControlView setTapItemWithIndex:^(NSInteger index,BOOL animation){


        [weakScrollView scrollRectToVisible:CGRectMake(index*weakScrollView.frame.size.width, 0.0, weakScrollView.frame.size.width,weakScrollView.frame.size.height) animated:animation];

    }];
    [self.view addSubview:_itemControlView];

//    UIButton *btn = [[UIButton alloc] init];
//    [btn setImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
//    [btn sizeToFit];
//    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNavigationController {
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
    [btn sizeToFit];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

    UIButton *btn1 = [[UIButton alloc] init];
    [btn1 setImage:[UIImage imageNamed:@"image_my_history"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"image_my_history_click"] forState:UIControlStateHighlighted];
    [btn1 setFrame:CGRectMake(0, 0, 40, 40)];
    UIBarButtonItem *leftBarButtonItem1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];

    

    UIButton *btn2 = [[UIButton alloc] init];
    [btn2 setImage:[UIImage imageNamed:@"btn_search"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"btn_search_click"] forState:UIControlStateHighlighted];
    [btn2 setFrame:CGRectMake(0, 0, 40, 40)];
    UIBarButtonItem *leftBarButtonItem2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];

    UIButton *btn3 = [[UIButton alloc] init];
    [btn3 setImage:[UIImage imageNamed:@"image_scan"] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"image_scan_click"] forState:UIControlStateHighlighted];
    [btn3 setFrame:CGRectMake(0, 0, 40, 40)];
    UIBarButtonItem *leftBarButtonItem3 = [[UIBarButtonItem alloc] initWithCustomView:btn3];



//    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn1];
//    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:leftBarButtonItem1, leftBarButtonItem2, leftBarButtonItem3, nil];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView moveToIndex:offset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView endMoveToIndex:offset];

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
