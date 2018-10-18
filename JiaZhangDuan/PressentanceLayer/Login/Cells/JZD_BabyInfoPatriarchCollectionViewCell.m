//
//  JZD_BabyInfoPatriarchCollectionViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BabyInfoPatriarchCollectionViewCell.h"

@implementation JZD_BabyInfoPatriarchCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.PatriarchLabel layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    self.isSelected = NO;
    
    
    // Initialization code
}

//- (void)setIsSelected:(BOOL)isSelected {
//    _isSelected = isSelected;
//    if (_isSelected) {
//        self.PatriarchLabel.backgroundColor = SYSTEM_RED_COLOR;
//        self.PatriarchLabel.textColor = [UIColor whiteColor];
//    }else {
//        self.PatriarchLabel.backgroundColor = [UIColor whiteColor];
//        self.PatriarchLabel.textColor = SYSTEM_RED_COLOR;
//    }
//}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.PatriarchLabel.backgroundColor = SYSTEM_RED_COLOR;
        self.PatriarchLabel.textColor = [UIColor whiteColor];
    } else {
        self.PatriarchLabel.backgroundColor = [UIColor whiteColor];
        self.PatriarchLabel.textColor = SYSTEM_RED_COLOR;
    }
}

@end
