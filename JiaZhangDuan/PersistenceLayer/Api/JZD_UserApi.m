//
//  JZD_UserApi.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/16.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_UserApi.h"

@implementation JZD_UserApi
/**
 发送验证码
 
 @param phone 手机号
 */
+ (void)sendMsgCodeWithPhone:(NSString *)phone success:(NoParamsBlock)success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"Phone":phone};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_USER_API_SEND_MSG_CODE option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
        if (GetSuccessInResp(responseObject)) {
            success();
        } else {
            NSError *error;
            failure (error);
        }
    } failure:^(NSError *error) {
        failure (error);
    }];
}

/**
 家长登录
 
 @param account 账号
 @param password 密码
 */
+ (void)parentLoginWithAccount:(NSString *)account password:(NSString *)password success:(void (^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"Account":account, @"Password":password};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_USER_API_PARENT_LOGIN option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
        if (GetSuccessInResp(responseObject)) {
            success(GetDataInResp(responseObject));
        } else {
            NSError *error;
            failure (error);
        }
    } failure:^(NSError *error) {
        failure (error);
    }];
}

/**
 获取学生信息
 
 @param parentId 家长ID
 */
+ (void)parentGetStudentInfoWithParentId:(NSString *)parentId success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"ParentId":parentId};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_USER_API_GET_STUDENT_INFO option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
        if (GetSuccessInResp(responseObject)) {
            success(GetDataInResp(responseObject));
        } else {
            NSError *error;
            failure (error);
        }
    } failure:^(NSError *error) {
        failure (error);
    }];
}

/**
 绑定学生
 
 @param parentId 家长ID
 @param studentId 学生ID
 @param relationship 关系
 */
+ (void)bindingStudentWithParentId:(NSString *)parentId studentId:(NSString *)studentId relationShip:(NSString *)relationship success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"ParentId":parentId};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_USER_API_BIND_STUDENT option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
        if (GetSuccessInResp(responseObject)) {
            success(GetDataInResp(responseObject));
        } else {
            NSError *error;
            failure (error);
        }
    } failure:^(NSError *error) {
        failure (error);
    }];
}
@end
