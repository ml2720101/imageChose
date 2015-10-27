//
//  UploadtTool.m
//  CXLPhotoDemo
//
//  Created by 郭志远 on 15/10/15.
//  Copyright © 2015年 cuixinle. All rights reserved.
//

#import "UploadtTool.h"
#import <AFNetworking/AFNetworking.h>
@implementation UploadtTool

+(void)upDataWithUrl:(NSURL *)url paras:(NSDictionary *)params contentType:(NSString *)contentType success:(void(^)(id response))success failure:(void(^)(NSError *error))failure{

    
    
    [[AFHTTPRequestOperationManager manager] POST:@"服务器地址" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
     
        [formData appendPartWithFileURL:url name:@"服务器key值" fileName:@"保存时的名字" mimeType:contentType error:NULL];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        if(success){
        
            success(responseObject);
        }
        
        NSLog(@"%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(error);
        }
    
    }];





}



+(void)upDataWithData:(NSData *)imageData paras:(NSDictionary *)params contentType:(NSString *)contentType success:(void(^)(id response))success failure:(void(^)(NSError *error))failure{

    
    [[AFHTTPRequestOperationManager manager] POST:@"服务器地址" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:imageData  name:@"服务器key值" fileName:@"保存时的名字" mimeType:contentType];
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        if(success){
            
            success(responseObject);
        }
        
        NSLog(@"%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];



}



//
//+(NSString *)getFileContentType:(NSString *)file
//{
//    
//    // 需要获得上传文件的类型. 发送一个网络请求,来获得文件类型.
//    // 访问本地的文件
//    // 百分号转义,出现特殊字符之后,需要添加百分号转义.
//    file = [file stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//
//    NSURL *url = [NSURL URLWithString:file];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    // 定义一个接收服务器响应的区域.
//    NSURLResponse *response = nil;
//    // 发送一个同步请求.
//    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
//    
//    // response.MIMEType 文件类型
//    NSLog(@"文件类型: %@",response.MIMEType);
//    
//    return response.MIMEType;
//}
//

@end
