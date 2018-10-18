//
//  FWEB_BasicModel.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/7.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
NSString *getStringWithObj(id obj);
NSInteger getIntegerWithNum(NSNumber *num);
BOOL getBoolWithNum(NSNumber *num);

double getDoubleWithNum(NSNumber *num);

@interface FWEB_BasicModel : NSObject
@property (assign, nonatomic) NSInteger ID;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSInteger)getInteger:(NSNumber *)num;
- (BOOL)getBoolean:(NSNumber *)num;

@end
