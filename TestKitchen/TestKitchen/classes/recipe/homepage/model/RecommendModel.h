//
//  RecommendModel.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "JSONModel.h"

@class RecommendDataModel;

@protocol RecommendDataBannerModel;
@protocol RecommendDataWidgetListModel;
@protocol RecommendWidgetDataModel;

@interface RecommendModel : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *code;
@property (nonatomic,strong)NSNumber<Optional> *msg;
@property (nonatomic,copy)NSString<Optional> *version;
@property (nonatomic,strong)NSNumber<Optional> *timestamp;
@property (nonatomic,strong)RecommendDataModel<Optional> *data;


@end


@interface RecommendDataModel : JSONModel

@property (nonatomic,strong)NSArray<Optional,RecommendDataBannerModel> *banner;
@property (nonatomic,strong)NSArray<Optional,RecommendDataWidgetListModel> *widgetList;

@end


@interface RecommendDataBannerModel : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *banner_id;
@property (nonatomic,copy)NSString<Optional> *banner_title;
@property (nonatomic,copy)NSString<Optional> *banner_picture;
@property (nonatomic,copy)NSString<Optional> *banner_link;
@property (nonatomic,strong)NSNumber<Optional> *is_link;
@property (nonatomic,strong)NSNumber<Optional> *type_id;
@property (nonatomic,strong)NSNumber<Optional> *refer_key;



@end

@interface RecommendDataWidgetListModel : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *widget_id;
@property (nonatomic,strong)NSNumber<Optional> *widget_type;
@property (nonatomic,copy)NSString<Optional> *title;
@property (nonatomic,copy)NSString<Optional> *title_link;
@property (nonatomic,copy)NSString<Optional> *desc;
@property (nonatomic,strong)NSArray<Optional,RecommendWidgetDataModel> *widget_data;

@end


@interface RecommendWidgetDataModel : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *wId;
@property (nonatomic,copy)NSString<Optional> *type;
@property (nonatomic,copy)NSString<Optional> *content;
@property (nonatomic,copy)NSString<Optional> *link;


@end



