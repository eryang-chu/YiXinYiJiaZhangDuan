//
//  JZD_ServeTeachingReportListTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeTeachingReportListTableViewCell.h"

@interface JZD_ServeTeachingReportListTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *disLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *timeImage;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *classTimeContentLabel;
@end

@implementation JZD_ServeTeachingReportListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.headImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    // Initialization code
}

- (void)setCellType:(JZD_ServeTeachingReportListTableViewCellType)cellType {
    switch (cellType) {
        case JZD_ServeTeachingReportListTableViewCellTypeList:
            self.timeImage.hidden = YES;
            self.classLabel.hidden = YES;
            self.classTimeContentLabel.hidden = YES;
            break;
        case JZD_ServeTeachingReportListTableViewCellTypeDetail:
            self.timeImage.hidden = NO;
            self.classLabel.hidden = NO;
            self.classTimeContentLabel.hidden = NO;
            break;
            
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
