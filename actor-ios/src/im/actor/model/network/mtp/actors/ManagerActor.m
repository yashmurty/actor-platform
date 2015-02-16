//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/network/mtp/actors/ManagerActor.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/Networking.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorSelection.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Environment.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/log/Log.h"
#include "im/actor/model/network/Connection.h"
#include "im/actor/model/network/ConnectionEndpoint.h"
#include "im/actor/model/network/Endpoints.h"
#include "im/actor/model/network/mtp/MTProto.h"
#include "im/actor/model/network/mtp/actors/ManagerActor.h"
#include "im/actor/model/network/mtp/actors/ReceiverActor.h"
#include "im/actor/model/network/mtp/actors/SenderActor.h"
#include "im/actor/model/network/mtp/entity/ProtoMessage.h"
#include "im/actor/model/util/AtomicIntegerCompat.h"
#include "im/actor/model/util/DataInput.h"
#include "im/actor/model/util/DataOutput.h"
#include "im/actor/model/util/ExponentialBackoff.h"
#include "java/io/IOException.h"

__attribute__((unused)) static void MTManagerActor_onConnectionCreatedWithInt_withAMConnection_(MTManagerActor *self, jint id_, id<AMConnection> connection);
__attribute__((unused)) static void MTManagerActor_onConnectionCreateFailure(MTManagerActor *self);
__attribute__((unused)) static void MTManagerActor_onConnectionDieWithInt_(MTManagerActor *self, jint id_);
__attribute__((unused)) static void MTManagerActor_onNetworkChanged(MTManagerActor *self);
__attribute__((unused)) static void MTManagerActor_requestCheckConnection(MTManagerActor *self);
__attribute__((unused)) static void MTManagerActor_requestCheckConnectionWithLong_(MTManagerActor *self, jlong wait);
__attribute__((unused)) static void MTManagerActor_checkConnection(MTManagerActor *self);
__attribute__((unused)) static void MTManagerActor_onInMessageWithByteArray_withInt_withInt_(MTManagerActor *self, IOSByteArray *data, jint offset, jint len);
__attribute__((unused)) static void MTManagerActor_onOutMessageWithByteArray_withInt_withInt_(MTManagerActor *self, IOSByteArray *data, jint offset, jint len);

@interface MTManagerActor () {
 @public
  MTMTProto *mtProto_;
  AMEndpoints *endpoints_;
  jlong authId_;
  jlong sessionId_;
  jint currentConnectionId_;
  id<AMConnection> currentConnection_;
  jboolean isCheckingConnections_;
  AMExponentialBackoff *backoff_;
  DKActorRef *receiver_;
  DKActorRef *sender_;
}

- (void)onConnectionCreatedWithInt:(jint)id_
                  withAMConnection:(id<AMConnection>)connection;

- (void)onConnectionCreateFailure;

- (void)onConnectionDieWithInt:(jint)id_;

- (void)onNetworkChanged;

- (void)requestCheckConnection;

- (void)requestCheckConnectionWithLong:(jlong)wait;

- (void)checkConnection;

- (void)onInMessageWithByteArray:(IOSByteArray *)data
                         withInt:(jint)offset
                         withInt:(jint)len;

- (void)onOutMessageWithByteArray:(IOSByteArray *)data
                          withInt:(jint)offset
                          withInt:(jint)len;
@end

J2OBJC_FIELD_SETTER(MTManagerActor, mtProto_, MTMTProto *)
J2OBJC_FIELD_SETTER(MTManagerActor, endpoints_, AMEndpoints *)
J2OBJC_FIELD_SETTER(MTManagerActor, currentConnection_, id<AMConnection>)
J2OBJC_FIELD_SETTER(MTManagerActor, backoff_, AMExponentialBackoff *)
J2OBJC_FIELD_SETTER(MTManagerActor, receiver_, DKActorRef *)
J2OBJC_FIELD_SETTER(MTManagerActor, sender_, DKActorRef *)

@interface MTManagerActor_OutMessage () {
 @public
  IOSByteArray *message_;
  jint offset_;
  jint len_;
}
@end

J2OBJC_FIELD_SETTER(MTManagerActor_OutMessage, message_, IOSByteArray *)

@interface MTManagerActor_InMessage () {
 @public
  IOSByteArray *data_;
  jint offset_;
  jint len_;
}
@end

