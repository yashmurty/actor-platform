//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/modules/presence/PresenceActor.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/MessengerCallback.h"
#include "im/actor/model/api/UserOutPeer.h"
#include "im/actor/model/api/rpc/RequestSubscribeToOnline.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/droidkit/actors/mailbox/Envelope.h"
#include "im/actor/model/droidkit/actors/mailbox/Mailbox.h"
#include "im/actor/model/droidkit/actors/mailbox/MailboxesQueue.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/entity/PeerType.h"
#include "im/actor/model/entity/User.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/presence/PresenceActor.h"
#include "im/actor/model/modules/utils/ModuleActor.h"
#include "java/lang/Integer.h"
#include "java/util/ArrayList.h"
#include "java/util/HashSet.h"
#include "java/util/List.h"

__attribute__((unused)) static void ImActorModelModulesPresencePresenceActor_onUserOnlineWithInt_(ImActorModelModulesPresencePresenceActor *self, jint uid);
__attribute__((unused)) static void ImActorModelModulesPresencePresenceActor_onUserOfflineWithInt_(ImActorModelModulesPresencePresenceActor *self, jint uid);
__attribute__((unused)) static void ImActorModelModulesPresencePresenceActor_onUserLastSeenWithInt_withLong_(ImActorModelModulesPresencePresenceActor *self, jint uid, jlong date);
__attribute__((unused)) static void ImActorModelModulesPresencePresenceActor_onGroupOnlineWithInt_withInt_(ImActorModelModulesPresencePresenceActor *self, jint gid, jint count);
__attribute__((unused)) static void ImActorModelModulesPresencePresenceActor_subscribeWithAMPeer_(ImActorModelModulesPresencePresenceActor *self, AMPeer *peer);
__attribute__((unused)) static void ImActorModelModulesPresencePresenceActor_onNewSessionCreated(ImActorModelModulesPresencePresenceActor *self);

@interface ImActorModelModulesPresencePresenceActor () {
 @public
  JavaUtilHashSet *uids_;
  id<AMMessengerCallback> onlineCallback_;
}

- (void)onUserOnlineWithInt:(jint)uid;

- (void)onUserOfflineWithInt:(jint)uid;

- (void)onUserLastSeenWithInt:(jint)uid
                     withLong:(jlong)date;

- (void)onGroupOnlineWithInt:(jint)gid
                     withInt:(jint)count;

- (void)subscribeWithAMPeer:(AMPeer *)peer;

- (void)onNewSessionCreated;
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesPresencePresenceActor, uids_, JavaUtilHashSet *)
J2OBJC_FIELD_SETTER(ImActorModelModulesPresencePresenceActor, onlineCallback_, id<AMMessengerCallback>)

@interface ImActorModelModulesPresencePresenceActor_UserOnline () {
 @public
  jint uid_;
}
@end

@interface ImActorModelModulesPresencePresenceActor_UserOffline () {
 @public
  jint uid_;
}
@end

@interface ImActorModelModulesPresencePresenceActor_UserLastSeen () {
 @public
  jint uid_;
  jlong date_;
}
@end

@interface ImActorModelModulesPresencePresenceActor_GroupOnline () {
 @public
  jint gid_;
  jint count_;
}
@end

@interface ImActorModelModulesPresencePresenceActor_Subscribe () {
 @public
  AMPeer *peer_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesPresencePresenceActor_Subscribe, peer_, AMPeer *)

@interface ImActorModelModulesPresencePresenceActor_$1 () {
 @public
  ImActorModelModulesModules *val$messenger_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesPresencePresenceActor_$1, val$messenger_, ImActorModelModulesModules *)

@implementation ImActorModelModulesPresencePresenceActor

+ (DKActorRef *)getWithImActorModelModulesModules:(ImActorModelModulesModules *)messenger {
  return ImActorModelModulesPresencePresenceActor_getWithImActorModelModulesModules_(messenger);
}

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)messenger {
  if (self = [super initWithImActorModelModulesModules:messenger]) {
    uids_ = [[JavaUtilHashSet alloc] init];
    onlineCallback_ = [((AMConfiguration *) nil_chk([((ImActorModelModulesModules *) nil_chk(messenger)) getConfiguration])) getCallback];
  }
  return self;
}

