//
//  B.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_B_h
#define CallTest_B_h
@interface CTPhoneNumber : NSObject <NSCopying, CTMessageAddress>
{
    NSString *_digits;
    NSString *_countryCode;
    BOOL _isShortCode;
}

+ (id)phoneNumberWithDigits:(id)arg1 countryCode:(id)arg2;
@property BOOL isShortCode; // @synthesize isShortCode=_isShortCode;
@property(readonly) NSString *countryCode; // @synthesize countryCode=_countryCode;
@property(readonly) NSString *digits; // @synthesize digits=_digits;
- (id)encodedString;
- (id)canonicalFormat;
- (id)formatForCallingCountry:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (void)dealloc;
- (id)initWithDigits:(id)arg1 countryCode:(id)arg2;
- (int)numberOfDigitsForShortCodeNumber;

@end


#endif
