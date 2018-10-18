//
//  JZD_ServeCalendarView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/13.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeCalendarCollectionViewCell.h"
#import "JZD_ServeCalendarView.h"

#define itemWidth DEVICE_WIDTH / 7.f
#define itemHeight 50

@interface JZD_ServeCalendarView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSMutableArray *dateListM;
//@property (nonatomic, assign) NSInteger currentDay;
@end

@implementation JZD_ServeCalendarView

- (NSMutableArray *)dateListM {
    if (!_dateListM) {
        _dateListM = [NSMutableArray arrayWithCapacity:0];
    }
    return _dateListM;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumInteritemSpacing = 0;
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
        [_collectionView registerNib:[UINib nibWithNibName:@"JZD_ServeCalendarCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"JZD_ServeCalendarCollectionViewCell"];
    }
    
    return _collectionView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self addSubview:self.collectionView];
    [self addCollectionViewConstraints];
    
//    self.currentDay = [self getDay];
}

- (void)setDataList:(NSArray *)dataList {
    _dataList = dataList;
    
//    NSString *firstday = [dataList firstObject];
//    NSInteger firstdays = firstday.integerValue;
    [self.dateListM removeAllObjects];
    
    for (int i = 0; i < self.firstday; i++) {
        [self.dateListM addObject:@""];
    }
    
    [self.dateListM addObjectsFromArray:dataList];
//    for (int i = 0; i < self.firstday + dataList.count; i++) {
//        if (i < self.firstday) {
//
//        } else {
//            for (int j = 0; j < dataList.count; j++) {
//                [self.dateListM addObject:[NSString stringWithFormat:@"%d",j + 1]];
//            }
//        }
//    }
    [self.collectionView reloadData];
}
//
//- (void)setFirstday:(NSInteger)firstday {
//    _firstday = firstday;
//    
//    [self.dateListM removeAllObjects];
//    for (int i = 0; i < self.firstday; i++) {
//        [self.dateListM addObject:@""];
//    }
//    
//    [self.dateListM addObjectsFromArray:self.dataList];
//}

//-(int)getDay{
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
//    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:[NSDate date]];
//    return (int)dateComponent.day;
//}

- (void)addCollectionViewConstraints{
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeTop          relatedBy:
                         NSLayoutRelationEqual
                                                        toItem:self.collectionView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeTrailing          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeLeading          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeBottom          relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
}

#pragma mark - collectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    NSString *firstday = [self.dataList firstObject];
//    NSInteger firstdays = firstday.integerValue;
    
    return self.dateListM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *firstday = [self.dataList firstObject];
//    NSInteger firstdays = firstday.integerValue;
    
    JZD_ServeCalendarCollectionViewCell * collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JZD_ServeCalendarCollectionViewCell" forIndexPath:indexPath];
    
    NSDate *date = nil;
    if (indexPath.row < self.firstday) {
        collectionViewCell.hidden = YES;
    } else {
        collectionViewCell.hidden = NO;
        date = [self.dateListM objectAtIndex:indexPath.row];
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString * string = [formatter stringFromDate:date];
        if ([string isEqualToString:self.currentDate]) {
            collectionViewCell.cellType = JZD_ServeCalendarCollectionViewCellTypeToday;
        } else {
            collectionViewCell.cellType = JZD_ServeCalendarCollectionViewCellTypeNormal;
        }
        
        if (indexPath.row == 10) {
            collectionViewCell.cellType = JZD_ServeCalendarCollectionViewCellTypeLeave;
        }
        if (indexPath.row == 12) {
            collectionViewCell.cellType = JZD_ServeCalendarCollectionViewCellTypecampus;
            
        }
        
        NSArray *arrar = [string componentsSeparatedByString:@"-"];
        collectionViewCell.contentLabel.text = [arrar objectAtIndex:2];
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
