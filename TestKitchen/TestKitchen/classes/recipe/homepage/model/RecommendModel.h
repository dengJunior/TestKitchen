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

@property (nonatomic,strong)NSNumber<Optional> *bannerId;
@property (nonatomic,copy)NSString<Optional> *bannerTitle;
@property (nonatomic,copy)NSString<Optional> *bannerPicture;
@property (nonatomic,copy)NSString<Optional> *bannerLink;
@property (nonatomic,strong)NSNumber<Optional> *isLink;
@property (nonatomic,strong)NSNumber<Optional> *typeId;
@property (nonatomic,strong)NSNumber<Optional> *referKey;



@end

@interface RecommendDataWidgetListModel : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *widgetId;
@property (nonatomic,strong)NSNumber<Optional> *widgetType;
@property (nonatomic,copy)NSString<Optional> *title;
@property (nonatomic,copy)NSString<Optional> *titleLink;
@property (nonatomic,copy)NSString<Optional> *desc;
@property (nonatomic,strong)NSArray<Optional,RecommendWidgetDataModel> *widgetData;

@end


@interface RecommendWidgetDataModel : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *wId;
@property (nonatomic,copy)NSString<Optional> *type;
@property (nonatomic,copy)NSString<Optional> *content;
@property (nonatomic,copy)NSString<Optional> *link;


@end



