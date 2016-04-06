//
//  CommunityRecommendModel.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CommunityRecommendModel.h"

@implementation CommunityRecommendModel

@end


@implementation CommunityRecommendDataModel



@end

@implementation CommunityActivityModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"aId",@"description":@"desc"}];
}

@end

@implementation CommunityTalentModel



@end

@implementation CommunityMarrowModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"mId"}];
}

@end


@implementation CommunityTopicModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"tId"}];
}

@end



@implementation CommunityTopicDetailModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"dId",@"description":@"desc"}];
}

@end






