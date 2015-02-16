//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/rpc/RequestTerminateSession.java
//

#ifndef _ImActorModelApiRpcRequestTerminateSession_H_
#define _ImActorModelApiRpcRequestTerminateSession_H_

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

#define ImActorModelApiRpcRequestTerminateSession_HEADER 82

@interface ImActorModelApiRpcRequestTerminateSession : ImActorModelNetworkParserRequest {
}

+ (ImActorModelApiRpcRequestTerminateSession *)fromBytesWithByteArray:(IOSByteArray *)data;

- (instancetype)initWithInt:(jint)id_;

- (instancetype)init;

- (jint)getId;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (jint)getHeaderKey;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiRpcRequestTerminateSession)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT ImActorModelApiRpcRequestTerminateSession *ImActorModelApiRpcRequestTerminateSession_fromBytesWithByteArray_(IOSByteArray *data);

J2OBJC_STATIC_FIELD_GETTER(ImActorModelApiRpcRequestTerminateSession, HEADER, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiRpcRequestTerminateSession)

#endif // _ImActorModelApiRpcRequestTerminateSession_H_
