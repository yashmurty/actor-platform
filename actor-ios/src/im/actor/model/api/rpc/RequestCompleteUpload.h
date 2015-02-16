//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/rpc/RequestCompleteUpload.java
//

#ifndef _ImActorModelApiRpcRequestCompleteUpload_H_
#define _ImActorModelApiRpcRequestCompleteUpload_H_

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;
@class ImActorModelApiUploadConfig;

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

#define ImActorModelApiRpcRequestCompleteUpload_HEADER 22

@interface ImActorModelApiRpcRequestCompleteUpload : ImActorModelNetworkParserRequest {
}

+ (ImActorModelApiRpcRequestCompleteUpload *)fromBytesWithByteArray:(IOSByteArray *)data;

- (instancetype)initWithImActorModelApiUploadConfig:(ImActorModelApiUploadConfig *)config
                                            withInt:(jint)blocksCount
                                           withLong:(jlong)crc32;

- (instancetype)init;

- (ImActorModelApiUploadConfig *)getConfig;

- (jint)getBlocksCount;

- (jlong)getCrc32;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (jint)getHeaderKey;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiRpcRequestCompleteUpload)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT ImActorModelApiRpcRequestCompleteUpload *ImActorModelApiRpcRequestCompleteUpload_fromBytesWithByteArray_(IOSByteArray *data);

J2OBJC_STATIC_FIELD_GETTER(ImActorModelApiRpcRequestCompleteUpload, HEADER, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiRpcRequestCompleteUpload)

#endif // _ImActorModelApiRpcRequestCompleteUpload_H_
