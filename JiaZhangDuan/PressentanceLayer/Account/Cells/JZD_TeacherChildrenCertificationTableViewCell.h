//
//  JZD_TeacherChildrenCertificationTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_TeacherChildrenCertificationTableViewCell : JZD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *certificationImage;
@property (nonatomic, copy) void (^certificationButtonClick)(void);
@end