J2OBJC_FIELD_SETTER(MTManagerActor_InMessage, data_, IOSByteArray *)

@interface MTManagerActor_PerformConnectionCheck ()
- (instancetype)init;
@end

@interface MTManagerActor_ConnectionDie () {
 @public
  jint connectionId_;
}
@end

@interface MTManagerActor_ConnectionCreateFailure ()
- (instancetype)init;
@end

@interface MTManagerActor_ConnectionCreated () {
 @public
  jint connectionId_;
  id<AMConnection> connection_;
}
@end

J2OBJC_FIELD_SETTER(MTManagerActor_ConnectionCreated, connection_, id<AMConnection>)

@interface MTManagerActor_$1 () {
 @public
  MTMTProto *val$mtProto_;
}
@end

J2OBJC_FIELD_SETTER(MTManagerActor_$1, val$mtProto_, MTMTProto *)

@interface MTManagerActor_$2 () {
 @public
  MTManagerActor *this$0_;
  jint val$id_;
}
@end

J2OBJC_FIELD_SETTER(MTManagerActor_$2, this$0_, MTManagerActor *)

@interface MTManagerActor_$3 () {
 @public
  MTManagerActor *this$0_;
  jint val$id_;
}
@end

J2OBJC_FIELD_SETTER(MTManagerActor_$3, this$0_, MTManagerActor *)

BOOL MTManagerActor_initialized = NO;

@implementation MTManagerActor

NSString * MTManagerActor_TAG_ = @"Manager";
AMAtomicIntegerCompat * MTManagerActor_NEXT_CONNECTION_;

+ (DKActorRef *)managerWithMTMTProto:(MTMTProto *)mtProto {
  return MTManagerActor_managerWithMTMTProto_(mtProto);
}

- (instancetype)initWithMTMTProto:(MTMTProto *)mtProto {
  if (self = [super init]) {
    isCheckingConnections_ = NO;
    backoff_ = [[AMExponentialBackoff alloc] init];
    self->mtProto_ = mtProto;
    self->endpoints_ = [((MTMTProto *) nil_chk(mtProto)) getEndpoints];
    self->authId_ = [mtProto getAuthId];
    self->sessionId_ = [mtProto getSessionId];
  }
  return self;
}

- (void)preStart {
  receiver_ = MTReceiverActor_receiverWithMTMTProto_(mtProto_);
  sender_ = MTSenderActor_senderActorWithMTMTProto_(mtProto_);
  MTManagerActor_checkConnection(self);
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[MTManagerActor_ConnectionCreated class]]) {
    MTManagerActor_ConnectionCreated *c = (MTManagerActor_ConnectionCreated *) check_class_cast(message, [MTManagerActor_ConnectionCreated class]);
    MTManagerActor_onConnectionCreatedWithInt_withAMConnection_(self, ((MTManagerActor_ConnectionCreated *) nil_chk(c))->connectionId_, c->connection_);
  }
  else if ([message isKindOfClass:[MTManagerActor_ConnectionCreateFailure class]]) {
    MTManagerActor_onConnectionCreateFailure(self);
  }
  else if ([message isKindOfClass:[MTManagerActor_ConnectionDie class]]) {
    MTManagerActor_onConnectionDieWithInt_(self, ((MTManagerActor_ConnectionDie *) nil_chk(((MTManagerActor_ConnectionDie *) check_class_cast(message, [MTManagerActor_ConnectionDie class]))))->connectionId_);
  }
  else if ([message isKindOfClass:[MTManagerActor_PerformConnectionCheck class]]) {
    MTManagerActor_checkConnection(self);
  }
  else if ([message isKindOfClass:[MTManagerActor_NetworkChanged class]]) {
    MTManagerActor_onNetworkChanged(self);
  }
  else if ([message isKindOfClass:[MTManagerActor_OutMessage class]]) {
    MTManagerActor_OutMessage *m = (MTManagerActor_OutMessage *) check_class_cast(message, [MTManagerActor_OutMessage class]);
    MTManagerActor_onOutMessageWithByteArray_withInt_withInt_(self, ((MTManagerActor_OutMessage *) nil_chk(m))->message_, m->offset_, m->len_);
  }
  else if ([message isKindOfClass:[MTManagerActor_InMessage class]]) {
    MTManagerActor_InMessage *m = (MTManagerActor_InMessage *) check_class_cast(message, [MTManagerActor_InMessage class]);
    MTManagerActor_onInMessageWithByteArray_withInt_withInt_(self, ((MTManagerActor_InMessage *) nil_chk(m))->data_, m->offset_, m->len_);
  }
}

