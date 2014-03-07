//
//  E.h
//  CallTest
//
//  Created by  on 12-5-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CallTest_E_h
#define CallTest_E_h

@interface CTMessagePart : NSObject
{
    NSString *_contentType;
    NSMutableDictionary *_contentTypeParams;
    NSString *_contentId;
    NSString *_contentLocation;
    NSData *_data;
}

@property(copy, nonatomic) NSData *data; // @synthesize data=_data;
@property(copy, nonatomic) NSString *contentLocation; // @synthesize contentLocation=_contentLocation;
@property(copy, nonatomic) NSString *contentId; // @synthesize contentId=_contentId;
@property(copy, nonatomic) NSString *contentType; // @synthesize contentType=_contentType;
- (void)dealloc;
- (id)allContentTypeParameterNames;
- (void)addContentTypeParameterWithName:(id)arg1 value:(id)arg2;
- (id)contentTypeParameterWithName:(id)arg1;
- (id)initWithData:(id)arg1 contentType:(id)arg2;

@end

#endif
