//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/network/mtp/actors/SenderActor.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorSelection.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/network/mtp/MTProto.h"
#include "im/actor/model/network/mtp/actors/ManagerActor.h"
#include "im/actor/model/network/mtp/actors/SenderActor.h"
#include "im/actor/model/network/mtp/entity/Container.h"
#include "im/actor/model/network/mtp/entity/MessageAck.h"
#include "im/actor/model/network/mtp/entity/ProtoMessage.h"
#include "im/actor/model/network/util/MTUids.h"
#include "java/lang/Long.h"
#include "java/util/ArrayList.h"
#include "java/util/Collection.h"
#include "java/util/HashMap.h"
#include "java/util/HashSet.h"
#include "java/util/List.h"

__attribute__((unused)) static MTMessageAck *MTSenderActor_buildAck(MTSenderActor *self);
__attribute__((unused)) static void MTSenderActor_doSendWithJavaUtilList_(MTSenderActor *self, id<JavaUtilList> items);
__attribute__((unused)) static void MTSenderActor_doSendWithMTProtoMessage_(MTSenderActor *self, MTProtoMessage *message);
__attribute__((unused)) static void MTSenderActor_performSendWithMTProtoMessage_(MTSenderActor *self, MTProtoMessage *message);

@interface MTSenderActor () {
 @public
  MTMTProto *proto_;
  DKActorRef *manager_;
  JavaUtilHashMap *unsentPackages_;
  JavaUtilHashSet *confirm_;
}

- (MTMessageAck *)buildAck;

- (void)doSendWithJavaUtilList:(id<JavaUtilList>)items;

- (void)doSendWithMTProtoMessage:(MTProtoMessage *)message;

- (void)performSendWithMTProtoMessage:(MTProtoMessage *)message;
@end

J2OBJC_FIELD_SETTER(MTSenderActor, proto_, MTMTProto *)
J2OBJC_FIELD_SETTER(MTSenderActor, manager_, DKActorRef *)
J2OBJC_FIELD_SETTER(MTSenderActor, unsentPackages_, JavaUtilHashMap *)
J2OBJC_FIELD_SETTER(MTSenderActor, confirm_, JavaUtilHashSet *)

@interface MTSenderActor_SendMessage () {
 @public
  jlong mid_;
  IOSByteArray *message_;
}
@end

J2OBJC_FIELD_SETTER(MTSenderActor_SendMessage, message_, IOSByteArray *)

@interface MTSenderActor_ForgetMessage () {
 @public
  jlong mid_;
}
@end

@interface MTSenderActor_ConfirmMessage () {
 @public
  jlong mid_;
}
@end

@interface MTSenderActor_$1 () {
 @public
  MTMTProto *val$proto_;
}
@end

J2OBJC_FIELD_SETTER(MTSenderActor_$1, val$proto_, MTMTProto *)

@implementation MTSenderActor

NSString * MTSenderActor_TAG_ = @"ProtoSender";

+ (DKActorRef *)senderActorWithMTMTProto:(MTMTProto *)proto {
  return MTSenderActor_senderActorWithMTMTProto_(proto);
}

- (instancetype)initWithMTMTProto:(MTMTProto *)proto {
  if (self = [super init]) {
    self->proto_ = proto;
    self->unsentPackages_ = [[JavaUtilHashMap alloc] init];
    self->confirm_ = [[JavaUtilHashSet alloc] init];
  }
  return self;
}

