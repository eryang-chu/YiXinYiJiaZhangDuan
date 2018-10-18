//
//  JZD_HomeApi.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/17.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "FWEB_BasicApi.h"

@interface JZD_HomeApi : FWEB_BasicApi
/**
 获取通知
 
 @param startRows 开始条数
 @param rows 获取条数
 */
+ (void)getNoticeWithStartRows:(NSNumber *)startRows rows:(NSNumber *)rows success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 通知详情
 
 @param noticeId 通知Id
 */
+ (void)getNoticeDetailWithNoticeId:(NSString *)noticeId success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 推荐内容
 
 @param startRows 开始条数
 @param rows 获取条数
 */
+ (void)getArticleWithStartRows:(NSNumber *)startRows rows:(NSNumber *)rows success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 推荐详情
 
 @param articleId Id
 */
+ (void)findArticleDetailWithArticleId:(NSString *)articleId success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 轮播图
 
 */
+ (void)getBannerSuccess:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 获取学科信息
 
 */
+ (void)getSubjectSuccess:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 选课获取期段
 
 */
+ (void)getCourseTimeIntervalSuccess:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 选课获取班级
 
 @param startRows 开始条数
 @param rows 获取条数
 @param schoolId 校区ID
 @param courseTimeInterval 期段ID
 @param subjectId 学科ID
 */
+ (void)getClassBySubjectWithStartRows:(NSNumber *)startRows rows:(NSNumber *)rows schoolId:(NSString *)schoolId courseTimeInterval:(NSString *)courseTimeInterval subjectId:(NSString *)subjectId Success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 班级详情
 
 @param classId 班级Id
 */
+ (void)findClassDetailWithClassId:(NSString *)classId success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;

/**
 获取课程评价
 
 @param courseId 课程Id
 @param rows 获取条数
 @param startRows 开始条数
 */
+ (void)getCourseEvaluateWithStartRows:(NSString *)startRows rows:(NSString *)rows courseId:(NSString *)courseId success:(void(^)(NSDictionary *dict))success failure:(NormalFailureBlock)failure;
@end
