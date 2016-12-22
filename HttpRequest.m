//
//  HttpRequest.m
//  ZWYQDJJ
//
//  Created by 李瑞 on 2016/12/22.
//  Copyright © 2016年 李瑞. All rights reserved.
//

#import "HttpRequest.h"
#import "NSDate+Extend.h"

@implementation HttpRequest
static AFHTTPSessionManager *manager ;
+(AFHTTPSessionManager *)manager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 10;
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    return manager;
}


+(void)GET:(NSString *)url parmas:(NSDictionary *)parmas success:(LRResponseSuccess)success fail:(LRResponseFail)fail{
    
    [[HttpRequest manager]GET:url parameters:parmas progress:^(NSProgress * _Nonnull downloadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            fail(error);
        }
    }];
}

+(void)POST:(NSString *)url parmas:(NSDictionary *)parmas success:(LRResponseSuccess)success fail:(LRResponseFail)fail{
    
    [[HttpRequest manager]POST:url parameters:parmas progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            fail(error);
        }
    }];
    
}


+(void)GetRankSuccess:(LRResponseSuccess)success fail:(LRResponseFail)fail{
    NSDate *date = [NSDate date];
    NSDate *date2 = [date ymdDate];
    
    NSDictionary *dic = @{@"rankType":@2,@"rankDay":date2};
    [HttpRequest GET:rankUrl parmas:dic success:^(id responseObject) {
        if (success) {
            success(responseObject);
        }
    } fail:^(NSError *error) {
        if (fail) {
            fail(error);
        }
    }];
}





@end