- (void)preStart {
  manager_ = MTManagerActor_managerWithMTMTProto_(proto_);
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[MTSenderActor_SendMessage class]]) {
    MTSenderActor_SendMessage *sendMessage = (MTSenderActor_SendMessage *) check_class_cast(message, [MTSenderActor_SendMessage class]);
    MTProtoMessage *holder = [[MTProtoMessage alloc] initWithLong:((MTSenderActor_SendMessage *) nil_chk(sendMessage))->mid_ withByteArray:sendMessage->message_];
    (void) [((JavaUtilHashMap *) nil_chk(unsentPackages_)) putWithId:JavaLangLong_valueOfWithLong_([holder getMessageId]) withId:holder];
    MTSenderActor_doSendWithMTProtoMessage_(self, holder);
  }
  else if ([message isKindOfClass:[MTSenderActor_ConnectionCreated class]]) {
    JavaUtilArrayList *toSend = [[JavaUtilArrayList alloc] init];
    for (MTProtoMessage * __strong unsentPackage in nil_chk([((JavaUtilHashMap *) nil_chk(unsentPackages_)) values])) {
      [toSend addWithId:unsentPackage];
    }
    MTSenderActor_doSendWithJavaUtilList_(self, toSend);
  }
  else if ([message isKindOfClass:[MTSenderActor_ForgetMessage class]]) {
    (void) [((JavaUtilHashMap *) nil_chk(unsentPackages_)) removeWithId:JavaLangLong_valueOfWithLong_(((MTSenderActor_ForgetMessage *) nil_chk(((MTSenderActor_ForgetMessage *) check_class_cast(message, [MTSenderActor_ForgetMessage class]))))->mid_)];
  }
  else if ([message isKindOfClass:[MTSenderActor_ConfirmMessage class]]) {
    [((JavaUtilHashSet *) nil_chk(confirm_)) addWithId:JavaLangLong_valueOfWithLong_(((MTSenderActor_ConfirmMessage *) nil_chk(((MTSenderActor_ConfirmMessage *) check_class_cast(message, [MTSenderActor_ConfirmMessage class]))))->mid_)];
    if ([confirm_ size] >= MTSenderActor_ACK_THRESHOLD) {
      [((DKActorRef *) nil_chk([self self__])) sendOnceWithId:[[MTSenderActor_ForceAck alloc] init]];
    }
    else if ([confirm_ size] == 1) {
      [((DKActorRef *) nil_chk([self self__])) sendOnceWithId:[[MTSenderActor_ForceAck alloc] init] withLong:MTSenderActor_ACK_DELAY];
    }
  }
  else if ([message isKindOfClass:[MTSenderActor_ForceAck class]]) {
    if ([((JavaUtilHashSet *) nil_chk(confirm_)) size] == 0) {
      return;
    }
    MTMessageAck *messageAck = MTSenderActor_buildAck(self);
    [confirm_ clear];
    MTSenderActor_doSendWithMTProtoMessage_(self, [[MTProtoMessage alloc] initWithLong:ImActorModelNetworkUtilMTUids_nextId() withByteArray:[((MTMessageAck *) nil_chk(messageAck)) toByteArray]]);
  }
  else if ([message isKindOfClass:[MTSenderActor_NewSession class]]) {
    JavaUtilArrayList *toSend = [[JavaUtilArrayList alloc] init];
    for (MTProtoMessage * __strong unsentPackage in nil_chk([((JavaUtilHashMap *) nil_chk(unsentPackages_)) values])) {
      [toSend addWithId:unsentPackage];
    }
    MTSenderActor_doSendWithJavaUtilList_(self, toSend);
  }
}

- (MTMessageAck *)buildAck {
  return MTSenderActor_buildAck(self);
}

- (void)doSendWithJavaUtilList:(id<JavaUtilList>)items {
  MTSenderActor_doSendWithJavaUtilList_(self, items);
}

- (void)doSendWithMTProtoMessage:(MTProtoMessage *)message {
  MTSenderActor_doSendWithMTProtoMessage_(self, message);
}

- (void)performSendWithMTProtoMessage:(MTProtoMessage *)message {
  MTSenderActor_performSendWithMTProtoMessage_(self, message);
}

- (void)copyAllFieldsTo:(MTSenderActor *)other {
  [super copyAllFieldsTo:other];
  other->proto_ = proto_;
  other->manager_ = manager_;
  other->unsentPackages_ = unsentPackages_;
  other->confirm_ = confirm_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "senderActorWithMTMTProto:", "senderActor", "Lim.actor.model.droidkit.actors.ActorRef;", 0x9, NULL },
    { "initWithMTMTProto:", "SenderActor", NULL, 0x1, NULL },
    { "preStart", NULL, "V", 0x1, NULL },
    { "onReceiveWithId:", "onReceive", "V", 0x1, NULL },
    { "buildAck", NULL, "Lim.actor.model.network.mtp.entity.MessageAck;", 0x2, NULL },
    { "doSendWithJavaUtilList:", "doSend", "V", 0x2, NULL },
    { "doSendWithMTProtoMessage:", "doSend", "V", 0x2, NULL },
    { "performSendWithMTProtoMessage:", "performSend", "V", 0x2, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "TAG_", NULL, 0x1a, "Ljava.lang.String;", &MTSenderActor_TAG_,  },
    { "ACK_THRESHOLD_", NULL, 0x1a, "I", NULL, .constantValue.asInt = MTSenderActor_ACK_THRESHOLD },
    { "ACK_DELAY_", NULL, 0x1a, "I", NULL, .constantValue.asInt = MTSenderActor_ACK_DELAY },
    { "MAX_WORKLOAD_SIZE_", NULL, 0x1a, "I", NULL, .constantValue.asInt = MTSenderActor_MAX_WORKLOAD_SIZE },
    { "proto_", NULL, 0x2, "Lim.actor.model.network.mtp.MTProto;", NULL,  },
    { "manager_", NULL, 0x2, "Lim.actor.model.droidkit.actors.ActorRef;", NULL,  },
    { "unsentPackages_", NULL, 0x2, "Ljava.util.HashMap;", NULL,  },
    { "confirm_", NULL, 0x2, "Ljava.util.HashSet;", NULL,  },
  };
  static const J2ObjcClassInfo _MTSenderActor = { 1, "SenderActor", "im.actor.model.network.mtp.actors", NULL, 0x1, 8, methods, 8, fields, 0, NULL};
  return &_MTSenderActor;
}

