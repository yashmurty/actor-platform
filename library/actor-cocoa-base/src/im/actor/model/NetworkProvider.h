//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/NetworkProvider.java
//

#ifndef _AMNetworkProvider_H_
#define _AMNetworkProvider_H_

#include "J2ObjC_header.h"

@class AMConnectionEndpoint;
@protocol AMConnectionCallback;
@protocol AMCreateConnectionCallback;

@protocol AMNetworkProvider < NSObject, JavaObject >

- (void)createConnection:(jint)connectionId
      withMTProtoVersion:(jint)mtprotoVersion
     withApiMajorVersion:(jint)apiMajorVersion
     withApiMinorVersion:(jint)apiMinorVersion
            withEndpoint:(AMConnectionEndpoint *)endpoint
            withCallback:(id<AMConnectionCallback>)callback
      withCreateCallback:(id<AMCreateConnectionCallback>)createCallback;

@end

J2OBJC_EMPTY_STATIC_INIT(AMNetworkProvider)

J2OBJC_TYPE_LITERAL_HEADER(AMNetworkProvider)

#define ImActorModelNetworkProvider AMNetworkProvider

#endif // _AMNetworkProvider_H_