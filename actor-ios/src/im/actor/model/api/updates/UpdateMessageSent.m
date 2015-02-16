//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/updates/UpdateMessageSent.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Peer.h"
#include "im/actor/model/api/updates/UpdateMessageSent.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiUpdatesUpdateMessageSent () {
 @public
  ImActorModelApiPeer *peer_;
  jlong rid_;
  jlong date_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiUpdatesUpdateMessageSent, peer_, ImActorModelApiPeer *)

@implementation ImActorModelApiUpdatesUpdateMessageSent

+ (ImActorModelApiUpdatesUpdateMessageSent *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiUpdatesUpdateMessageSent_fromBytesWithByteArray_(data);
}

- (instancetype)initWithImActorModelApiPeer:(ImActorModelApiPeer *)peer
                                   withLong:(jlong)rid
                                   withLong:(jlong)date {
  if (self = [super init]) {
    self->peer_ = peer;
    self->rid_ = rid;
    self->date_ = date;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (ImActorModelApiPeer *)getPeer {
  return self->peer_;
}

- (jlong)getRid {
  return self->rid_;
}

- (jlong)getDate {
  return self->date_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->peer_ = [((BSBserValues *) nil_chk(values)) getObjWithInt:1 withBSBserObject:[[ImActorModelApiPeer alloc] init]];
  self->rid_ = [values getLongWithInt:2];
  self->date_ = [values getLongWithInt:3];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (self->peer_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:1 withBSBserObject:self->peer_];
  [writer writeLongWithInt:2 withLong:self->rid_];
  [writer writeLongWithInt:3 withLong:self->date_];
}

- (jint)getHeaderKey {
  return ImActorModelApiUpdatesUpdateMessageSent_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiUpdatesUpdateMessageSent *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->rid_ = rid_;
  other->date_ = date_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromBytesWithByteArray:", "fromBytes", "Lim.actor.model.api.updates.UpdateMessageSent;", 0x9, "Ljava.io.IOException;" },
    { "initWithImActorModelApiPeer:withLong:withLong:", "UpdateMessageSent", NULL, 0x1, NULL },
    { "init", "UpdateMessageSent", NULL, 0x1, NULL },
    { "getPeer", NULL, "Lim.actor.model.api.Peer;", 0x1, NULL },
    { "getRid", NULL, "J", 0x1, NULL },
    { "getDate", NULL, "J", 0x1, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
    { "getHeaderKey", NULL, "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "HEADER_", NULL, 0x19, "I", NULL, .constantValue.asInt = ImActorModelApiUpdatesUpdateMessageSent_HEADER },
    { "peer_", NULL, 0x2, "Lim.actor.model.api.Peer;", NULL,  },
    { "rid_", NULL, 0x2, "J", NULL,  },
    { "date_", NULL, 0x2, "J", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelApiUpdatesUpdateMessageSent = { 1, "UpdateMessageSent", "im.actor.model.api.updates", NULL, 0x1, 9, methods, 4, fields, 0, NULL};
  return &_ImActorModelApiUpdatesUpdateMessageSent;
}

@end

ImActorModelApiUpdatesUpdateMessageSent *ImActorModelApiUpdatesUpdateMessageSent_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiUpdatesUpdateMessageSent_init();
  return ((ImActorModelApiUpdatesUpdateMessageSent *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiUpdatesUpdateMessageSent alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiUpdatesUpdateMessageSent)
