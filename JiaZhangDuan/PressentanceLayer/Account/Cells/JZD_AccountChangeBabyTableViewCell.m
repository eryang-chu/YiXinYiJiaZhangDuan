//
//  JZD_AccountChangeBabyTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_SelectBabyCollectionView.h"
#import "JZD_AccountChangeBabyTableViewCell.h"

@interface JZD_AccountChangeBabyTableViewCell ()
@property (weak, nonatomic) IBOutlet JZD_SelectBabyCollectionView *selectBabyCollectionView;

@end

@implementation JZD_AccountChangeBabyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    @weakify(self);
    self.selectBabyCollectionView.cellDidSelectedAtIndex = ^(NSIndexPath *index) {
        @strongify(self);
        if (self.babyDidSelectAtIndex) {
            self.babyDidSelectAtIndex(index);
        }
    };
    // Initialization code
}

- (void)setBabyList:(NSArray *)babyList {
    _babyList = babyList;
    self.selectBabyCollectionView.babyList = _babyList;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
