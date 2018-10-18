//
//  JZD_SelectBabyCollectionView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_SelecteBabyCollectionViewCell.h"
#import "JZD_SelectBabyCollectionView.h"

#define itemWidth 120
#define itemHeight 100

@interface JZD_SelectBabyCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@end
@implementation JZD_SelectBabyCollectionView
- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumInteritemSpacing = 30;
        _flowLayout.minimumLineSpacing = 20;
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
        [_collectionView registerNib:[UINib nibWithNibName:@"JZD_SelecteBabyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"JZD_SelecteBabyCollectionViewCell"];
    }
    
    return _collectionView;
}

- (void)setBabyList:(NSArray *)babyList {
    _babyList = babyList;
    [self.collectionView reloadData];
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
                                                        toItem:self.collectionView attribute:NSLayoutAttributeTop multiplier:1 constant:-15]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeTrailing          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeTrailing multiplier:1 constant:40]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeLeading          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeLeading multiplier:1 constant:-40]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeBottom          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeBottom multiplier:1 constant:15]];
}

#pragma mark - collectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.babyList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JZD_SelecteBabyCollectionViewCell * collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JZD_SelecteBabyCollectionViewCell" forIndexPath:indexPath];
    NSDictionary *dict = [self.babyList objectAtIndex:indexPath.row];
    
    collectionViewCell.headerImage.image = [UIImage imageNamed:[dict objectForKey:@"image"]];
    collectionViewCell.nameLabel.text = [dict objectForKey:@"name"] ?:@"";
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