- (void)onUserOnlineWithInt:(jint)uid {
  ImActorModelModulesPresencePresenceActor_onUserOnlineWithInt_(self, uid);
}

- (void)onUserOfflineWithInt:(jint)uid {
  ImActorModelModulesPresencePresenceActor_onUserOfflineWithInt_(self, uid);
}

- (void)onUserLastSeenWithInt:(jint)uid
                     withLong:(jlong)date {
  ImActorModelModulesPresencePresenceActor_onUserLastSeenWithInt_withLong_(self, uid, date);
}

- (void)onGroupOnlineWithInt:(jint)gid
                     withInt:(jint)count {
  ImActorModelModulesPresencePresenceActor_onGroupOnlineWithInt_withInt_(self, gid, count);
}

- (void)subscribeWithAMPeer:(AMPeer *)peer {
  ImActorModelModulesPresencePresenceActor_subscribeWithAMPeer_(self, peer);
}

- (void)onNewSessionCreated {
  ImActorModelModulesPresencePresenceActor_onNewSessionCreated(self);
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[ImActorModelModulesPresencePresenceActor_UserOnline class]]) {
    ImActorModelModulesPresencePresenceActor_UserOnline *online = (ImActorModelModulesPresencePresenceActor_UserOnline *) check_class_cast(message, [ImActorModelModulesPresencePresenceActor_UserOnline class]);
    ImActorModelModulesPresencePresenceActor_onUserOnlineWithInt_(self, [((ImActorModelModulesPresencePresenceActor_UserOnline *) nil_chk(online)) getUid]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesPresencePresenceActor_UserOffline class]]) {
    ImActorModelModulesPresencePresenceActor_UserOffline *offline = (ImActorModelModulesPresencePresenceActor_UserOffline *) check_class_cast(message, [ImActorModelModulesPresencePresenceActor_UserOffline class]);
    ImActorModelModulesPresencePresenceActor_onUserOfflineWithInt_(self, [((ImActorModelModulesPresencePresenceActor_UserOffline *) nil_chk(offline)) getUid]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesPresencePresenceActor_UserLastSeen class]]) {
    ImActorModelModulesPresencePresenceActor_UserLastSeen *lastSeen = (ImActorModelModulesPresencePresenceActor_UserLastSeen *) check_class_cast(message, [ImActorModelModulesPresencePresenceActor_UserLastSeen class]);
    ImActorModelModulesPresencePresenceActor_onUserLastSeenWithInt_withLong_(self, [((ImActorModelModulesPresencePresenceActor_UserLastSeen *) nil_chk(lastSeen)) getUid], [lastSeen getDate]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesPresencePresenceActor_GroupOnline class]]) {
    ImActorModelModulesPresencePresenceActor_GroupOnline *groupOnline = (ImActorModelModulesPresencePresenceActor_GroupOnline *) check_class_cast(message, [ImActorModelModulesPresencePresenceActor_GroupOnline class]);
    ImActorModelModulesPresencePresenceActor_onGroupOnlineWithInt_withInt_(self, [((ImActorModelModulesPresencePresenceActor_GroupOnline *) nil_chk(groupOnline)) getGid], [groupOnline getCount]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesPresencePresenceActor_Subscribe class]]) {
    ImActorModelModulesPresencePresenceActor_subscribeWithAMPeer_(self, [((ImActorModelModulesPresencePresenceActor_Subscribe *) nil_chk(((ImActorModelModulesPresencePresenceActor_Subscribe *) check_class_cast(message, [ImActorModelModulesPresencePresenceActor_Subscribe class])))) getPeer]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesPresencePresenceActor_SessionCreated class]]) {
    ImActorModelModulesPresencePresenceActor_onNewSessionCreated(self);
  }
  else {
    [self dropWithId:message];
  }
}

