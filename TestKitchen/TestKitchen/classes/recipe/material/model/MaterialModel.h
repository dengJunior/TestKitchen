//
//  MaterialModel.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "JSONModel.h"

@class MaterialDataModel;

@protocol MaterialTypeModel;
@protocol MaterialSubtypeModel;
@interface MaterialModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *code;
@property (nonatomic,copy)NSString<Optional> *msg;
@property (nonatomic,copy)NSString<Optional> *version;
@property (nonatomic,strong)NSNumber<Optional> *timestamp;
@property (nonatomic,strong)MaterialDataModel<Optional> *data;



@end


@interface MaterialDataModel : JSONModel

@property (nonatomic,strong)NSNumber<Optional> *dId;
@property (nonatomic,copy)NSString<Optional> *text;
@property (nonatomic,copy)NSString<Optional> *name;
@property (nonatomic,strong)NSArray<Optional, MaterialTypeModel> *data;



@end

@interface MaterialTypeModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *tId;
@property (nonatomic,copy)NSString<Optional> *text;
@property (nonatomic,copy)NSString<Optional> *image;
@property (nonatomic,strong)NSArray<Optional, MaterialSubtypeModel> *data;

@end


@interface MaterialSubtypeModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *sId;
@property (nonatomic,copy)NSString<Optional> *text;
@property (nonatomic,copy)NSString<Optional> *image;

@end
