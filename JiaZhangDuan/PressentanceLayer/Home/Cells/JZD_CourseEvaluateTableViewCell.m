//
//  JZD_CourseEvaluateTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "XHStarRateView.h"
#import "JZD_CourseEvaluateTableViewCell.h"

@interface JZD_CourseEvaluateTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *childrenImage;
@property (weak, nonatomic) IBOutlet UILabel *childrenName;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *evaluateLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *evaluateHeight;
@property (weak, nonatomic) IBOutlet UIView *evaluateView;
@property (weak, nonatomic) IBOutlet UIImageView *firstImage;
@property (weak, nonatomic) IBOutlet UIImageView *secondImage;
@property (weak, nonatomic) IBOutlet UIImageView *thirdImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineTopSpace;

@property (strong, nonatomic) XHStarRateView *starRateView;
@end

@implementation JZD_CourseEvaluateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.childrenImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    self.starRateView = [[XHStarRateView alloc] initWithFrame:CGRectMake(0, 20, 120, 20)];
    [self.childrenNameView addSubview:self.starRateView];
    
    // Initialization code
}

- (void)setCellType:(JZD_CourseEvaluateTableViewCellType)cellType {
    _cellType = cellType;
    switch (_cellType) {
        case JZD_CourseEvaluateTableViewCellTypeImages:
            self.childrenNameView.hidden = YES;
            self.evaluateView.hidden = NO;
            self.bottomLineTopSpace.constant = 92;
            break;
        case JZD_CourseEvaluateTableViewCellTypeNoImage:
            self.childrenNameView.hidden = YES;
            self.evaluateView.hidden = YES;
            self.bottomLineTopSpace.constant = 10;
            break;
        case JZD_CourseEvaluateTableViewCellTypeImagesEvaluate:
            self.childrenNameView.hidden = NO;
            self.evaluateView.hidden = NO;
            self.bottomLineTopSpace.constant = 92;
            break;
        case JZD_CourseEvaluateTableViewCellTypeNoImageEvaluate:
            self.childrenNameView.hidden = NO;
            
            self.evaluateView.hidden = YES;
            self.bottomLineTopSpace.constant = 10;
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
