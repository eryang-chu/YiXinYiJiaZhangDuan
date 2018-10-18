//
//  JZD_TeacherChildrenIncumbencyCertificationTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_TeacherChildrenIncumbencyCertificationTableViewCell : JZD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *incumbencyCertificationImage;
@property (nonatomic, copy) void (^incumbencyCertificationButtonClick)(void);
@end