- (void)onConnectionCreatedWithInt:(jint)id_
                  withAMConnection:(id<AMConnection>)connection {
  MTManagerActor_onConnectionCreatedWithInt_withAMConnection_(self, id_, connection);
}

- (void)onConnectionCreateFailure {
  MTManagerActor_onConnectionCreateFailure(self);
}

- (void)onConnectionDieWithInt:(jint)id_ {
  MTManagerActor_onConnectionDieWithInt_(self, id_);
}

- (void)onNetworkChanged {
  MTManagerActor_onNetworkChanged(self);
}

- (void)requestCheckConnection {
  MTManagerActor_requestCheckConnection(self);
}

- (void)requestCheckConnectionWithLong:(jlong)wait {
  MTManagerActor_requestCheckConnectionWithLong_(self, wait);
}

- (void)checkConnection {
  MTManagerActor_checkConnection(self);
}

- (void)onInMessageWithByteArray:(IOSByteArray *)data
                         withInt:(jint)offset
                         withInt:(jint)len {
  MTManagerActor_onInMessageWithByteArray_withInt_withInt_(self, data, offset, len);
}

- (void)onOutMessageWithByteArray:(IOSByteArray *)data
                          withInt:(jint)offset
                          withInt:(jint)len {
  MTManagerActor_onOutMessageWithByteArray_withInt_withInt_(self, data, offset, len);
}

- (void)copyAllFieldsTo:(MTManagerActor *)other {
  [super copyAllFieldsTo:other];
  other->mtProto_ = mtProto_;
  other->endpoints_ = endpoints_;
  other->authId_ = authId_;
  other->sessionId_ = sessionId_;
  other->currentConnectionId_ = currentConnectionId_;
  other->currentConnection_ = currentConnection_;
  other->isCheckingConnections_ = isCheckingConnections_;
  other->backoff_ = backoff_;
  other->receiver_ = receiver_;
  other->sender_ = sender_;
}

+ (void)initialize {
  if (self == [MTManagerActor class]) {
    MTManagerActor_NEXT_CONNECTION_ = DKEnvironment_createAtomicIntWithInt_(1);
    J2OBJC_SET_INITIALIZED(MTManagerActor)
  }
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "managerWithMTMTProto:", "manager", "Lim.actor.model.droidkit.actors.ActorRef;", 0x9, NULL },
    { "initWithMTMTProto:", "ManagerActor", NULL, 0x1, NULL },
    { "preStart", NULL, "V", 0x1, NULL },
    { "onReceiveWithId:", "onReceive", "V", 0x1, NULL },
    { "onConnectionCreatedWithInt:withAMConnection:", "onConnectionCreated", "V", 0x2, NULL },
    { "onConnectionCreateFailure", NULL, "V", 0x2, NULL },
    { "onConnectionDieWithInt:", "onConnectionDie", "V", 0x2, NULL },
    { "onNetworkChanged", NULL, "V", 0x2, NULL },
    { "requestCheckConnection", NULL, "V", 0x2, NULL },
    { "requestCheckConnectionWithLong:", "requestCheckConnection", "V", 0x2, NULL },
    { "checkConnection", NULL, "V", 0x2, NULL },
    { "onInMessageWithByteArray:withInt:withInt:", "onInMessage", "V", 0x2, NULL },
    { "onOutMessageWithByteArray:withInt:withInt:", "onOutMessage", "V", 0x2, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "TAG_", NULL, 0x1a, "Ljava.lang.String;", &MTManagerActor_TAG_,  },
    { "NEXT_CONNECTION_", NULL, 0x1a, "Lim.actor.model.util.AtomicIntegerCompat;", &MTManagerActor_NEXT_CONNECTION_,  },
    { "mtProto_", NULL, 0x12, "Lim.actor.model.network.mtp.MTProto;", NULL,  },
    { "endpoints_", NULL, 0x12, "Lim.actor.model.network.Endpoints;", NULL,  },
    { "authId_", NULL, 0x12, "J", NULL,  },
    { "sessionId_", NULL, 0x12, "J", NULL,  },
    { "currentConnectionId_", NULL, 0x2, "I", NULL,  },
    { "currentConnection_", NULL, 0x2, "Lim.actor.model.network.Connection;", NULL,  },
    { "isCheckingConnections_", NULL, 0x2, "Z", NULL,  },
    { "backoff_", NULL, 0x12, "Lim.actor.model.util.ExponentialBackoff;", NULL,  },
    { "receiver_", NULL, 0x2, "Lim.actor.model.droidkit.actors.ActorRef;", NULL,  },
    { "sender_", NULL, 0x2, "Lim.actor.model.droidkit.actors.ActorRef;", NULL,  },
  };
  static const J2ObjcClassInfo _MTManagerActor = { 1, "ManagerActor", "im.actor.model.network.mtp.actors", NULL, 0x1, 13, methods, 12, fields, 0, NULL};
  return &_MTManagerActor;
}

