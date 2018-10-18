//
//  JZD_HomeChooseSeatCollectionViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/17.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JZD_HomeChooseSeatCollectionViewCellType) {
    JZD_HomeChooseSeatCollectionViewCellTypeSelected, //已选
    JZD_HomeChooseSeatCollectionViewCellTypeChoosable, //可选
};

@interface JZD_HomeChooseSeatCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@property (nonatomic, assign) JZD_HomeChooseSeatCollectionViewCellType cellType;

@end