- (void)copyAllFieldsTo:(ImActorModelModulesPresencePresenceActor *)other {
  [super copyAllFieldsTo:other];
  other->uids_ = uids_;
  other->onlineCallback_ = onlineCallback_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "getWithImActorModelModulesModules:", "get", "Lim.actor.model.droidkit.actors.ActorRef;", 0x9, NULL },
    { "initWithImActorModelModulesModules:", "PresenceActor", NULL, 0x1, NULL },
    { "onUserOnlineWithInt:", "onUserOnline", "V", 0x2, NULL },
    { "onUserOfflineWithInt:", "onUserOffline", "V", 0x2, NULL },
    { "onUserLastSeenWithInt:withLong:", "onUserLastSeen", "V", 0x2, NULL },
    { "onGroupOnlineWithInt:withInt:", "onGroupOnline", "V", 0x2, NULL },
    { "subscribeWithAMPeer:", "subscribe", "V", 0x2, NULL },
    { "onNewSessionCreated", NULL, "V", 0x2, NULL },
    { "onReceiveWithId:", "onReceive", "V", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "ONLINE_TIMEOUT_", NULL, 0x1a, "I", NULL, .constantValue.asInt = ImActorModelModulesPresencePresenceActor_ONLINE_TIMEOUT },
    { "uids_", NULL, 0x2, "Ljava.util.HashSet;", NULL,  },
    { "onlineCallback_", NULL, 0x2, "Lim.actor.model.MessengerCallback;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelModulesPresencePresenceActor = { 1, "PresenceActor", "im.actor.model.modules.presence", NULL, 0x1, 9, methods, 3, fields, 0, NULL};
  return &_ImActorModelModulesPresencePresenceActor;
}

@end

DKActorRef *ImActorModelModulesPresencePresenceActor_getWithImActorModelModulesModules_(ImActorModelModulesModules *messenger) {
  ImActorModelModulesPresencePresenceActor_init();
  return [((DKActorSystem *) nil_chk(DKActorSystem_system())) actorOfWithDKProps:DKProps_createWithIOSClass_withDKActorCreator_withDKMailboxCreator_(ImActorModelModulesPresencePresenceActor_class_(), [[ImActorModelModulesPresencePresenceActor_$1 alloc] initWithImActorModelModulesModules:messenger], [[ImActorModelModulesPresencePresenceActor_$2 alloc] init]) withNSString:@"actor/presence/users"];
}

void ImActorModelModulesPresencePresenceActor_onUserOnlineWithInt_(ImActorModelModulesPresencePresenceActor *self, jint uid) {
  if (self->onlineCallback_ != nil) {
    [self->onlineCallback_ onUserOnline:uid];
  }
  [((DKActorRef *) nil_chk([self self__])) sendOnceWithId:[[ImActorModelModulesPresencePresenceActor_UserOffline alloc] initWithInt:uid] withLong:ImActorModelModulesPresencePresenceActor_ONLINE_TIMEOUT];
}

void ImActorModelModulesPresencePresenceActor_onUserOfflineWithInt_(ImActorModelModulesPresencePresenceActor *self, jint uid) {
  if (self->onlineCallback_ != nil) {
    [self->onlineCallback_ onUserOffline:uid];
  }
}

void ImActorModelModulesPresencePresenceActor_onUserLastSeenWithInt_withLong_(ImActorModelModulesPresencePresenceActor *self, jint uid, jlong date) {
  if (self->onlineCallback_ != nil) {
    [self->onlineCallback_ onUserLastSeen:uid withLastSeen:date];
  }
}

void ImActorModelModulesPresencePresenceActor_onGroupOnlineWithInt_withInt_(ImActorModelModulesPresencePresenceActor *self, jint gid, jint count) {
  if (self->onlineCallback_ != nil) {
    [self->onlineCallback_ onGroupOnline:gid withUserCount:count];
  }
}

void ImActorModelModulesPresencePresenceActor_subscribeWithAMPeer_(ImActorModelModulesPresencePresenceActor *self, AMPeer *peer) {
  if ([((AMPeer *) nil_chk(peer)) getPeerType] == AMPeerTypeEnum_get_PRIVATE()) {
    if ([((JavaUtilHashSet *) nil_chk(self->uids_)) containsWithId:JavaLangInteger_valueOfWithInt_([peer getPeerId])]) {
      return;
    }
    AMUser *user = [self getUserWithInt:[peer getPeerId]];
    if (user == nil) {
      return;
    }
    [self->uids_ addWithId:JavaLangInteger_valueOfWithInt_([((AMUser *) nil_chk(user)) getUid])];
    id<JavaUtilList> peers = [[JavaUtilArrayList alloc] init];
    [peers addWithId:[[ImActorModelApiUserOutPeer alloc] initWithInt:[user getUid] withLong:[user getAccessHash]]];
    [self requestWithImActorModelNetworkParserRequest:[[ImActorModelApiRpcRequestSubscribeToOnline alloc] initWithJavaUtilList:peers]];
  }
  else if ([peer getPeerType] == AMPeerTypeEnum_get_GROUP()) {
  }
}

