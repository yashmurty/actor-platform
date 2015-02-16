//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/ConfigurationBuilder.java
//

#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/ConfigurationBuilder.h"
#include "im/actor/model/LogCallback.h"
#include "im/actor/model/MainThread.h"
#include "im/actor/model/MessengerCallback.h"
#include "im/actor/model/Networking.h"
#include "im/actor/model/Storage.h"
#include "im/actor/model/Threading.h"
#include "im/actor/model/network/ConnectionEndpoint.h"
#include "java/lang/RuntimeException.h"
#include "java/net/URI.h"
#include "java/util/ArrayList.h"

@interface AMConfigurationBuilder () {
 @public
  id<AMLogCallback> log_;
  id<AMNetworking> networking_;
  id<AMThreading> threading_;
  id<AMMainThread> mainThread_;
  id<AMStorage> enginesFactory_;
  id<AMMessengerCallback> callback_;
  JavaUtilArrayList *endpoints_;
  jboolean isMessagesPersisting_;
}
@end

J2OBJC_FIELD_SETTER(AMConfigurationBuilder, log_, id<AMLogCallback>)
J2OBJC_FIELD_SETTER(AMConfigurationBuilder, networking_, id<AMNetworking>)
J2OBJC_FIELD_SETTER(AMConfigurationBuilder, threading_, id<AMThreading>)
J2OBJC_FIELD_SETTER(AMConfigurationBuilder, mainThread_, id<AMMainThread>)
J2OBJC_FIELD_SETTER(AMConfigurationBuilder, enginesFactory_, id<AMStorage>)
J2OBJC_FIELD_SETTER(AMConfigurationBuilder, callback_, id<AMMessengerCallback>)
J2OBJC_FIELD_SETTER(AMConfigurationBuilder, endpoints_, JavaUtilArrayList *)

@implementation AMConfigurationBuilder

- (AMConfigurationBuilder *)setLog:(id<AMLogCallback>)log {
  self->log_ = log;
  return self;
}

- (AMConfigurationBuilder *)setNetworking:(id<AMNetworking>)networking {
  self->networking_ = networking;
  return self;
}

- (AMConfigurationBuilder *)setThreading:(id<AMThreading>)threading {
  self->threading_ = threading;
  return self;
}

- (AMConfigurationBuilder *)setStorage:(id<AMStorage>)storage {
  self->enginesFactory_ = storage;
  return self;
}

- (AMConfigurationBuilder *)setCallback:(id<AMMessengerCallback>)callback {
  self->callback_ = callback;
  return self;
}

- (AMConfigurationBuilder *)addEndpoint:(NSString *)url {
  JavaNetURI *uri = JavaNetURI_createWithNSString_(url);
  if ([((NSString *) nil_chk([((NSString *) nil_chk([((JavaNetURI *) nil_chk(uri)) getScheme])) lowercaseString])) isEqual:@"ssl"] || [((NSString *) nil_chk([((NSString *) nil_chk([uri getScheme])) lowercaseString])) isEqual:@"tls"]) {
    jint port = [uri getPort] > 0 ? [uri getPort] : 443;
    NSString *host = [uri getHost];
    [((JavaUtilArrayList *) nil_chk(endpoints_)) addWithId:[[AMConnectionEndpoint alloc] initWithNSString:host withInt:port withAMConnectionEndpoint_TypeEnum:AMConnectionEndpoint_TypeEnum_get_TCP_TLS()]];
  }
  else if ([((NSString *) nil_chk([((NSString *) nil_chk([uri getScheme])) lowercaseString])) isEqual:@"tcp"]) {
    jint port = [uri getPort] > 0 ? [uri getPort] : 80;
    NSString *host = [uri getHost];
    [((JavaUtilArrayList *) nil_chk(endpoints_)) addWithId:[[AMConnectionEndpoint alloc] initWithNSString:host withInt:port withAMConnectionEndpoint_TypeEnum:AMConnectionEndpoint_TypeEnum_get_TCP()]];
  }
  else if ([((NSString *) nil_chk([((NSString *) nil_chk([uri getScheme])) lowercaseString])) isEqual:@"ws"]) {
    jint port = [uri getPort] > 0 ? [uri getPort] : 80;
    NSString *host = [uri getHost];
    [((JavaUtilArrayList *) nil_chk(endpoints_)) addWithId:[[AMConnectionEndpoint alloc] initWithNSString:host withInt:port withAMConnectionEndpoint_TypeEnum:AMConnectionEndpoint_TypeEnum_get_WS()]];
  }
  else if ([((NSString *) nil_chk([((NSString *) nil_chk([uri getScheme])) lowercaseString])) isEqual:@"wss"]) {
    jint port = [uri getPort] > 0 ? [uri getPort] : 443;
    NSString *host = [uri getHost];
    [((JavaUtilArrayList *) nil_chk(endpoints_)) addWithId:[[AMConnectionEndpoint alloc] initWithNSString:host withInt:port withAMConnectionEndpoint_TypeEnum:AMConnectionEndpoint_TypeEnum_get_WS_TLS()]];
  }
  else {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:JreStrcat("$$", @"Unknown scheme type: ", [uri getScheme])];
  }
  return self;
}