@end

DKActorRef *MTSenderActor_senderActorWithMTMTProto_(MTMTProto *proto) {
  MTSenderActor_init();
  return [((DKActorSystem *) nil_chk(DKActorSystem_system())) actorOfWithDKActorSelection:[[DKActorSelection alloc] initWithDKProps:DKProps_createWithIOSClass_withDKActorCreator_(MTSenderActor_class_(), [[MTSenderActor_$1 alloc] initWithMTMTProto:proto]) withNSString:JreStrcat("$$", [((MTMTProto *) nil_chk(proto)) getActorPath], @"/sender")]];
}

MTMessageAck *MTSenderActor_buildAck(MTSenderActor *self) {
  IOSLongArray *ids = [IOSLongArray newArrayWithLength:[((JavaUtilHashSet *) nil_chk(self->confirm_)) size]];
  IOSObjectArray *ids2 = [self->confirm_ toArrayWithNSObjectArray:[IOSObjectArray newArrayWithLength:[self->confirm_ size] type:JavaLangLong_class_()]];
  for (jint i = 0; i < ids->size_; i++) {
    *IOSLongArray_GetRef(ids, i) = [((JavaLangLong *) nil_chk(IOSObjectArray_Get(nil_chk(ids2), i))) longLongValue];
  }
  return [[MTMessageAck alloc] initWithLongArray:ids];
}

void MTSenderActor_doSendWithJavaUtilList_(MTSenderActor *self, id<JavaUtilList> items) {
  if ([((id<JavaUtilList>) nil_chk(items)) size] > 0) {
    if ([((JavaUtilHashSet *) nil_chk(self->confirm_)) size] > 0) {
      [items addWithInt:0 withId:[[MTProtoMessage alloc] initWithLong:ImActorModelNetworkUtilMTUids_nextId() withByteArray:[((MTMessageAck *) nil_chk(MTSenderActor_buildAck(self))) toByteArray]]];
      [self->confirm_ clear];
    }
  }
  if ([items size] == 1) {
    MTSenderActor_doSendWithMTProtoMessage_(self, [items getWithInt:0]);
  }
  else if ([items size] > 1) {
    JavaUtilArrayList *messages = [[JavaUtilArrayList alloc] init];
    jint currentPayload = 0;
    for (jint i = 0; i < [items size]; i++) {
      MTProtoMessage *message = [items getWithInt:i];
      currentPayload += ((IOSByteArray *) nil_chk([((MTProtoMessage *) nil_chk(message)) getPayload]))->size_;
      [messages addWithId:message];
      if (currentPayload > MTSenderActor_MAX_WORKLOAD_SIZE) {
        MTContainer *container = [[MTContainer alloc] initWithMTProtoMessageArray:[messages toArrayWithNSObjectArray:[IOSObjectArray newArrayWithLength:[messages size] type:MTProtoMessage_class_()]]];
        MTSenderActor_performSendWithMTProtoMessage_(self, [[MTProtoMessage alloc] initWithLong:ImActorModelNetworkUtilMTUids_nextId() withByteArray:[container toByteArray]]);
        [messages clear];
        currentPayload = 0;
      }
    }
    if ([messages size] > 0) {
      MTContainer *container = [[MTContainer alloc] initWithMTProtoMessageArray:[messages toArrayWithNSObjectArray:[IOSObjectArray newArrayWithLength:[messages size] type:MTProtoMessage_class_()]]];
      MTSenderActor_performSendWithMTProtoMessage_(self, [[MTProtoMessage alloc] initWithLong:ImActorModelNetworkUtilMTUids_nextId() withByteArray:[container toByteArray]]);
    }
  }
}

void MTSenderActor_doSendWithMTProtoMessage_(MTSenderActor *self, MTProtoMessage *message) {
  if ([((JavaUtilHashSet *) nil_chk(self->confirm_)) size] > 0) {
    JavaUtilArrayList *mtpMessages = [[JavaUtilArrayList alloc] init];
    [mtpMessages addWithId:message];
    MTSenderActor_doSendWithJavaUtilList_(self, mtpMessages);
  }
  else {
    MTSenderActor_performSendWithMTProtoMessage_(self, message);
  }
}

void MTSenderActor_performSendWithMTProtoMessage_(MTSenderActor *self, MTProtoMessage *message) {
  IOSByteArray *data = [((MTProtoMessage *) nil_chk(message)) toByteArray];
  [((DKActorRef *) nil_chk(self->manager_)) sendWithId:[[MTManagerActor_OutMessage alloc] initWithByteArray:data withInt:0 withInt:((IOSByteArray *) nil_chk(data))->size_]];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTSenderActor)