@end

DKActorRef *MTManagerActor_managerWithMTMTProto_(MTMTProto *mtProto) {
  MTManagerActor_init();
  return [((DKActorSystem *) nil_chk(DKActorSystem_system())) actorOfWithDKActorSelection:[[DKActorSelection alloc] initWithDKProps:DKProps_createWithIOSClass_withDKActorCreator_(MTManagerActor_class_(), [[MTManagerActor_$1 alloc] initWithMTMTProto:mtProto]) withNSString:JreStrcat("$$", [((MTMTProto *) nil_chk(mtProto)) getActorPath], @"/manager")]];
}

void MTManagerActor_onConnectionCreatedWithInt_withAMConnection_(MTManagerActor *self, jint id_, id<AMConnection> connection) {
  AMLog_dWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$I$", @"Connection #", id_, @" created"));
  if ([((id<AMConnection>) nil_chk(connection)) isClosed]) {
    AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$I$", @"Unable to register connection #", id_, @": already closed"));
    return;
  }
  if (self->currentConnectionId_ == id_) {
    AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$I$", @"Unable to register connection #", id_, @": already have connection"));
    return;
  }
  if (self->currentConnection_ != nil) {
    [self->currentConnection_ close];
    self->currentConnectionId_ = 0;
  }
  self->currentConnectionId_ = id_;
  self->currentConnection_ = connection;
  [((AMExponentialBackoff *) nil_chk(self->backoff_)) onSuccess];
  self->isCheckingConnections_ = NO;
  MTManagerActor_requestCheckConnection(self);
  [((DKActorRef *) nil_chk(self->sender_)) sendWithId:[[MTSenderActor_ConnectionCreated alloc] init]];
}

void MTManagerActor_onConnectionCreateFailure(MTManagerActor *self) {
  AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, @"Connection create failure");
  [((AMExponentialBackoff *) nil_chk(self->backoff_)) onFailure];
  self->isCheckingConnections_ = NO;
  MTManagerActor_requestCheckConnectionWithLong_(self, [self->backoff_ exponentialWait]);
}

void MTManagerActor_onConnectionDieWithInt_(MTManagerActor *self, jint id_) {
  AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$I$", @"Connection #", id_, @" dies"));
  if (self->currentConnectionId_ == id_) {
    self->currentConnectionId_ = 0;
    self->currentConnection_ = nil;
    MTManagerActor_requestCheckConnection(self);
  }
  else {
    AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$I$", @"Unable to unregister connection #", id_, @": connection not found"));
  }
}

void MTManagerActor_onNetworkChanged(MTManagerActor *self) {
  AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, @"Network configuration changed");
  [((AMExponentialBackoff *) nil_chk(self->backoff_)) reset];
  MTManagerActor_checkConnection(self);
}

void MTManagerActor_requestCheckConnection(MTManagerActor *self) {
  MTManagerActor_requestCheckConnectionWithLong_(self, 0);
}

void MTManagerActor_requestCheckConnectionWithLong_(MTManagerActor *self, jlong wait) {
  if (!self->isCheckingConnections_) {
    if (self->currentConnection_ == nil) {
      if (wait == 0) {
        AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, @"Requesting connection creating");
      }
      else {
        AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, JreStrcat("$J$", @"Requesting connection creating in ", wait, @" ms"));
      }
    }
    [((DKActorRef *) nil_chk([self self__])) sendOnceWithId:[[MTManagerActor_PerformConnectionCheck alloc] init] withLong:wait];
  }
}

