//
//  FWEB_BasicModel.m
//  fuwuEbao
//
//  Created by Jiao on 2018/8/7.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import "FWEB_BasicModel.h"
NSString *getStringWithObj(id obj) {
    if (!obj) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@", obj];
}

NSInteger getIntegerWithNum(NSNumber *num) {
    if (num) {
        return num.integerValue;
    }
    return 0;
}


BOOL getBoolWithNum(NSNumber *num) {
    if (num) {
        return num.boolValue;
    }
    return NO;
}

double getDoubleWithNum(NSNumber *num) {
    if (num) {
        return num.doubleValue;
    }
    return 0;
}

@implementation FWEB_BasicModel
- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.ID = getIntegerWithNum([dict null_objectForKey:@"id"]);
    }
    return self;
}

- (BOOL)getBoolean:(NSNumber *)num {
    if (num) {
        return num.boolValue;
    }
    return 0;
}

- (NSInteger)getInteger:(NSNumber *)num {
    if (num) {
        return num.integerValue;
    }
    return 0;
}

@end
