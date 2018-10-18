//
//  JZD_UserApi.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/16.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "FWEB_BasicApi.h"

@interface JZD_UserApi : FWEB_BasicApi
/**
 发送验证码
 
 @param phone 手机号
 */
+ (void)sendMsgCodeWithPhone:(NSString *)phone success:(NoParamsBlock)success failure:(NormalFailureBlock)failure;

/**
 家长登录
 
 @param account 账号
 @param password 密码
 */
+ (void)parentLoginWithAccount:(NSString *)account password:(NSString *)password success:(void (^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 获取学生信息
 
 @param parentId 家长ID
 */
+ (void)parentGetStudentInfoWithParentId:(NSString *)parentId success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 绑定学生
 
 @param parentId 家长ID
 @param studentId 学生ID
 @param relationship 关系
 */
+ (void)bindingStudentWithParentId:(NSString *)parentId studentId:(NSString *)studentId relationShip:(NSString *)relationship success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;
@end
