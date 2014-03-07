//
//  H.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_H_h
#define CallTest_H_h

@interface CTCarrier : NSObject
{
    NSString *_carrierName;
    NSString *_mobileCountryCode;
    NSString *_mobileNetworkCode;
    NSString *_isoCountryCode;
    BOOL _allowsVOIP;
}

@property(nonatomic) BOOL allowsVOIP; // @synthesize allowsVOIP=_allowsVOIP;
@property(retain, nonatomic) NSString *isoCountryCode; // @synthesize isoCountryCode=_isoCountryCode;
@property(retain, nonatomic) NSString *mobileNetworkCode; // @synthesize mobileNetworkCode=_mobileNetworkCode;
@property(retain, nonatomic) NSString *mobileCountryCode; // @synthesize mobileCountryCode=_mobileCountryCode;
@property(retain, nonatomic) NSString *carrierName; // @synthesize carrierName=_carrierName;
- (BOOL)isEqual:(id)arg1;
- (void)dealloc;
- (id)init;
- (id)description;

@end

#endif
