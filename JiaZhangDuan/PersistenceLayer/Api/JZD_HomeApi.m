//
//  JZD_HomeApi.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/17.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeApi.h"

@implementation JZD_HomeApi

/**
 获取通知
 
 @param startRows 开始条数
 @param rows 获取条数
 */
+ (void)getNoticeWithStartRows:(NSNumber *)startRows rows:(NSNumber *)rows success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"StartRows":startRows, @"Rows":rows};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_HOME_API_GET_NOTICE option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
        if (GetSuccessInResp(responseObject)) {
            success([responseObject objectForKey:@"rows"]);
        } else {
            NSError *error;
            failure (error);
        }
    } failure:^(NSError *error) {
        failure (error);
    }];
}

/**
 通知详情
 
 @param noticeId 通知Id
 */
+ (void)getNoticeDetailWithNoticeId:(NSString *)noticeId success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"NoticeId":noticeId};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_HOME_API_DETAIL_NOTICE option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
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
 推荐内容
 
 @param startRows 开始条数
 @param rows 获取条数
 */
+ (void)getArticleWithStartRows:(NSNumber *)startRows rows:(NSNumber *)rows success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"StartRows":startRows, @"Rows":rows};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_HOME_API_GET_ARTICLE option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
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
 推荐详情
 
 @param articleId Id
 */
+ (void)findArticleDetailWithArticleId:(NSString *)articleId success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"ArticleId":articleId};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_HOME_API_GET_ARTICLE_DETAIL option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
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
 轮播图
 
 */
+ (void)getBannerSuccess:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_HOME_API_GET_BANNER option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:nil success:^(id responseObject) {
        if (GetSuccessInResp(responseObject)) {
            success([responseObject objectForKey:@"rows"]);
        } else {
            NSError *error;
            failure (error);
        }
    } failure:^(NSError *error) {
        failure (error);
    }];
}

/**
 获取学科信息
 
 */
+ (void)getSubjectSuccess:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_HOME_API_GET_SUBJECT option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:nil success:^(id responseObject) {
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
 选课获取期段
 
 */
+ (void)getCourseTimeIntervalSuccess:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_HOME_API_GET_COURSETIMEINTERVAL option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:nil success:^(id responseObject) {
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
 选课获取班级
 
 @param startRows 开始条数
 @param rows 获取条数
 @param schoolId 校区ID
 @param courseTimeInterval 期段ID
 @param subjectId 学科ID
 */
+ (void)getClassBySubjectWithStartRows:(NSNumber *)startRows rows:(NSNumber *)rows schoolId:(NSString *)schoolId courseTimeInterval:(NSString *)courseTimeInterval subjectId:(NSString *)subjectId Success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"StartRows":startRows, @"Rows":rows, @"SchoolId":schoolId, @"CourseTimeInterval":courseTimeInterval, @"SubjectId":subjectId};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_HOME_API_GET_CLASSBYSUBJECT option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
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
 班级详情
 
 @param classId 班级Id
 */
+ (void)findClassDetailWithClassId:(NSString *)classId success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"ClassId":classId};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_HOME_API_FIND_CLASSDETAIL option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
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
 获取课程评价
 
 @param courseId 课程Id
 @param rows 获取条数
 @param startRows 开始条数
 */
+ (void)getCourseEvaluateWithStartRows:(NSString *)startRows rows:(NSString *)rows courseId:(NSString *)courseId success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure {
    NSDictionary *dict = @{@"StartRows":startRows, @"Rows":rows, @"CourseId":courseId};
    [[FWEB_NetWorkHelper networkHelper] callApi:JZD_HOME_API_GET_COURSEEVALUATE option:NetworkHelperOptionPOST type:NetworkHelperRequestTypeNormal headers:nil body:nil parameters:dict success:^(id responseObject) {
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
