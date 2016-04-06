//
//  CommunityRecommendModel.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "JSONModel.h"

@class CommunityRecommendDataModel;

@protocol CommunityActivityModel;
@protocol CommunityTalentModel;
@protocol CommunityMarrowModel;
@protocol CommunityTopicModel;
@protocol CommunityTopicDetailModel;
@interface CommunityRecommendModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *code;
@property (nonatomic,copy)NSString<Optional> *msg;
@property (nonatomic,copy)NSString<Optional> *version;
@property (nonatomic,strong)NSNumber<Optional> *timestamp;
@property (nonatomic,strong)CommunityRecommendDataModel<Optional> *data;


@end

@interface CommunityRecommendDataModel : JSONModel

@property (nonatomic,strong)NSArray<Optional, CommunityActivityModel> *activity;

@property (nonatomic,strong)NSArray<Optional, CommunityTalentModel> *shequ_talent;

@property (nonatomic,strong)NSArray<Optional, CommunityMarrowModel> *shequ_marrow;

@property (nonatomic,strong)NSArray<Optional ,CommunityTopicModel> *shequ_topics;



@end


@interface CommunityActivityModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *aId;
@property (nonatomic,copy)NSString<Optional> *title;
@property (nonatomic,copy)NSString<Optional> *desc;
@property (nonatomic,copy)NSString<Optional> *image;
@property (nonatomic,strong)NSNumber<Optional> *active_time;
@property (nonatomic,strong)NSNumber<Optional> *end_time;
@property (nonatomic,strong)NSNumber<Optional> *create_time;
@property (nonatomic,strong)NSNumber<Optional> *active_time_left;
@property (nonatomic,strong)NSNumber<Optional> *end_time_left;
@property (nonatomic,strong)NSNumber<Optional> *user_count;
@property (nonatomic,copy)NSString<Optional> *link;
@property (nonatomic,strong)NSNumber<Optional> *is_login;
@property (nonatomic,strong)NSNumber<Optional> *hide_header;


@end


@interface CommunityTalentModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *user_id;
@property (nonatomic,copy)NSString<Optional> *nick;
@property (nonatomic,copy)NSString<Optional> *head_img;
@property (nonatomic,strong)NSNumber<Optional> *tongji_be_follow;
@property (nonatomic,strong)NSNumber<Optional> *istalent;
@property (nonatomic,strong)NSNumber<Optional> *be_follow;


@end


@interface CommunityMarrowModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *mId;
@property (nonatomic,copy)NSString<Optional> *desc;
@property (nonatomic,copy)NSString<Optional> *content;
@property (nonatomic,copy)NSString<Optional> *video;
@property (nonatomic,copy)NSString<Optional> *image;

@end


@interface CommunityTopicModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *tId;
@property (nonatomic,copy)NSString<Optional> *topic_name;
@property (nonatomic,strong)NSArray<Optional, CommunityTopicDetailModel> *data;


@end


@interface CommunityTopicDetailModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *dId;
@property (nonatomic,copy)NSString<Optional> *create_time;
@property (nonatomic,copy)NSString<Optional> *user_id;
@property (nonatomic,copy)NSString<Optional> *image;
@property (nonatomic,copy)NSString<Optional> *video;
@property (nonatomic,copy)NSString<Optional> *desc;
@property (nonatomic,copy)NSString<Optional> *content;
@property (nonatomic,copy)NSString<Optional> *agree_count;
@property (nonatomic,copy)NSString<Optional> *comment_count;
@property (nonatomic,copy)NSString<Optional> *marrow_time;
@property (nonatomic,copy)NSString<Optional> *delete_time;


@end






