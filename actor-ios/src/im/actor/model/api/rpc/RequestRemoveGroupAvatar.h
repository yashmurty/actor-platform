//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/rpc/RequestRemoveGroupAvatar.java
//

#ifndef _ImActorModelApiRpcRequestRemoveGroupAvatar_H_
#define _ImActorModelApiRpcRequestRemoveGroupAvatar_H_

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;
@class ImActorModelApiGroupOutPeer;

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

#define ImActorModelApiRpcRequestRemoveGroupAvatar_HEADER 101

@interface ImActorModelApiRpcRequestRemoveGroupAvatar : ImActorModelNetworkParserRequest {
}

+ (ImActorModelApiRpcRequestRemoveGroupAvatar *)fromBytesWithByteArray:(IOSByteArray *)data;

- (instancetype)initWithImActorModelApiGroupOutPeer:(ImActorModelApiGroupOutPeer *)groupPeer
                                           withLong:(jlong)rid;

- (instancetype)init;

- (ImActorModelApiGroupOutPeer *)getGroupPeer;

- (jlong)getRid;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (jint)getHeaderKey;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiRpcRequestRemoveGroupAvatar)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT ImActorModelApiRpcRequestRemoveGroupAvatar *ImActorModelApiRpcRequestRemoveGroupAvatar_fromBytesWithByteArray_(IOSByteArray *data);

J2OBJC_STATIC_FIELD_GETTER(ImActorModelApiRpcRequestRemoveGroupAvatar, HEADER, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiRpcRequestRemoveGroupAvatar)

#endif // _ImActorModelApiRpcRequestRemoveGroupAvatar_H_
