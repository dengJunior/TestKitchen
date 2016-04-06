//
//  NewsModel.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "JSONModel.h"


@class CommunityNewsDataModel;
@protocol CommunityNewsDetailModel;
@protocol CommunityNewsTopicModel;
@protocol CommunityNewsCommentModel;
@protocol CommunityNewsLikeModel;
@interface CommunityNewsModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *code;
@property (nonatomic,copy)NSString<Optional> *msg;
@property (nonatomic,strong)NSNumber<Optional> *timestamp;
@property (nonatomic,copy)NSString<Optional> *version;
@property (nonatomic,strong)CommunityNewsDataModel<Optional> *data;


@end


@interface CommunityNewsDataModel : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *page;
@property (nonatomic,strong)NSNumber<Optional> *size;
@property (nonatomic,strong)NSNumber<Optional> *total;
@property (nonatomic,strong)NSNumber<Optional> *count;
@property (nonatomic,strong)NSMutableArray<Optional,CommunityNewsDetailModel> *data;


@end

@interface CommunityNewsDetailModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *user_id;
@property (nonatomic,copy)NSString<Optional> *nick;
@property (nonatomic,copy)NSString<Optional> *head_img;
@property (nonatomic,strong)NSNumber<Optional> *istalent;
@property (nonatomic,copy)NSString<Optional> *dId;
@property (nonatomic,copy)NSString<Optional> *image;
@property (nonatomic,copy)NSString<Optional> *video;
@property (nonatomic,copy)NSString<Optional> *desc;
@property (nonatomic,copy)NSString<Optional> *content;
@property (nonatomic,copy)NSString<Optional> *agree_count;
@property (nonatomic,copy)NSString<Optional> *comment_count;
@property (nonatomic,copy)NSString<Optional> *create_time;
@property (nonatomic,copy)NSNumber<Optional> *belike;
@property (nonatomic,copy)NSNumber<Optional> *create_time_org;
@property (nonatomic,copy)NSString<Optional> *marrow_time;
@property (nonatomic,copy)NSString<Optional> *delete_time;
@property (nonatomic,copy)NSString<Optional> *share_url;
@property (nonatomic,strong)NSArray<Optional, CommunityNewsTopicModel> *topics;
@property (nonatomic,strong)NSArray<Optional, CommunityNewsCommentModel> *comment;
@property (nonatomic,strong)NSArray<Optional, CommunityNewsLikeModel> *like;


@end

@interface CommunityNewsTopicModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *tId;
@property (nonatomic,copy)NSString<Optional> *post_id;
@property (nonatomic,copy)NSString<Optional> *topic_id;
@property (nonatomic,copy)NSString<Optional> *topic_name;
@property (nonatomic,strong)NSNumber<Optional> *locx;
@property (nonatomic,strong)NSNumber<Optional> *locy;
@property (nonatomic,strong)NSNumber<Optional> *width;


@end


@interface CommunityNewsCommentModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *user_id;
@property (nonatomic,copy)NSString<Optional> *nick;
@property (nonatomic,copy)NSString<Optional> *head_img;
@property (nonatomic,strong)NSNumber<Optional> *istalent;
@property (nonatomic,copy)NSString<Optional> *cId;
@property (nonatomic,copy)NSString<Optional> *content;
@property (nonatomic,copy)NSString<Optional> *parent_id;
@property (nonatomic,strong)NSArray<Optional,CommunityNewsCommentModel> *parents;

@end

@interface CommunityNewsLikeModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *user_id;
@property (nonatomic,copy)NSString<Optional> *nick;
@property (nonatomic,copy)NSString<Optional> *head_img;
@property (nonatomic,strong)NSNumber<Optional> *istalent;
@property (nonatomic,copy)NSString<Optional> *lId;



@end