- (AMConfigurationBuilder *)setMessagesPersisting:(jboolean)isMessagesPersisting {
  self->isMessagesPersisting_ = isMessagesPersisting;
  return self;
}

- (AMConfigurationBuilder *)setMainThread:(id<AMMainThread>)mainThread {
  self->mainThread_ = mainThread;
  return self;
}

- (AMConfiguration *)build {
  if (networking_ == nil) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:@"Networking is not set"];
  }
  if (threading_ == nil) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:@"Threading is not set"];
  }
  if (mainThread_ == nil) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:@"Main Thread is not set"];
  }
  if (callback_ == nil) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:@"Callback is not set"];
  }
  if (enginesFactory_ == nil) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:@"Storage not set"];
  }
  if ([((JavaUtilArrayList *) nil_chk(endpoints_)) size] == 0) {
    @throw [[JavaLangRuntimeException alloc] initWithNSString:@"Endpoints not set"];
  }
  return [[AMConfiguration alloc] initWithAMNetworking:networking_ withAMConnectionEndpointArray:[endpoints_ toArrayWithNSObjectArray:[IOSObjectArray newArrayWithLength:[endpoints_ size] type:AMConnectionEndpoint_class_()]] withAMThreading:threading_ withAMMainThread:mainThread_ withAMStorage:enginesFactory_ withAMMessengerCallback:callback_ withAMLogCallback:log_];
}

- (instancetype)init {
  if (self = [super init]) {
    endpoints_ = [[JavaUtilArrayList alloc] init];
  }
  return self;
}

- (void)copyAllFieldsTo:(AMConfigurationBuilder *)other {
  [super copyAllFieldsTo:other];
  other->log_ = log_;
  other->networking_ = networking_;
  other->threading_ = threading_;
  other->mainThread_ = mainThread_;
  other->enginesFactory_ = enginesFactory_;
  other->callback_ = callback_;
  other->endpoints_ = endpoints_;
  other->isMessagesPersisting_ = isMessagesPersisting_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "setLog:", "setLog", "Lim.actor.model.ConfigurationBuilder;", 0x1, NULL },
    { "setNetworking:", "setNetworking", "Lim.actor.model.ConfigurationBuilder;", 0x1, NULL },
    { "setThreading:", "setThreading", "Lim.actor.model.ConfigurationBuilder;", 0x1, NULL },
    { "setStorage:", "setStorage", "Lim.actor.model.ConfigurationBuilder;", 0x1, NULL },
    { "setCallback:", "setCallback", "Lim.actor.model.ConfigurationBuilder;", 0x1, NULL },
    { "addEndpoint:", "addEndpoint", "Lim.actor.model.ConfigurationBuilder;", 0x1, NULL },
    { "setMessagesPersisting:", "setMessagesPersisting", "Lim.actor.model.ConfigurationBuilder;", 0x1, NULL },
    { "setMainThread:", "setMainThread", "Lim.actor.model.ConfigurationBuilder;", 0x1, NULL },
    { "build", NULL, "Lim.actor.model.Configuration;", 0x1, NULL },
    { "init", NULL, NULL, 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "log_", NULL, 0x2, "Lim.actor.model.LogCallback;", NULL,  },
    { "networking_", NULL, 0x2, "Lim.actor.model.Networking;", NULL,  },
    { "threading_", NULL, 0x2, "Lim.actor.model.Threading;", NULL,  },
    { "mainThread_", NULL, 0x2, "Lim.actor.model.MainThread;", NULL,  },
    { "enginesFactory_", NULL, 0x2, "Lim.actor.model.Storage;", NULL,  },
    { "callback_", NULL, 0x2, "Lim.actor.model.MessengerCallback;", NULL,  },
    { "endpoints_", NULL, 0x2, "Ljava.util.ArrayList;", NULL,  },
    { "isMessagesPersisting_", NULL, 0x2, "Z", NULL,  },
  };
  static const J2ObjcClassInfo _AMConfigurationBuilder = { 1, "ConfigurationBuilder", "im.actor.model", NULL, 0x1, 10, methods, 8, fields, 0, NULL};
  return &_AMConfigurationBuilder;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMConfigurationBuilder)
