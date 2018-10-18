//
//  JZD_HomeChooseSeatCollectionView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/17.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeChooseSeatCollectionViewCell.h"
#import "JZD_HomeChooseSeatCollectionView.h"

#define itemWidth (DEVICE_WIDTH - 20) / 8.f
#define itemHeight (DEVICE_WIDTH - 20) / 8.f

@interface JZD_HomeChooseSeatCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@end

@implementation JZD_HomeChooseSeatCollectionView
- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumInteritemSpacing = 10;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.userInteractionEnabled = YES;
        _collectionView.contentSize = CGSizeMake(_collectionView.frame.size.width, _collectionView.frame.size.height);
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"JZD_HomeChooseSeatCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"JZD_HomeChooseSeatCollectionViewCell"];
    }
    
    return _collectionView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.collectionView];
    [self addCollectionViewConstraints];
}

- (void)addCollectionViewConstraints{
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeTop          relatedBy:
                         NSLayoutRelationEqual
                                                        toItem:self.collectionView attribute:NSLayoutAttributeTop multiplier:1 constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeTrailing          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeTrailing multiplier:1 constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeLeading          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeLeading multiplier:1 constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeBottom          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeBottom multiplier:1 constant:10]];
}

#pragma mark - collectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //    return self.coursesList.count;
    return 48;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JZD_HomeChooseSeatCollectionViewCell * collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JZD_HomeChooseSeatCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.row == 8 || indexPath.row == 9 || indexPath.row == 10 || indexPath.row == 11 || indexPath.row == 12 || indexPath.row == 13 ) {
        collectionViewCell.cellType = JZD_HomeChooseSeatCollectionViewCellTypeSelected;
    } else {
        collectionViewCell.cellType = JZD_HomeChooseSeatCollectionViewCellTypeChoosable;
    }
    
    return collectionViewCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(itemWidth, itemHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.cellDidSelectedAtIndex) {
        self.cellDidSelectedAtIndex(indexPath);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
