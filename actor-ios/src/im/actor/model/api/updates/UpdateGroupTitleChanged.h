//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/updates/UpdateGroupTitleChanged.java
//

#ifndef _ImActorModelApiUpdatesUpdateGroupTitleChanged_H_
#define _ImActorModelApiUpdatesUpdateGroupTitleChanged_H_

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Update.h"

#define ImActorModelApiUpdatesUpdateGroupTitleChanged_HEADER 38

@interface ImActorModelApiUpdatesUpdateGroupTitleChanged : ImActorModelNetworkParserUpdate {
}

+ (ImActorModelApiUpdatesUpdateGroupTitleChanged *)fromBytesWithByteArray:(IOSByteArray *)data;

- (instancetype)initWithInt:(jint)groupId
                   withLong:(jlong)rid
                    withInt:(jint)uid
               withNSString:(NSString *)title
                   withLong:(jlong)date;

- (instancetype)init;

- (jint)getGroupId;

- (jlong)getRid;

- (jint)getUid;

- (NSString *)getTitle;

- (jlong)getDate;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (jint)getHeaderKey;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiUpdatesUpdateGroupTitleChanged)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT ImActorModelApiUpdatesUpdateGroupTitleChanged *ImActorModelApiUpdatesUpdateGroupTitleChanged_fromBytesWithByteArray_(IOSByteArray *data);

J2OBJC_STATIC_FIELD_GETTER(ImActorModelApiUpdatesUpdateGroupTitleChanged, HEADER, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiUpdatesUpdateGroupTitleChanged)

#endif // _ImActorModelApiUpdatesUpdateGroupTitleChanged_H_
