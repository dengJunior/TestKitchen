//
//  KTCDownloader.h
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KTCDownloader : NSObject

+ (void)postWithUrlString:(NSString *)urlString params:(NSDictionary *)params success:(void (^)(NSData *data))successBlock failBlock:(void (^)(NSError *error))failBlock;

@end
