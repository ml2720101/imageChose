//
//  UploadtTool.h
//  CXLPhotoDemo
//
//  Created by 郭志远 on 15/10/15.
//  Copyright © 2015年 cuixinle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadtTool : NSObject

+(void)upDataWithUrl:(NSURL *)url paras:(NSDictionary *)params contentType:(NSString *)contentType success:(void(^)(id response))success failure:(void(^)(NSError *error))failure;

+(void)upDataWithData:(NSData *)imageData paras:(NSDictionary *)params contentType:(NSString *)contentType success:(void(^)(id response))success failure:(void(^)(NSError *error))failure;

+(NSString *)getFileContentType:(NSString *)file;
@end
