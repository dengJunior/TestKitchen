//
//  NewsModel.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityNewsModel.h"

@implementation CommunityNewsModel

@end

@implementation CommunityNewsDataModel


@end

@implementation CommunityNewsDetailModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"dId",@"description":@"desc"}];
}

@end

@implementation CommunityNewsTopicModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"tId"}];
}


@end

@implementation CommunityNewsCommentModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"cId"}];
}


@end

@implementation CommunityNewsLikeModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"lId"}];
}


@end

