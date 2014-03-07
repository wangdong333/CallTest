//
//  D.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_D_h
#define CallTest_D_h
@interface CTMmsEncoder : NSObject
{
}

+ (id)decodeMessageFromData:(id)arg1;
+ (id)encodeMessage:(id)arg1;
+ (id)encodeSms:(id)arg1;
+ (id)decodeSmsFromData:(id)arg1;

@end


#endif
