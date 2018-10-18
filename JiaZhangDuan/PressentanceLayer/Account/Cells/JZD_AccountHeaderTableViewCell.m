//
//  JZD_AccountHeaderTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/25.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountHeaderTableViewCell.h"

@interface JZD_AccountHeaderTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *babyImage;

@property (weak, nonatomic) IBOutlet UIButton *changeBabyButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@end
@implementation JZD_AccountHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.babyImage layerCornerRadius:@45 borderWidth:@5 borderColor:HEX_COLOR(0xffffff)];
    [self.backImage layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    // Initialization code
}

- (void)setCellType:(JZD_AccountHeaderTableViewCellType)cellType {
    _cellType = cellType;
    switch (_cellType) {
        case JZD_AccountHeaderTableViewCellTypeLogined:
            self.changeBabyButton.hidden = NO;
            
            break;
        case JZD_AccountHeaderTableViewCellTypeUnLogin:
            self.changeBabyButton.hidden = YES;
            self.babyNameLabel.text = @"未登录";
            self.jifenLabel.text = @"点击登录";
            self.babyImage.image = [UIImage imageNamed:@"ic_weilogin"];
            break;
            
        default:
            break;
    }
}

- (IBAction)changeBabyButtonClick:(id)sender {
    if (self.changeBabyButtonClick) {
        self.changeBabyButtonClick();
    }
}
- (IBAction)loginButtonClick:(id)sender {
    if (self.loginButtonClick) {
        self.loginButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
