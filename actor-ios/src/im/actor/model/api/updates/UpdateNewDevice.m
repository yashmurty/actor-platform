//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/updates/UpdateNewDevice.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/updates/UpdateNewDevice.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiUpdatesUpdateNewDevice () {
 @public
  jint uid_;
  jlong keyHash_;
  IOSByteArray *key_;
  jlong date_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiUpdatesUpdateNewDevice, key_, IOSByteArray *)

@implementation ImActorModelApiUpdatesUpdateNewDevice

+ (ImActorModelApiUpdatesUpdateNewDevice *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiUpdatesUpdateNewDevice_fromBytesWithByteArray_(data);
}

- (instancetype)initWithInt:(jint)uid
                   withLong:(jlong)keyHash
              withByteArray:(IOSByteArray *)key
                   withLong:(jlong)date {
  if (self = [super init]) {
    self->uid_ = uid;
    self->keyHash_ = keyHash;
    self->key_ = key;
    self->date_ = date;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (jint)getUid {
  return self->uid_;
}

- (jlong)getKeyHash {
  return self->keyHash_;
}

- (IOSByteArray *)getKey {
  return self->key_;
}

- (jlong)getDate {
  return self->date_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->uid_ = [((BSBserValues *) nil_chk(values)) getIntWithInt:1];
  self->keyHash_ = [values getLongWithInt:2];
  self->key_ = [values optBytesWithInt:3];
  self->date_ = [values getLongWithInt:4];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeIntWithInt:1 withInt:self->uid_];
  [writer writeLongWithInt:2 withLong:self->keyHash_];
  if (self->key_ != nil) {
    [writer writeBytesWithInt:3 withByteArray:self->key_];
  }
  [writer writeLongWithInt:4 withLong:self->date_];
}

- (jint)getHeaderKey {
  return ImActorModelApiUpdatesUpdateNewDevice_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiUpdatesUpdateNewDevice *)other {
  [super copyAllFieldsTo:other];
  other->uid_ = uid_;
  other->keyHash_ = keyHash_;
  other->key_ = key_;
  other->date_ = date_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromBytesWithByteArray:", "fromBytes", "Lim.actor.model.api.updates.UpdateNewDevice;", 0x9, "Ljava.io.IOException;" },
    { "initWithInt:withLong:withByteArray:withLong:", "UpdateNewDevice", NULL, 0x1, NULL },
    { "init", "UpdateNewDevice", NULL, 0x1, NULL },
    { "getUid", NULL, "I", 0x1, NULL },
    { "getKeyHash", NULL, "J", 0x1, NULL },
    { "getKey", NULL, "[B", 0x1, NULL },
    { "getDate", NULL, "J", 0x1, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
    { "getHeaderKey", NULL, "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "HEADER_", NULL, 0x19, "I", NULL, .constantValue.asInt = ImActorModelApiUpdatesUpdateNewDevice_HEADER },
    { "uid_", NULL, 0x2, "I", NULL,  },
    { "keyHash_", NULL, 0x2, "J", NULL,  },
    { "key_", NULL, 0x2, "[B", NULL,  },
    { "date_", NULL, 0x2, "J", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelApiUpdatesUpdateNewDevice = { 1, "UpdateNewDevice", "im.actor.model.api.updates", NULL, 0x1, 10, methods, 5, fields, 0, NULL};
  return &_ImActorModelApiUpdatesUpdateNewDevice;
}

@end

ImActorModelApiUpdatesUpdateNewDevice *ImActorModelApiUpdatesUpdateNewDevice_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiUpdatesUpdateNewDevice_init();
  return ((ImActorModelApiUpdatesUpdateNewDevice *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiUpdatesUpdateNewDevice alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiUpdatesUpdateNewDevice)
