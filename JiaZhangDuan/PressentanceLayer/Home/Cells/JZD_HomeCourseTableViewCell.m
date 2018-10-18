//
//  JZD_HomeCourseTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeCourseCollectionView.h"
#import "JZD_HomeCourseTableViewCell.h"

@interface JZD_HomeCourseTableViewCell ()
@property (weak, nonatomic) IBOutlet JZD_HomeCourseCollectionView *homeCourseCollectionView;
@end

@implementation JZD_HomeCourseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    @weakify(self);
    self.homeCourseCollectionView.cellDidSelectedAtIndex = ^(NSIndexPath *index) {
        @strongify(self);
        if (self.cellDidSelectedAtIndex) {
            self.cellDidSelectedAtIndex(index);
        }
    };
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
