//
//  DYTabBarController.m
//  DouYuApp
//
//  Created by ethan on 17/6/12.
//  Copyright © 2017年 ethan. All rights reserved.
//

#import "DYTabBarController.h"
#import "FontAndColorMacros.h"
#import "HomeViewController.h"
#import "LiveViewController.h"
#import "FocusViewController.h"
#import "DiscoveryViewController.h"
#import "MineViewController.h"

@interface DYTabBarController ()

@end

@implementation DYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewControllers];
}

- (void)addChildViewControllers {
    
    UINavigationController *nav = nil;
    
    HomeViewController *home = [[HomeViewController alloc] init];
    nav = [[UINavigationController alloc] initWithRootViewController:home];
    [self addChildViewController:nav];
    [self addTabBarItem:nav imgName:@"tabHome" selectedImgName:@"tabHomeHL" title:@"首页"];
    
    LiveViewController *live = [[LiveViewController alloc] init];
    nav = [[UINavigationController alloc] initWithRootViewController:live];
    [self addChildViewController:nav];
    [self addTabBarItem:nav imgName:@"tabLiving" selectedImgName:@"tabLivingHL" title:@"直播"];
    
    FocusViewController *focus = [[FocusViewController alloc] init];
    nav = [[UINavigationController alloc] initWithRootViewController:focus];
    [self addChildViewController:nav];
    [self addTabBarItem:nav imgName:@"tabFocus" selectedImgName:@"tabFocusHL" title:@"关注"];
    
    DiscoveryViewController *discovery = [[DiscoveryViewController alloc] init];
    nav = [[UINavigationController alloc] initWithRootViewController:discovery];
    [self addChildViewController:nav];
    [self addTabBarItem:nav imgName:@"tabDiscovery" selectedImgName:@"tabDiscoveryHL" title:@"发现"];
    
    MineViewController *mine = [[MineViewController alloc] init];
    nav = [[UINavigationController alloc] initWithRootViewController:mine];
    [self addChildViewController:nav];
    [self addTabBarItem:nav imgName:@"tabMine" selectedImgName:@"tabMineHL" title:@"我的"];
    
}

- (void)addTabBarItem:(UINavigationController *)topController imgName:(NSString *)imgName selectedImgName:(NSString *)selectedImgName title:(NSString*)title
{
    
    topController.tabBarItem.title = title;
    topController.tabBarItem.image = [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    topController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [topController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];

    NSDictionary *attrNor = [NSDictionary dictionaryWithObjectsAndKeys:GFM_Bar_Normal,NSForegroundColorAttributeName, nil];
    [topController.tabBarItem setTitleTextAttributes:attrNor forState:UIControlStateNormal];
    
    NSDictionary *attrSelected = [NSDictionary dictionaryWithObjectsAndKeys:GFM_Global_Color,NSForegroundColorAttributeName, nil];
    [topController.tabBarItem setTitleTextAttributes:attrSelected forState:UIControlStateSelected];
}

@end
