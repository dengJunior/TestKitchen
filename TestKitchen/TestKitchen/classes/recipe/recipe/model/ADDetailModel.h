//
//  ADDetailModel.h
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "JSONModel.h"

@class ADDetailDataModel;
@protocol ADDetailDataCourseModel;
@interface ADDetailModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *code;
@property (nonatomic,copy)NSString<Optional> *msg;
@property (nonatomic,copy)NSString<Optional> *version;
@property (nonatomic,strong)NSNumber<Optional> *timestamp;
@property (nonatomic,strong)ADDetailDataModel *data;


@end

@interface ADDetailDataModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *series_id;
@property (nonatomic,copy)NSString<Optional> *series_name;
@property (nonatomic,copy)NSString<Optional> *series_title;

@property (nonatomic,copy)NSString<Optional> *create_time;
@property (nonatomic,copy)NSString<Optional> *last_update;
@property (nonatomic,copy)NSString<Optional> *order_no;

@property (nonatomic,copy)NSString<Optional> *tag;
@property (nonatomic,strong)NSNumber<Optional> *episode;
@property (nonatomic,copy)NSString<Optional> *series_image;

@property (nonatomic,copy)NSString<Optional> *share_title;
@property (nonatomic,copy)NSString<Optional> *share_description;
@property (nonatomic,copy)NSString<Optional> *share_image;

@property (nonatomic,strong)NSArray<Optional,ADDetailDataCourseModel> *data;
@property (nonatomic,strong)NSNumber<Optional> *play;
@property (nonatomic,copy)NSString<Optional> *share_url;

@end

@interface ADDetailDataCourseModel : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *course_id;
@property (nonatomic,copy)NSString<Optional> *course_video;
@property (nonatomic,strong)NSNumber<Optional> *episode;

@property (nonatomic,copy)NSString<Optional> *course_name;
@property (nonatomic,copy)NSString<Optional> *course_subject;
@property (nonatomic,copy)NSString<Optional> *course_image;

@property (nonatomic,copy)NSString<Optional> *ischarge;
@property (nonatomic,copy)NSString<Optional> *price;
@property (nonatomic,strong)NSNumber<Optional> *is_collect;

@end
