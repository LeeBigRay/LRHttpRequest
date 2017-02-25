//
//  HttpRequest.h
//  ZWYQDJJ
//
//  Created by 李瑞 on 2016/12/22.
//  Copyright © 2016年 李瑞. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LRResponseSuccess)(id responseObject);

typedef void(^LRResponseFail)(NSError *error);
////////

@interface HttpRequest : NSObject

//GET

+(void)GET:(NSString *)url parmas:(NSDictionary *)parmas success:(LRResponseSuccess)success fail:(LRResponseFail)fail;

// POST
+(void)POST:(NSString *)url parmas:(NSDictionary *)parmas success:(LRResponseSuccess)success fail:(LRResponseFail)fail;


//获取排行榜
+(void)GetRankSuccess:(LRResponseSuccess)success fail:(LRResponseFail)fail;

@end
