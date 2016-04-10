//
//  ADCommentModel.m
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ADCommentModel.h"

@implementation ADCommentModel

@end

@implementation ADCommentDataModel


@end

@implementation ADCommentDataDetailModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"dId"}];
}

@end
