//
//  F.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_F_h
#define CallTest_F_h
@interface CTMessageStatus : NSObject
{
    unsigned int _messageId;
    int _messageType;
    int _result;
}

@property(readonly) int result; // @synthesize result=_result;
@property(readonly) int messageType; // @synthesize messageType=_messageType;
@property(readonly) unsigned int messageId; // @synthesize messageId=_messageId;
- (id)initWithMessageId:(unsigned int)arg1 messageType:(int)arg2 result:(int)arg3;

@end


#endif
