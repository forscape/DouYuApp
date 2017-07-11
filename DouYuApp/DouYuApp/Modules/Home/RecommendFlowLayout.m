//
//  RecommendFlowLayout.m
//  DouYuApp
//
//  Created by 田冬雪 on 2017/7/11.
//  Copyright © 2017年 ethan. All rights reserved.
//

#import "RecommendFlowLayout.h"

@implementation RecommendFlowLayout

- (instancetype)init {
    if (!(self = [super init])) return nil;

    self.itemSize = CGSizeMake(145, 145);
    self.minimumInteritemSpacing = 10;
    self.minimumLineSpacing = 10;
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);

    return self;
}
@end