void ImActorModelModulesPresencePresenceActor_onNewSessionCreated(ImActorModelModulesPresencePresenceActor *self) {
  id<JavaUtilList> userPeers = [[JavaUtilArrayList alloc] init];
  for (JavaLangInteger *boxed__ in nil_chk(self->uids_)) {
    jint uid = [((JavaLangInteger *) nil_chk(boxed__)) intValue];
    AMUser *user = [self getUserWithInt:uid];
    if (user == nil) {
      continue;
    }
    [userPeers addWithId:[[ImActorModelApiUserOutPeer alloc] initWithInt:uid withLong:[((AMUser *) nil_chk(user)) getAccessHash]]];
  }
  if ([userPeers size] > 0) {
    [self requestWithImActorModelNetworkParserRequest:[[ImActorModelApiRpcRequestSubscribeToOnline alloc] initWithJavaUtilList:userPeers]];
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesPresencePresenceActor)

@implementation ImActorModelModulesPresencePresenceActor_UserOnline

- (instancetype)initWithInt:(jint)uid {
  if (self = [super init]) {
    self->uid_ = uid;
  }
  return self;
}

- (jint)getUid {
  return uid_;
}

- (jboolean)isEqual:(id)o {
  if (self == o) return YES;
  if (o == nil || [self getClass] != [o getClass]) return NO;
  ImActorModelModulesPresencePresenceActor_UserOnline *that = (ImActorModelModulesPresencePresenceActor_UserOnline *) check_class_cast(o, [ImActorModelModulesPresencePresenceActor_UserOnline class]);
  if (uid_ != ((ImActorModelModulesPresencePresenceActor_UserOnline *) nil_chk(that))->uid_) return NO;
  return YES;
}

- (NSUInteger)hash {
  return uid_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesPresencePresenceActor_UserOnline *)other {
  [super copyAllFieldsTo:other];
  other->uid_ = uid_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithInt:", "UserOnline", NULL, 0x1, NULL },
    { "getUid", NULL, "I", 0x1, NULL },
    { "isEqual:", "equals", "Z", 0x1, NULL },
    { "hash", "hashCode", "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "uid_", NULL, 0x2, "I", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelModulesPresencePresenceActor_UserOnline = { 1, "UserOnline", "im.actor.model.modules.presence", "PresenceActor", 0x9, 4, methods, 1, fields, 0, NULL};
  return &_ImActorModelModulesPresencePresenceActor_UserOnline;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesPresencePresenceActor_UserOnline)

@implementation ImActorModelModulesPresencePresenceActor_UserOffline

- (instancetype)initWithInt:(jint)uid {
  if (self = [super init]) {
    self->uid_ = uid;
  }
  return self;
}

- (jint)getUid {
  return uid_;
}

- (jboolean)isEqual:(id)o {
  if (self == o) return YES;
  if (o == nil || [self getClass] != [o getClass]) return NO;
  ImActorModelModulesPresencePresenceActor_UserOffline *that = (ImActorModelModulesPresencePresenceActor_UserOffline *) check_class_cast(o, [ImActorModelModulesPresencePresenceActor_UserOffline class]);
  if (uid_ != ((ImActorModelModulesPresencePresenceActor_UserOffline *) nil_chk(that))->uid_) return NO;
  return YES;
}

- (NSUInteger)hash {
  return uid_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesPresencePresenceActor_UserOffline *)other {
  [super copyAllFieldsTo:other];
  other->uid_ = uid_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithInt:", "UserOffline", NULL, 0x1, NULL },
    { "getUid", NULL, "I", 0x1, NULL },
    { "isEqual:", "equals", "Z", 0x1, NULL },
    { "hash", "hashCode", "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "uid_", NULL, 0x2, "I", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelModulesPresencePresenceActor_UserOffline = { 1, "UserOffline", "im.actor.model.modules.presence", "PresenceActor", 0x9, 4, methods, 1, fields, 0, NULL};
  return &_ImActorModelModulesPresencePresenceActor_UserOffline;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesPresencePresenceActor_UserOffline)

@implementation ImActorModelModulesPresencePresenceActor_UserLastSeen

- (instancetype)initWithInt:(jint)uid
                   withLong:(jlong)date {
  if (self = [super init]) {
    self->uid_ = uid;
    self->date_ = date;
  }
  return self;
}

- (jint)getUid {
  return uid_;
}

- (jlong)getDate {
  return date_;
}

- (jboolean)isEqual:(id)o {
  if (self == o) return YES;
  if (o == nil || [self getClass] != [o getClass]) return NO;
  ImActorModelModulesPresencePresenceActor_UserLastSeen *that = (ImActorModelModulesPresencePresenceActor_UserLastSeen *) check_class_cast(o, [ImActorModelModulesPresencePresenceActor_UserLastSeen class]);
  if (date_ != ((ImActorModelModulesPresencePresenceActor_UserLastSeen *) nil_chk(that))->date_) return NO;
  if (uid_ != that->uid_) return NO;
  return YES;
}

- (NSUInteger)hash {
  jint result = uid_;
  result = 31 * result + (jint) (date_ ^ (URShift64(date_, 32)));
  return result;
}

- (void)copyAllFieldsTo:(ImActorModelModulesPresencePresenceActor_UserLastSeen *)other {
  [super copyAllFieldsTo:other];
  other->uid_ = uid_;
  other->date_ = date_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithInt:withLong:", "UserLastSeen", NULL, 0x1, NULL },
    { "getUid", NULL, "I", 0x1, NULL },
    { "getDate", NULL, "J", 0x1, NULL },
    { "isEqual:", "equals", "Z", 0x1, NULL },
    { "hash", "hashCode", "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "uid_", NULL, 0x2, "I", NULL,  },
    { "date_", NULL, 0x2, "J", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelModulesPresencePresenceActor_UserLastSeen = { 1, "UserLastSeen", "im.actor.model.modules.presence", "PresenceActor", 0x9, 5, methods, 2, fields, 0, NULL};
  return &_ImActorModelModulesPresencePresenceActor_UserLastSeen;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesPresencePresenceActor_UserLastSeen)

@implementation ImActorModelModulesPresencePresenceActor_GroupOnline

- (instancetype)initWithInt:(jint)gid
                    withInt:(jint)count {
  if (self = [super init]) {
    self->gid_ = gid;
    self->count_ = count;
  }
  return self;
}

- (jint)getGid {
  return gid_;
}

- (jint)getCount {
  return count_;
}

- (jboolean)isEqual:(id)o {
  if (self == o) return YES;
  if (o == nil || [self getClass] != [o getClass]) return NO;
  ImActorModelModulesPresencePresenceActor_GroupOnline *that = (ImActorModelModulesPresencePresenceActor_GroupOnline *) check_class_cast(o, [ImActorModelModulesPresencePresenceActor_GroupOnline class]);
  if (count_ != ((ImActorModelModulesPresencePresenceActor_GroupOnline *) nil_chk(that))->count_) return NO;
  if (gid_ != that->gid_) return NO;
  return YES;
}

- (NSUInteger)hash {
  jint result = gid_;
  result = 31 * result + count_;
  return result;
}

- (void)copyAllFieldsTo:(ImActorModelModulesPresencePresenceActor_GroupOnline *)other {
  [super copyAllFieldsTo:other];
  other->gid_ = gid_;
  other->count_ = count_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithInt:withInt:", "GroupOnline", NULL, 0x1, NULL },
    { "getGid", NULL, "I", 0x1, NULL },
    { "getCount", NULL, "I", 0x1, NULL },
    { "isEqual:", "equals", "Z", 0x1, NULL },
    { "hash", "hashCode", "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "gid_", NULL, 0x2, "I", NULL,  },
    { "count_", NULL, 0x2, "I", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelModulesPresencePresenceActor_GroupOnline = { 1, "GroupOnline", "im.actor.model.modules.presence", "PresenceActor", 0x9, 5, methods, 2, fields, 0, NULL};
  return &_ImActorModelModulesPresencePresenceActor_GroupOnline;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesPresencePresenceActor_GroupOnline)

@implementation ImActorModelModulesPresencePresenceActor_Subscribe

- (instancetype)initWithAMPeer:(AMPeer *)peer {
  if (self = [super init]) {
    self->peer_ = peer;
  }
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesPresencePresenceActor_Subscribe *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithAMPeer:", "Subscribe", NULL, 0x1, NULL },
    { "getPeer", NULL, "Lim.actor.model.entity.Peer;", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "peer_", NULL, 0x2, "Lim.actor.model.entity.Peer;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelModulesPresencePresenceActor_Subscribe = { 1, "Subscribe", "im.actor.model.modules.presence", "PresenceActor", 0x9, 2, methods, 1, fields, 0, NULL};
  return &_ImActorModelModulesPresencePresenceActor_Subscribe;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesPresencePresenceActor_Subscribe)

@implementation ImActorModelModulesPresencePresenceActor_SessionCreated

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x1, NULL },
  };
  static const J2ObjcClassInfo _ImActorModelModulesPresencePresenceActor_SessionCreated = { 1, "SessionCreated", "im.actor.model.modules.presence", "PresenceActor", 0x9, 1, methods, 0, NULL, 0, NULL};
  return &_ImActorModelModulesPresencePresenceActor_SessionCreated;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesPresencePresenceActor_SessionCreated)

@implementation ImActorModelModulesPresencePresenceActor_$1

- (ImActorModelModulesPresencePresenceActor *)create {
  return [[ImActorModelModulesPresencePresenceActor alloc] initWithImActorModelModulesModules:val$messenger_];
}

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)capture$0 {
  val$messenger_ = capture$0;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelModulesPresencePresenceActor_$1 *)other {
  [super copyAllFieldsTo:other];
  other->val$messenger_ = val$messenger_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "create", NULL, "Lim.actor.model.modules.presence.PresenceActor;", 0x1, NULL },
    { "initWithImActorModelModulesModules:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "val$messenger_", NULL, 0x1012, "Lim.actor.model.modules.Modules;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelModulesPresencePresenceActor_$1 = { 1, "$1", "im.actor.model.modules.presence", "PresenceActor", 0x8000, 2, methods, 1, fields, 0, NULL};
  return &_ImActorModelModulesPresencePresenceActor_$1;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesPresencePresenceActor_$1)

@implementation ImActorModelModulesPresencePresenceActor_$2

- (DKMailbox *)createMailboxWithDKMailboxesQueue:(DKMailboxesQueue *)queue {
  return [[ImActorModelModulesPresencePresenceActor_$2_$1 alloc] initWithDKMailboxesQueue:queue];
}

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "createMailboxWithDKMailboxesQueue:", "createMailbox", "Lim.actor.model.droidkit.actors.mailbox.Mailbox;", 0x1, NULL },
    { "init", NULL, NULL, 0x0, NULL },
  };
  static const J2ObjcClassInfo _ImActorModelModulesPresencePresenceActor_$2 = { 1, "$2", "im.actor.model.modules.presence", "PresenceActor", 0x8000, 2, methods, 0, NULL, 0, NULL};
  return &_ImActorModelModulesPresencePresenceActor_$2;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesPresencePresenceActor_$2)

@implementation ImActorModelModulesPresencePresenceActor_$2_$1

- (jboolean)isEqualEnvelopeWithDKEnvelope:(DKEnvelope *)a
                           withDKEnvelope:(DKEnvelope *)b {
  if ([nil_chk([((DKEnvelope *) nil_chk(a)) getMessage]) isEqual:[((DKEnvelope *) nil_chk(b)) getMessage]]) {
    return YES;
  }
  return [super isEqualEnvelopeWithDKEnvelope:a withDKEnvelope:b];
}

- (instancetype)initWithDKMailboxesQueue:(DKMailboxesQueue *)arg$0 {
  return [super initWithDKMailboxesQueue:arg$0];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "isEqualEnvelopeWithDKEnvelope:withDKEnvelope:", "isEqualEnvelope", "Z", 0x4, NULL },
    { "initWithDKMailboxesQueue:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcClassInfo _ImActorModelModulesPresencePresenceActor_$2_$1 = { 1, "$1", "im.actor.model.modules.presence", "PresenceActor$$2", 0x8000, 2, methods, 0, NULL, 0, NULL};
  return &_ImActorModelModulesPresencePresenceActor_$2_$1;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesPresencePresenceActor_$2_$1)
