//
//  I.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_I_h
#define CallTest_I_h

@interface CTTelephonyNetworkInfo : NSObject
{
    void *_internal;
    CTCarrier *_subscriberCellularProvider;
    id _subscriberCellularProviderDidUpdateNotifier;
}

@property(retain) CTCarrier *subscriberCellularProvider; // @synthesize subscriberCellularProvider=_subscriberCellularProvider;
- (void)postUpdatesIfNecessary;
- (void)handleNotificationFromConnection:(void *)arg1 ofType:(id)arg2 withInfo:(id)arg3;
- (BOOL)updateNetworkInfoAndShouldNotifyClient:(char *)arg1;
- (BOOL)getAllowsVOIP:(char *)arg1 withCTError:(CDStruct_1ef3fb1f *)arg2;
- (BOOL)getMobileNetworkCode:(id)arg1 withCTError:(CDStruct_1ef3fb1f *)arg2;
- (BOOL)getMobileCountryCode:(id)arg1 andIsoCountryCode:(id)arg2 withCTError:(CDStruct_1ef3fb1f *)arg3;
- (BOOL)getCarrierName:(id)arg1 withCTError:(CDStruct_1ef3fb1f *)arg2;
@property(copy, nonatomic) id subscriberCellularProviderDidUpdateNotifier;
- (void)dealloc;
- (id)init;
- (void)cleanUpServerConnection;
- (void)cleanUpServerConnectionNoLock;
- (void)reestablishServerConnectionIfNeeded;
- (BOOL)setUpServerConnection;

@end

#endif
