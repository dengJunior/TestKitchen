//
//  ADCommentModel.h
//  TestKitchen_1524
//
//  Created by gaokunpeng on 16/3/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "JSONModel.h"

@class ADCommentDataModel;
@protocol ADCommentDataDetailModel;
@interface ADCommentModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *code;
@property (nonatomic,copy)NSString<Optional> *msg;
@property (nonatomic,copy)NSString<Optional> *version;
@property (nonatomic,strong)NSNumber<Optional> *timestamp;
@property (nonatomic,strong)ADCommentDataModel<Optional> *data;

@end

@interface ADCommentDataModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *page;
@property (nonatomic,copy)NSString<Optional> *size;
@property (nonatomic,copy)NSString<Optional> *total;
@property (nonatomic,copy)NSString<Optional> *count;
@property (nonatomic,strong)NSMutableArray<Optional,ADCommentDataDetailModel> *data;

@end


@interface ADCommentDataDetailModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *dId;
@property (nonatomic,copy)NSString<Optional> *user_id;
@property (nonatomic,copy)NSString<Optional> *type;

@property (nonatomic,copy)NSString<Optional> *relate_id;
@property (nonatomic,copy)NSString<Optional> *content;
@property (nonatomic,copy)NSString<Optional> *create_time;

@property (nonatomic,copy)NSString<Optional> *parent_id;
@property (nonatomic,copy)NSString<Optional> *nick;
@property (nonatomic,copy)NSString<Optional> *head_img;

@property (nonatomic,strong)NSArray<Optional,ADCommentDataDetailModel> *parents;
@property (nonatomic,strong)NSNumber<Optional> *istalent;

@end
