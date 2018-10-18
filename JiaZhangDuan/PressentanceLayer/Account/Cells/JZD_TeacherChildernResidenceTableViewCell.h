//
//  JZD_TeacherChildernResidenceTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_TeacherChildernResidenceTableViewCell : JZD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *teacherImage;
@property (weak, nonatomic) IBOutlet UIImageView *studentImage;
@property (nonatomic, copy) void (^teacherButtonClick)(void);
@property (nonatomic, copy) void (^studentButtonClick)(void);
@end
