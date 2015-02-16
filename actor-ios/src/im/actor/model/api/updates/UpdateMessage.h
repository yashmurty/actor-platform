//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/updates/UpdateMessage.java
//

#ifndef _ImActorModelApiUpdatesUpdateMessage_H_
#define _ImActorModelApiUpdatesUpdateMessage_H_

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;
@class ImActorModelApiMessageContent;
@class ImActorModelApiPeer;

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Update.h"

#define ImActorModelApiUpdatesUpdateMessage_HEADER 55

@interface ImActorModelApiUpdatesUpdateMessage : ImActorModelNetworkParserUpdate {
}

+ (ImActorModelApiUpdatesUpdateMessage *)fromBytesWithByteArray:(IOSByteArray *)data;

- (instancetype)initWithImActorModelApiPeer:(ImActorModelApiPeer *)peer
                                    withInt:(jint)senderUid
                                   withLong:(jlong)date
                                   withLong:(jlong)rid
          withImActorModelApiMessageContent:(ImActorModelApiMessageContent *)message;

- (instancetype)init;

- (ImActorModelApiPeer *)getPeer;

- (jint)getSenderUid;

- (jlong)getDate;

- (jlong)getRid;

- (ImActorModelApiMessageContent *)getMessage;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (jint)getHeaderKey;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiUpdatesUpdateMessage)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT ImActorModelApiUpdatesUpdateMessage *ImActorModelApiUpdatesUpdateMessage_fromBytesWithByteArray_(IOSByteArray *data);

J2OBJC_STATIC_FIELD_GETTER(ImActorModelApiUpdatesUpdateMessage, HEADER, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiUpdatesUpdateMessage)

#endif // _ImActorModelApiUpdatesUpdateMessage_H_
