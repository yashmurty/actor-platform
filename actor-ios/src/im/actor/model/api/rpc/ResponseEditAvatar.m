//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/rpc/ResponseEditAvatar.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Avatar.h"
#include "im/actor/model/api/rpc/ResponseEditAvatar.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiRpcResponseEditAvatar () {
 @public
  ImActorModelApiAvatar *avatar_;
  jint seq_;
  IOSByteArray *state_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiRpcResponseEditAvatar, avatar_, ImActorModelApiAvatar *)
J2OBJC_FIELD_SETTER(ImActorModelApiRpcResponseEditAvatar, state_, IOSByteArray *)

@implementation ImActorModelApiRpcResponseEditAvatar

+ (ImActorModelApiRpcResponseEditAvatar *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcResponseEditAvatar_fromBytesWithByteArray_(data);
}

- (instancetype)initWithImActorModelApiAvatar:(ImActorModelApiAvatar *)avatar
                                      withInt:(jint)seq
                                withByteArray:(IOSByteArray *)state {
  if (self = [super init]) {
    self->avatar_ = avatar;
    self->seq_ = seq;
    self->state_ = state;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (ImActorModelApiAvatar *)getAvatar {
  return self->avatar_;
}

- (jint)getSeq {
  return self->seq_;
}

- (IOSByteArray *)getState {
  return self->state_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->avatar_ = [((BSBserValues *) nil_chk(values)) getObjWithInt:1 withBSBserObject:[[ImActorModelApiAvatar alloc] init]];
  self->seq_ = [values getIntWithInt:2];
  self->state_ = [values getBytesWithInt:3];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (self->avatar_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:1 withBSBserObject:self->avatar_];
  [writer writeIntWithInt:2 withInt:self->seq_];
  if (self->state_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [writer writeBytesWithInt:3 withByteArray:self->state_];
}

- (jint)getHeaderKey {
  return ImActorModelApiRpcResponseEditAvatar_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiRpcResponseEditAvatar *)other {
  [super copyAllFieldsTo:other];
  other->avatar_ = avatar_;
  other->seq_ = seq_;
  other->state_ = state_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromBytesWithByteArray:", "fromBytes", "Lim.actor.model.api.rpc.ResponseEditAvatar;", 0x9, "Ljava.io.IOException;" },
    { "initWithImActorModelApiAvatar:withInt:withByteArray:", "ResponseEditAvatar", NULL, 0x1, NULL },
    { "init", "ResponseEditAvatar", NULL, 0x1, NULL },
    { "getAvatar", NULL, "Lim.actor.model.api.Avatar;", 0x1, NULL },
    { "getSeq", NULL, "I", 0x1, NULL },
    { "getState", NULL, "[B", 0x1, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
    { "getHeaderKey", NULL, "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "HEADER_", NULL, 0x19, "I", NULL, .constantValue.asInt = ImActorModelApiRpcResponseEditAvatar_HEADER },
    { "avatar_", NULL, 0x2, "Lim.actor.model.api.Avatar;", NULL,  },
    { "seq_", NULL, 0x2, "I", NULL,  },
    { "state_", NULL, 0x2, "[B", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelApiRpcResponseEditAvatar = { 1, "ResponseEditAvatar", "im.actor.model.api.rpc", NULL, 0x1, 9, methods, 4, fields, 0, NULL};
  return &_ImActorModelApiRpcResponseEditAvatar;
}

@end

ImActorModelApiRpcResponseEditAvatar *ImActorModelApiRpcResponseEditAvatar_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcResponseEditAvatar_init();
  return ((ImActorModelApiRpcResponseEditAvatar *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiRpcResponseEditAvatar alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcResponseEditAvatar)
