//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/DifferenceUpdate.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/DifferenceUpdate.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiDifferenceUpdate () {
 @public
  jint updateHeader_;
  IOSByteArray *update_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiDifferenceUpdate, update_, IOSByteArray *)

@implementation ImActorModelApiDifferenceUpdate

- (instancetype)initWithInt:(jint)updateHeader
              withByteArray:(IOSByteArray *)update {
  if (self = [super init]) {
    self->updateHeader_ = updateHeader;
    self->update_ = update;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (jint)getUpdateHeader {
  return self->updateHeader_;
}

- (IOSByteArray *)getUpdate {
  return self->update_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->updateHeader_ = [((BSBserValues *) nil_chk(values)) getIntWithInt:1];
  self->update_ = [values getBytesWithInt:2];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeIntWithInt:1 withInt:self->updateHeader_];
  if (self->update_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [writer writeBytesWithInt:2 withByteArray:self->update_];
}

- (void)copyAllFieldsTo:(ImActorModelApiDifferenceUpdate *)other {
  [super copyAllFieldsTo:other];
  other->updateHeader_ = updateHeader_;
  other->update_ = update_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithInt:withByteArray:", "DifferenceUpdate", NULL, 0x1, NULL },
    { "init", "DifferenceUpdate", NULL, 0x1, NULL },
    { "getUpdateHeader", NULL, "I", 0x1, NULL },
    { "getUpdate", NULL, "[B", 0x1, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "updateHeader_", NULL, 0x2, "I", NULL,  },
    { "update_", NULL, 0x2, "[B", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelApiDifferenceUpdate = { 1, "DifferenceUpdate", "im.actor.model.api", NULL, 0x1, 6, methods, 2, fields, 0, NULL};
  return &_ImActorModelApiDifferenceUpdate;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiDifferenceUpdate)
