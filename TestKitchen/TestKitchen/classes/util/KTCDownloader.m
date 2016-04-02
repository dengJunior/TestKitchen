//
//  KTCDownloader.m
//  TestKitchen
//
//  Created by gaokunpeng on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "KTCDownloader.h"

@implementation KTCDownloader

+ (void)postWithUrlString:(NSString *)urlString params:(NSDictionary *)params success:(void (^)(NSData *))successBlock failBlock:(void (^)(NSError *))failBlock
{
    //1.NSURL
    NSURL *url = [NSURL URLWithString:urlString];
    //2.NSURLRequest
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //参数
    NSMutableString *str = [NSMutableString stringWithFormat:@"token=%@&user_id=%@&version=%@",@"",@"",@"4.32"];
    for (int i=0; i<params.allKeys.count; i++) {
        NSString *key = params.allKeys[i];

        [str appendFormat:@"&%@=%@",key, params[key]];
    }
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    request.HTTPBody = data;
    
    //3.NSURLSession
    NSURLSession *session = [NSURLSession sharedSession];
    //4.task
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (error) {
            failBlock(error);
        }else{
            NSHTTPURLResponse *r = (NSHTTPURLResponse *)response;
            if (r.statusCode == 200) {
                successBlock(data);
            }else{
                NSError *aError = [NSError errorWithDomain:@"http://api.izhangchu.com" code:r.statusCode userInfo:@{@"error":@"请求失败"}];
                failBlock(aError);
            }
        }
    }];
    //5.发送请求
    [task resume];
}

@end
