//
//  J.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_J_h
#define CallTest_J_h
@interface CTCallCenter : NSObject
{
    void *_internal;
    NSSet *_currentCalls;
    id _callEventHandler;
}

- (id)description;
- (void)broadcastCallStateChangesIfNeededWithFailureLogMessage:(id)arg1;
- (void)handleNotificationFromConnection:(void *)arg1 ofType:(id)arg2 withInfo:(id)arg3;
@property(retain) NSSet *currentCalls; // @dynamic currentCalls;
- (BOOL)calculateCallStateChanges:(id)arg1;
- (BOOL)getCurrentCallSetFromServer:(id)arg1;
@property(copy, nonatomic) id callEventHandler;
- (void)dealloc;
- (id)init;
- (void)cleanUpServerConnection;
- (void)cleanUpServerConnectionNoLock;
- (void)reestablishServerConnectionIfNeeded;
- (BOOL)setUpServerConnection;

@end


#endif
