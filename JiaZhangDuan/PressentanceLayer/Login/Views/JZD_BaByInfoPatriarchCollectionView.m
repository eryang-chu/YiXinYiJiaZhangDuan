//
//  JZD_BaByInfoPatriarchCollectionView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BabyInfoPatriarchCollectionViewCell.h"
#import "JZD_BaByInfoPatriarchCollectionView.h"

#define itemWidth (DEVICE_WIDTH - 12 * 6) / 4.f
#define itemHeight 30

@interface JZD_BaByInfoPatriarchCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) JZD_BabyInfoPatriarchCollectionViewCell *selectCell;
@end
@implementation JZD_BaByInfoPatriarchCollectionView
- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumInteritemSpacing = 5;
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
        
        [_collectionView registerNib:[UINib nibWithNibName:@"JZD_BabyInfoPatriarchCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"JZD_BabyInfoPatriarchCollectionViewCell"];
    }
    
    return _collectionView;
}

- (void)setPatriarchList:(NSArray *)patriarchList {
    _patriarchList = patriarchList;
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
    return self.patriarchList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JZD_BabyInfoPatriarchCollectionViewCell * collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JZD_BabyInfoPatriarchCollectionViewCell" forIndexPath:indexPath];
    collectionViewCell.selected = NO;
    collectionViewCell.PatriarchLabel.text = [self.patriarchList objectAtIndex:indexPath.row];
    return collectionViewCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(itemWidth, itemHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JZD_BabyInfoPatriarchCollectionViewCell *cell = (JZD_BabyInfoPatriarchCollectionViewCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
//    if (!_selectCell) {
//        _selectCell = cell;
//        _selectCell.selected = YES;
//    } else {
//        if (_selectCell == cell) {
//            _selectCell.selected = NO;
//        }else {
//            _selectCell.selected = NO;
//
//            _selectCell = cell;
//            _selectCell.selected = YES;
//        }
//    }
    
    if (self.cellDidSelectedAtIndex) {
        self.cellDidSelectedAtIndex(indexPath, cell);
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
