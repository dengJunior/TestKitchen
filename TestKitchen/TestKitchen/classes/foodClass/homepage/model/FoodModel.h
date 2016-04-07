//
//  FoodModel.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "JSONModel.h"

@protocol FoodTopModel;
@protocol FoodDataDetailModel;
@class FoodDataModel;

@interface FoodModel : JSONModel

@property (nonatomic, copy)NSString<Optional> *code;
@property (nonatomic, copy)NSString<Optional> *msg;
@property (nonatomic, copy)NSString<Optional> *version;
@property (nonatomic, strong)NSNumber<Optional> *timestamp;
@property (nonatomic, strong)FoodDataModel<Optional> *data;


@end


@interface FoodDataModel : JSONModel

@property (nonatomic, copy)NSString<Optional> *page;
@property (nonatomic, copy)NSString<Optional> *size;
@property (nonatomic, copy)NSString<Optional> *total;
@property (nonatomic, copy)NSString<Optional> *count;
@property (nonatomic, strong)NSArray<Optional, FoodTopModel> *top;
@property (nonatomic, strong)NSMutableArray<Optional, FoodDataDetailModel> *data;


@end


@interface FoodTopModel : JSONModel

@property (nonatomic, copy)NSString<Optional> *banner_id;
@property (nonatomic, copy)NSString<Optional> *banner_title;
@property (nonatomic, copy)NSString<Optional> *banner_picture;
@property (nonatomic, copy)NSString<Optional> *banner_link;
@property (nonatomic, copy)NSString<Optional> *is_link;
@property (nonatomic, copy)NSString<Optional> *refer_key;
@property (nonatomic, copy)NSString<Optional> *type_id;


@end


@interface FoodDataDetailModel : JSONModel

@property (nonatomic, strong)NSString<Optional> *series_id;
@property (nonatomic, copy)NSString<Optional> *series_name;
@property (nonatomic, copy)NSString<Optional> *image;
@property (nonatomic, strong)NSString<Optional> *episode_sum;
@property (nonatomic, copy)NSString<Optional> *tag;
@property (nonatomic, strong)NSString<Optional> *episode;
@property (nonatomic, strong)NSString<Optional> *play;


@end