void MTManagerActor_checkConnection(MTManagerActor *self) {
  if (self->isCheckingConnections_) {
    return;
  }
  if (self->currentConnection_ == nil) {
    AMLog_dWithNSString_withNSString_(MTManagerActor_TAG_, @"Trying to create connection...");
    self->isCheckingConnections_ = YES;
    jint id_ = [((AMAtomicIntegerCompat *) nil_chk(MTManagerActor_NEXT_CONNECTION_)) getAndIncrement];
    [((id<AMNetworking>) nil_chk([((MTMTProto *) nil_chk(self->mtProto_)) getNetworking])) createConnection:id_ withEndpoint:[((AMEndpoints *) nil_chk(self->endpoints_)) fetchEndpoint] withCallback:[[MTManagerActor_$2 alloc] initWithMTManagerActor:self withInt:id_] withCreateCallback:[[MTManagerActor_$3 alloc] initWithMTManagerActor:self withInt:id_]];
  }
}

void MTManagerActor_onInMessageWithByteArray_withInt_withInt_(MTManagerActor *self, IOSByteArray *data, jint offset, jint len) {
  AMDataInput *bis = [[AMDataInput alloc] initWithByteArray:data withInt:offset withInt:len];
  @try {
    jlong authId = [bis readLong];
    jlong sessionId = [bis readLong];
    if (authId != self->authId_ || sessionId != self->sessionId_) {
      @throw [[JavaIoIOException alloc] initWithNSString:@"Incorrect header"];
    }
    jlong messageId = [bis readLong];
    IOSByteArray *payload = [bis readProtoBytes];
    [((DKActorRef *) nil_chk(self->receiver_)) sendWithId:[[MTProtoMessage alloc] initWithLong:messageId withByteArray:payload]];
  }
  @catch (JavaIoIOException *e) {
    AMLog_wWithNSString_withNSString_(MTManagerActor_TAG_, @"Closing connection: incorrect package");
    [((JavaIoIOException *) nil_chk(e)) printStackTrace];
    if (self->currentConnection_ != nil) {
      [self->currentConnection_ close];
      self->currentConnection_ = nil;
      self->currentConnectionId_ = 0;
    }
  }
}

void MTManagerActor_onOutMessageWithByteArray_withInt_withInt_(MTManagerActor *self, IOSByteArray *data, jint offset, jint len) {
  if (self->currentConnection_ != nil && [self->currentConnection_ isClosed]) {
    self->currentConnection_ = nil;
    self->currentConnectionId_ = 0;
  }
  if (self->currentConnection_ != nil) {
    AMDataOutput *bos = [[AMDataOutput alloc] init];
    [bos writeLongWithLong:self->authId_];
    [bos writeLongWithLong:self->sessionId_];
    [bos writeBytesWithByteArray:data withInt:offset withInt:len];
    IOSByteArray *pkg = [bos toByteArray];
    [self->currentConnection_ post:pkg withOffset:0 withLen:((IOSByteArray *) nil_chk(pkg))->size_];
  }
  else {
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor)

@implementation MTManagerActor_OutMessage

- (instancetype)initWithByteArray:(IOSByteArray *)message
                          withInt:(jint)offset
                          withInt:(jint)len {
  if (self = [super init]) {
    self->message_ = message;
    self->offset_ = offset;
    self->len_ = len;
  }
  return self;
}

- (jint)getOffset {
  return offset_;
}

- (jint)getLen {
  return len_;
}

- (IOSByteArray *)getMessage {
  return message_;
}

- (void)copyAllFieldsTo:(MTManagerActor_OutMessage *)other {
  [super copyAllFieldsTo:other];
  other->message_ = message_;
  other->offset_ = offset_;
  other->len_ = len_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithByteArray:withInt:withInt:", "OutMessage", NULL, 0x1, NULL },
    { "getOffset", NULL, "I", 0x1, NULL },
    { "getLen", NULL, "I", 0x1, NULL },
    { "getMessage", NULL, "[B", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "message_", NULL, 0x2, "[B", NULL,  },
    { "offset_", NULL, 0x2, "I", NULL,  },
    { "len_", NULL, 0x2, "I", NULL,  },
  };
  static const J2ObjcClassInfo _MTManagerActor_OutMessage = { 1, "OutMessage", "im.actor.model.network.mtp.actors", "ManagerActor", 0x9, 4, methods, 3, fields, 0, NULL};
  return &_MTManagerActor_OutMessage;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_OutMessage)

@implementation MTManagerActor_InMessage

