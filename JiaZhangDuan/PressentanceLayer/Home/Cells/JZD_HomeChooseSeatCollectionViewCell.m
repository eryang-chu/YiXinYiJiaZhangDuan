//
//  JZD_HomeChooseSeatCollectionViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/17.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeChooseSeatCollectionViewCell.h"

@interface JZD_HomeChooseSeatCollectionViewCell ()
@end

@implementation JZD_HomeChooseSeatCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    // Initialization code
}

- (void)setCellType:(JZD_HomeChooseSeatCollectionViewCellType)cellType {
    _cellType = cellType;
    switch (cellType) {
        case JZD_HomeChooseSeatCollectionViewCellTypeSelected:
            self.contentImage.image = [UIImage imageNamed:@"ic_yisou"];
            self.userInteractionEnabled = NO;
            break;
        case JZD_HomeChooseSeatCollectionViewCellTypeChoosable:
            self.contentImage.image = [UIImage imageNamed:@"ic_kexuan"];
            self.userInteractionEnabled = YES;
            break;
            
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.contentImage.image = [UIImage imageNamed:@"ic_yixuan"];
    } else {
        self.contentImage.image = [UIImage imageNamed:@"ic_kexuan"];
    }
}

@end
