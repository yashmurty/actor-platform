//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/network/api/ApiBroker.java
//

#ifndef _ImActorModelNetworkApiApiBroker_H_
#define _ImActorModelNetworkApiApiBroker_H_

#include "J2ObjC_header.h"
#include "im/actor/model/droidkit/actors/Actor.h"

@class AMEndpoints;
@class DKActorRef;
@class ImActorModelNetworkParserRequest;
@protocol AMActorApiCallback;
@protocol AMAuthKeyStorage;
@protocol AMNetworkProvider;
@protocol AMRpcCallback;

@interface ImActorModelNetworkApiApiBroker : DKActor

#pragma mark Public

- (instancetype)initWithAMEndpoints:(AMEndpoints *)endpoints
               withAMAuthKeyStorage:(id<AMAuthKeyStorage>)keyStorage
             withAMActorApiCallback:(id<AMActorApiCallback>)callback
              withAMNetworkProvider:(id<AMNetworkProvider>)networkProvider;

+ (DKActorRef *)getWithAMEndpoints:(AMEndpoints *)endpoints
              withAMAuthKeyStorage:(id<AMAuthKeyStorage>)keyStorage
            withAMActorApiCallback:(id<AMActorApiCallback>)callback
             withAMNetworkProvider:(id<AMNetworkProvider>)networkProvider;

- (void)onReceiveWithId:(id)message;

- (void)preStart;

@end

J2OBJC_STATIC_INIT(ImActorModelNetworkApiApiBroker)

FOUNDATION_EXPORT DKActorRef *ImActorModelNetworkApiApiBroker_getWithAMEndpoints_withAMAuthKeyStorage_withAMActorApiCallback_withAMNetworkProvider_(AMEndpoints *endpoints, id<AMAuthKeyStorage> keyStorage, id<AMActorApiCallback> callback, id<AMNetworkProvider> networkProvider);

FOUNDATION_EXPORT void ImActorModelNetworkApiApiBroker_initWithAMEndpoints_withAMAuthKeyStorage_withAMActorApiCallback_withAMNetworkProvider_(ImActorModelNetworkApiApiBroker *self, AMEndpoints *endpoints, id<AMAuthKeyStorage> keyStorage, id<AMActorApiCallback> callback, id<AMNetworkProvider> networkProvider);

FOUNDATION_EXPORT ImActorModelNetworkApiApiBroker *new_ImActorModelNetworkApiApiBroker_initWithAMEndpoints_withAMAuthKeyStorage_withAMActorApiCallback_withAMNetworkProvider_(AMEndpoints *endpoints, id<AMAuthKeyStorage> keyStorage, id<AMActorApiCallback> callback, id<AMNetworkProvider> networkProvider) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelNetworkApiApiBroker)

@interface ImActorModelNetworkApiApiBroker_PerformRequest : NSObject

#pragma mark Public

- (instancetype)initWithImActorModelNetworkParserRequest:(ImActorModelNetworkParserRequest *)message
                                       withAMRpcCallback:(id<AMRpcCallback>)callback;

- (id<AMRpcCallback>)getCallback;

- (ImActorModelNetworkParserRequest *)getMessage;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelNetworkApiApiBroker_PerformRequest)

FOUNDATION_EXPORT void ImActorModelNetworkApiApiBroker_PerformRequest_initWithImActorModelNetworkParserRequest_withAMRpcCallback_(ImActorModelNetworkApiApiBroker_PerformRequest *self, ImActorModelNetworkParserRequest *message, id<AMRpcCallback> callback);

FOUNDATION_EXPORT ImActorModelNetworkApiApiBroker_PerformRequest *new_ImActorModelNetworkApiApiBroker_PerformRequest_initWithImActorModelNetworkParserRequest_withAMRpcCallback_(ImActorModelNetworkParserRequest *message, id<AMRpcCallback> callback) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelNetworkApiApiBroker_PerformRequest)

@interface ImActorModelNetworkApiApiBroker_CancelRequest : NSObject

#pragma mark Public

- (instancetype)initWithLong:(jlong)randomId;

- (jlong)getRandomId;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelNetworkApiApiBroker_CancelRequest)

FOUNDATION_EXPORT void ImActorModelNetworkApiApiBroker_CancelRequest_initWithLong_(ImActorModelNetworkApiApiBroker_CancelRequest *self, jlong randomId);

FOUNDATION_EXPORT ImActorModelNetworkApiApiBroker_CancelRequest *new_ImActorModelNetworkApiApiBroker_CancelRequest_initWithLong_(jlong randomId) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelNetworkApiApiBroker_CancelRequest)

@interface ImActorModelNetworkApiApiBroker_NetworkChanged : NSObject

#pragma mark Public

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelNetworkApiApiBroker_NetworkChanged)

FOUNDATION_EXPORT void ImActorModelNetworkApiApiBroker_NetworkChanged_init(ImActorModelNetworkApiApiBroker_NetworkChanged *self);

FOUNDATION_EXPORT ImActorModelNetworkApiApiBroker_NetworkChanged *new_ImActorModelNetworkApiApiBroker_NetworkChanged_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelNetworkApiApiBroker_NetworkChanged)

#endif // _ImActorModelNetworkApiApiBroker_H_