- (instancetype)initWithByteArray:(IOSByteArray *)data
                          withInt:(jint)offset
                          withInt:(jint)len {
  if (self = [super init]) {
    self->data_ = data;
    self->offset_ = offset;
    self->len_ = len;
  }
  return self;
}

- (IOSByteArray *)getData {
  return data_;
}

- (jint)getOffset {
  return offset_;
}

- (jint)getLen {
  return len_;
}

- (void)copyAllFieldsTo:(MTManagerActor_InMessage *)other {
  [super copyAllFieldsTo:other];
  other->data_ = data_;
  other->offset_ = offset_;
  other->len_ = len_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithByteArray:withInt:withInt:", "InMessage", NULL, 0x1, NULL },
    { "getData", NULL, "[B", 0x1, NULL },
    { "getOffset", NULL, "I", 0x1, NULL },
    { "getLen", NULL, "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "data_", NULL, 0x2, "[B", NULL,  },
    { "offset_", NULL, 0x2, "I", NULL,  },
    { "len_", NULL, 0x2, "I", NULL,  },
  };
  static const J2ObjcClassInfo _MTManagerActor_InMessage = { 1, "InMessage", "im.actor.model.network.mtp.actors", "ManagerActor", 0x9, 4, methods, 3, fields, 0, NULL};
  return &_MTManagerActor_InMessage;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_InMessage)

@implementation MTManagerActor_NetworkChanged

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x1, NULL },
  };
  static const J2ObjcClassInfo _MTManagerActor_NetworkChanged = { 1, "NetworkChanged", "im.actor.model.network.mtp.actors", "ManagerActor", 0x9, 1, methods, 0, NULL, 0, NULL};
  return &_MTManagerActor_NetworkChanged;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_NetworkChanged)

@implementation MTManagerActor_PerformConnectionCheck

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x2, NULL },
  };
  static const J2ObjcClassInfo _MTManagerActor_PerformConnectionCheck = { 1, "PerformConnectionCheck", "im.actor.model.network.mtp.actors", "ManagerActor", 0xa, 1, methods, 0, NULL, 0, NULL};
  return &_MTManagerActor_PerformConnectionCheck;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_PerformConnectionCheck)

@implementation MTManagerActor_ConnectionDie

- (instancetype)initWithInt:(jint)connectionId {
  if (self = [super init]) {
    self->connectionId_ = connectionId;
  }
  return self;
}

- (jint)getConnectionId {
  return connectionId_;
}

- (void)copyAllFieldsTo:(MTManagerActor_ConnectionDie *)other {
  [super copyAllFieldsTo:other];
  other->connectionId_ = connectionId_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithInt:", "ConnectionDie", NULL, 0x1, NULL },
    { "getConnectionId", NULL, "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "connectionId_", NULL, 0x2, "I", NULL,  },
  };
  static const J2ObjcClassInfo _MTManagerActor_ConnectionDie = { 1, "ConnectionDie", "im.actor.model.network.mtp.actors", "ManagerActor", 0xa, 2, methods, 1, fields, 0, NULL};
  return &_MTManagerActor_ConnectionDie;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_ConnectionDie)

@implementation MTManagerActor_ConnectionCreateFailure

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x2, NULL },
  };
  static const J2ObjcClassInfo _MTManagerActor_ConnectionCreateFailure = { 1, "ConnectionCreateFailure", "im.actor.model.network.mtp.actors", "ManagerActor", 0xa, 1, methods, 0, NULL, 0, NULL};
  return &_MTManagerActor_ConnectionCreateFailure;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_ConnectionCreateFailure)

@implementation MTManagerActor_ConnectionCreated

- (instancetype)initWithInt:(jint)connectionId
           withAMConnection:(id<AMConnection>)connection {
  if (self = [super init]) {
    self->connectionId_ = connectionId;
    self->connection_ = connection;
  }
  return self;
}

- (jint)getConnectionId {
  return connectionId_;
}

- (id<AMConnection>)getConnection {
  return connection_;
}

