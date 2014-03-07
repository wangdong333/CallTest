//
//  C.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_C_h
#define CallTest_C_h
@interface CTMessageCenter : NSObject
{
}

+ (id)sharedMessageCenter;
- (BOOL)getCharacterCount:(int *)arg1 andMessageSplitThreshold:(int *)arg2 forSmsText:(id)arg3;
- (BOOL)sendSMSWithText:(id)arg1 serviceCenter:(id)arg2 toAddress:(id)arg3 withMoreToFollow:(BOOL)arg4;
- (BOOL)sendSMSWithText:(id)arg1 serviceCenter:(id)arg2 toAddress:(id)arg3;
- (BOOL)isMmsConfigured;
- (BOOL)isMmsEnabled;
- (void)setDeliveryReportsEnabled:(BOOL)arg1;
- (CDStruct_1ef3fb1f)isDeliveryReportsEnabled:(char *)arg1;
- (id)decodeMessage:(id)arg1;
- (id)encodeMessage:(id)arg1;
- (id)statusOfOutgoingMessages;
- (id)deferredMessageWithId:(unsigned int)arg1;
- (id)incomingMessageWithId:(unsigned int)arg1;
- (void)acknowledgeOutgoingMessageWithId:(unsigned int)arg1;
- (void)acknowledgeIncomingMessageWithId:(unsigned int)arg1;
- (id)allIncomingMessages;
- (int)incomingMessageCount;
- (id)incomingMessageWithId:(unsigned int)arg1 telephonyCenter:(struct __CTTelephonyCenter *)arg2 isDeferred:(BOOL)arg3;
- (CDStruct_1ef3fb1f)send:(id)arg1 withMoreToFollow:(BOOL)arg2;
- (CDStruct_1ef3fb1f)send:(id)arg1;
- (CDStruct_1ef3fb1f)sendMMS:(id)arg1;
- (void)sendMessageAsSmsToShortCodeRecipients:(id)arg1 andReplaceData:(id *)arg2;
- (CDStruct_1ef3fb1f)sendMMSFromData:(id)arg1 messageId:(unsigned int)arg2;
- (CDStruct_1ef3fb1f)sendSMS:(id)arg1 withMoreToFollow:(BOOL)arg2;
- (id)init;

@end


#endif
