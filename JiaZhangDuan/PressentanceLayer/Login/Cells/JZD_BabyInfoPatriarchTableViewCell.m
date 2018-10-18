//
//  JZD_BabyInfoPatriarchTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BaByInfoPatriarchCollectionView.h"
#import "JZD_BabyInfoPatriarchTableViewCell.h"

@interface JZD_BabyInfoPatriarchTableViewCell ()
@property (weak, nonatomic) IBOutlet JZD_BaByInfoPatriarchCollectionView *babyInfoPatriarchCollectionView;
@end
@implementation JZD_BabyInfoPatriarchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setPatriarchList:(NSArray *)patriarchList {
    _patriarchList = patriarchList;
    self.babyInfoPatriarchCollectionView.patriarchList = _patriarchList;
    
    @weakify(self);
    self.babyInfoPatriarchCollectionView.cellDidSelectedAtIndex = ^(NSIndexPath *index, JZD_BabyInfoPatriarchCollectionViewCell *cell) {
        @strongify(self);
        if (self.patriarchDidSelectAtIndex) {
            self.patriarchDidSelectAtIndex(index, cell);
        }
    };
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