- (void)copyAllFieldsTo:(MTManagerActor_ConnectionCreated *)other {
  [super copyAllFieldsTo:other];
  other->connectionId_ = connectionId_;
  other->connection_ = connection_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithInt:withAMConnection:", "ConnectionCreated", NULL, 0x1, NULL },
    { "getConnectionId", NULL, "I", 0x1, NULL },
    { "getConnection", NULL, "Lim.actor.model.network.Connection;", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "connectionId_", NULL, 0x2, "I", NULL,  },
    { "connection_", NULL, 0x2, "Lim.actor.model.network.Connection;", NULL,  },
  };
  static const J2ObjcClassInfo _MTManagerActor_ConnectionCreated = { 1, "ConnectionCreated", "im.actor.model.network.mtp.actors", "ManagerActor", 0xa, 3, methods, 2, fields, 0, NULL};
  return &_MTManagerActor_ConnectionCreated;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_ConnectionCreated)

@implementation MTManagerActor_$1

- (MTManagerActor *)create {
  return [[MTManagerActor alloc] initWithMTMTProto:val$mtProto_];
}

- (instancetype)initWithMTMTProto:(MTMTProto *)capture$0 {
  val$mtProto_ = capture$0;
  return [super init];
}

- (void)copyAllFieldsTo:(MTManagerActor_$1 *)other {
  [super copyAllFieldsTo:other];
  other->val$mtProto_ = val$mtProto_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "create", NULL, "Lim.actor.model.network.mtp.actors.ManagerActor;", 0x1, NULL },
    { "initWithMTMTProto:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "val$mtProto_", NULL, 0x1012, "Lim.actor.model.network.mtp.MTProto;", NULL,  },
  };
  static const J2ObjcClassInfo _MTManagerActor_$1 = { 1, "$1", "im.actor.model.network.mtp.actors", "ManagerActor", 0x8000, 2, methods, 1, fields, 0, NULL};
  return &_MTManagerActor_$1;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_$1)

@implementation MTManagerActor_$2

- (void)onMessageWithByteArray:(IOSByteArray *)data
                       withInt:(jint)offset
                       withInt:(jint)len {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:[[MTManagerActor_InMessage alloc] initWithByteArray:data withInt:offset withInt:len]];
}

- (void)onConnectionDie {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:[[MTManagerActor_ConnectionDie alloc] initWithInt:val$id_]];
}

- (instancetype)initWithMTManagerActor:(MTManagerActor *)outer$
                               withInt:(jint)capture$0 {
  this$0_ = outer$;
  val$id_ = capture$0;
  return [super init];
}

- (void)copyAllFieldsTo:(MTManagerActor_$2 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
  other->val$id_ = val$id_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "onMessageWithByteArray:withInt:withInt:", "onMessage", "V", 0x1, NULL },
    { "onConnectionDie", NULL, "V", 0x1, NULL },
    { "initWithMTManagerActor:withInt:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lim.actor.model.network.mtp.actors.ManagerActor;", NULL,  },
    { "val$id_", NULL, 0x1012, "I", NULL,  },
  };
  static const J2ObjcClassInfo _MTManagerActor_$2 = { 1, "$2", "im.actor.model.network.mtp.actors", "ManagerActor", 0x8000, 3, methods, 2, fields, 0, NULL};
  return &_MTManagerActor_$2;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_$2)

@implementation MTManagerActor_$3

- (void)onConnectionCreatedWithAMConnection:(id<AMConnection>)connection {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:[[MTManagerActor_ConnectionCreated alloc] initWithInt:val$id_ withAMConnection:connection]];
}

- (void)onConnectionCreateError {
  [((DKActorRef *) nil_chk([this$0_ self__])) sendWithId:[[MTManagerActor_ConnectionCreateFailure alloc] init]];
}

- (instancetype)initWithMTManagerActor:(MTManagerActor *)outer$
                               withInt:(jint)capture$0 {
  this$0_ = outer$;
  val$id_ = capture$0;
  return [super init];
}

- (void)copyAllFieldsTo:(MTManagerActor_$3 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
  other->val$id_ = val$id_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "onConnectionCreatedWithAMConnection:", "onConnectionCreated", "V", 0x1, NULL },
    { "onConnectionCreateError", NULL, "V", 0x1, NULL },
    { "initWithMTManagerActor:withInt:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lim.actor.model.network.mtp.actors.ManagerActor;", NULL,  },
    { "val$id_", NULL, 0x1012, "I", NULL,  },
  };
  static const J2ObjcClassInfo _MTManagerActor_$3 = { 1, "$3", "im.actor.model.network.mtp.actors", "ManagerActor", 0x8000, 3, methods, 2, fields, 0, NULL};
  return &_MTManagerActor_$3;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTManagerActor_$3)
