//
//  K.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_K_h
#define CallTest_K_h
@interface CTCall : NSObject
{
    NSString *_callState;
    NSString *_callID;
}

+ (id)callForCTCallRef:(struct __CTCall *)arg1;
@property(copy, nonatomic) NSString *callID; // @synthesize callID=_callID;
@property(copy, nonatomic) NSString *callState; // @synthesize callState=_callState;
- (unsigned int)hash;
- (BOOL)isEqual:(id)arg1;
- (id)description;
- (void)dealloc;

@end


#endif
