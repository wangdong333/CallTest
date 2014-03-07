//
//  G.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_G_h
#define CallTest_G_h
@interface CTEmailAddress : NSObject <NSCopying, CTMessageAddress>
{
    NSString *_address;
}

+ (id)emailAddress:(id)arg1;
@property(readonly) NSString *address; // @synthesize address=_address;
- (id)canonicalFormat;
- (id)encodedString;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (void)dealloc;
- (id)initWithAddress:(id)arg1;

@end


#endif
