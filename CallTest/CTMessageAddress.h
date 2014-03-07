//
//  A.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_A_h
#define CallTest_A_h

@protocol CTMessageAddress
- (id)encodedString;
- (id)canonicalFormat;
@end

@protocol NSCopying
- (id)copyWithZone:(struct _NSZone *)arg1;
@end

@interface CTMessage : NSObject
{
    NSObject<CTMessageAddress><NSCopying> *_sender;
    NSMutableArray *_recipients;
    NSMutableArray *_items;
    NSDictionary *_rawHeaders;
    NSDate *_date;
    unsigned int _messageId;
    int _messageType;
    CTPhoneNumber *_serviceCenter;
    NSString *_subject;
    NSString *_contentType;
    NSMutableDictionary *_contentTypeParams;
    unsigned int _replaceMessage;
    NSString *_countryCode;
}

@property(readonly, nonatomic) NSString *countryCode; // @synthesize countryCode=_countryCode;
@property(readonly) unsigned int replaceMessage; // @synthesize replaceMessage=_replaceMessage;
@property(copy, nonatomic) NSString *contentType; // @synthesize contentType=_contentType;
@property(readonly) NSDictionary *rawHeaders; // @synthesize rawHeaders=_rawHeaders;
@property(copy, nonatomic) NSObject<CTMessageAddress><NSCopying> *sender; // @synthesize sender=_sender;
@property(copy, nonatomic) NSString *subject; // @synthesize subject=_subject;
@property(copy, nonatomic) CTPhoneNumber *serviceCenter; // @synthesize serviceCenter=_serviceCenter;
@property(nonatomic) int messageType; // @synthesize messageType=_messageType;
@property(readonly) NSArray *items; // @synthesize items=_items;
@property(nonatomic) unsigned int messageId; // @synthesize messageId=_messageId;
@property(readonly) NSDate *date; // @synthesize date=_date;
@property(readonly) NSArray *recipients; // @synthesize recipients=_recipients;
- (void)setCountryCode:(id)arg1;
- (id)description;
- (id)allContentTypeParameterNames;
- (void)addContentTypeParameterWithName:(id)arg1 value:(id)arg2;
- (id)contentTypeParameterWithName:(id)arg1;
- (void)removePartAtIndex:(unsigned int)arg1;
- (id)addPart:(id)arg1;
- (id)addData:(id)arg1 withContentType:(id)arg2;
- (id)addText:(id)arg1;
- (void)addEmailRecipient:(id)arg1;
- (void)addPhoneRecipient:(id)arg1;
- (void)setRecipients:(id)arg1;
- (void)setRecipient:(id)arg1;
- (void)removeRecipientsInArray:(id)arg1;
- (void)removeRecipient:(id)arg1;
- (void)addRecipient:(id)arg1;
- (void)setReplaceMessage:(unsigned int)arg1;
- (void)setRawHeaders:(id)arg1;
- (void)dealloc;
- (id)initWithDate:(id)arg1;
- (id)init;

@end

#endif