@implementation MTSenderActor_SendMessage

- (instancetype)initWithLong:(jlong)rid
               withByteArray:(IOSByteArray *)message {
  if (self = [super init]) {
    self->mid_ = rid;
    self->message_ = message;
  }
  return self;
}

- (void)copyAllFieldsTo:(MTSenderActor_SendMessage *)other {
  [super copyAllFieldsTo:other];
  other->mid_ = mid_;
  other->message_ = message_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithLong:withByteArray:", "SendMessage", NULL, 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "mid_", NULL, 0x2, "J", NULL,  },
    { "message_", NULL, 0x2, "[B", NULL,  },
  };
  static const J2ObjcClassInfo _MTSenderActor_SendMessage = { 1, "SendMessage", "im.actor.model.network.mtp.actors", "SenderActor", 0x9, 1, methods, 2, fields, 0, NULL};
  return &_MTSenderActor_SendMessage;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTSenderActor_SendMessage)

@implementation MTSenderActor_ForgetMessage

- (instancetype)initWithLong:(jlong)rid {
  if (self = [super init]) {
    self->mid_ = rid;
  }
  return self;
}

- (void)copyAllFieldsTo:(MTSenderActor_ForgetMessage *)other {
  [super copyAllFieldsTo:other];
  other->mid_ = mid_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithLong:", "ForgetMessage", NULL, 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "mid_", NULL, 0x2, "J", NULL,  },
  };
  static const J2ObjcClassInfo _MTSenderActor_ForgetMessage = { 1, "ForgetMessage", "im.actor.model.network.mtp.actors", "SenderActor", 0x9, 1, methods, 1, fields, 0, NULL};
  return &_MTSenderActor_ForgetMessage;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTSenderActor_ForgetMessage)

@implementation MTSenderActor_ConfirmMessage

- (instancetype)initWithLong:(jlong)rid {
  if (self = [super init]) {
    self->mid_ = rid;
  }
  return self;
}

- (void)copyAllFieldsTo:(MTSenderActor_ConfirmMessage *)other {
  [super copyAllFieldsTo:other];
  other->mid_ = mid_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithLong:", "ConfirmMessage", NULL, 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "mid_", NULL, 0x2, "J", NULL,  },
  };
  static const J2ObjcClassInfo _MTSenderActor_ConfirmMessage = { 1, "ConfirmMessage", "im.actor.model.network.mtp.actors", "SenderActor", 0x9, 1, methods, 1, fields, 0, NULL};
  return &_MTSenderActor_ConfirmMessage;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTSenderActor_ConfirmMessage)

@implementation MTSenderActor_ConnectionCreated

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x1, NULL },
  };
  static const J2ObjcClassInfo _MTSenderActor_ConnectionCreated = { 1, "ConnectionCreated", "im.actor.model.network.mtp.actors", "SenderActor", 0x9, 1, methods, 0, NULL, 0, NULL};
  return &_MTSenderActor_ConnectionCreated;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTSenderActor_ConnectionCreated)

@implementation MTSenderActor_NewSession

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x1, NULL },
  };
  static const J2ObjcClassInfo _MTSenderActor_NewSession = { 1, "NewSession", "im.actor.model.network.mtp.actors", "SenderActor", 0x9, 1, methods, 0, NULL, 0, NULL};
  return &_MTSenderActor_NewSession;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTSenderActor_NewSession)

@implementation MTSenderActor_ForceAck

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x1, NULL },
  };
  static const J2ObjcClassInfo _MTSenderActor_ForceAck = { 1, "ForceAck", "im.actor.model.network.mtp.actors", "SenderActor", 0x9, 1, methods, 0, NULL, 0, NULL};
  return &_MTSenderActor_ForceAck;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTSenderActor_ForceAck)

@implementation MTSenderActor_$1

- (MTSenderActor *)create {
  return [[MTSenderActor alloc] initWithMTMTProto:val$proto_];
}

- (instancetype)initWithMTMTProto:(MTMTProto *)capture$0 {
  val$proto_ = capture$0;
  return [super init];
}

- (void)copyAllFieldsTo:(MTSenderActor_$1 *)other {
  [super copyAllFieldsTo:other];
  other->val$proto_ = val$proto_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "create", NULL, "Lim.actor.model.network.mtp.actors.SenderActor;", 0x1, NULL },
    { "initWithMTMTProto:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "val$proto_", NULL, 0x1012, "Lim.actor.model.network.mtp.MTProto;", NULL,  },
  };
  static const J2ObjcClassInfo _MTSenderActor_$1 = { 1, "$1", "im.actor.model.network.mtp.actors", "SenderActor", 0x8000, 2, methods, 1, fields, 0, NULL};
  return &_MTSenderActor_$1;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(MTSenderActor_$1)
