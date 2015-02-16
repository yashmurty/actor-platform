//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/updates/UpdateContactsRemoved.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/updates/UpdateContactsRemoved.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"
#include "java/util/List.h"

@interface ImActorModelApiUpdatesUpdateContactsRemoved () {
 @public
  id<JavaUtilList> uids_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiUpdatesUpdateContactsRemoved, uids_, id<JavaUtilList>)

@implementation ImActorModelApiUpdatesUpdateContactsRemoved

+ (ImActorModelApiUpdatesUpdateContactsRemoved *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiUpdatesUpdateContactsRemoved_fromBytesWithByteArray_(data);
}

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)uids {
  if (self = [super init]) {
    self->uids_ = uids;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (id<JavaUtilList>)getUids {
  return self->uids_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->uids_ = [((BSBserValues *) nil_chk(values)) getRepeatedIntWithInt:1];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeRepeatedIntWithInt:1 withJavaUtilList:self->uids_];
}

- (jint)getHeaderKey {
  return ImActorModelApiUpdatesUpdateContactsRemoved_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiUpdatesUpdateContactsRemoved *)other {
  [super copyAllFieldsTo:other];
  other->uids_ = uids_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromBytesWithByteArray:", "fromBytes", "Lim.actor.model.api.updates.UpdateContactsRemoved;", 0x9, "Ljava.io.IOException;" },
    { "initWithJavaUtilList:", "UpdateContactsRemoved", NULL, 0x1, NULL },
    { "init", "UpdateContactsRemoved", NULL, 0x1, NULL },
    { "getUids", NULL, "Ljava.util.List;", 0x1, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
    { "getHeaderKey", NULL, "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "HEADER_", NULL, 0x19, "I", NULL, .constantValue.asInt = ImActorModelApiUpdatesUpdateContactsRemoved_HEADER },
    { "uids_", NULL, 0x2, "Ljava.util.List;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelApiUpdatesUpdateContactsRemoved = { 1, "UpdateContactsRemoved", "im.actor.model.api.updates", NULL, 0x1, 7, methods, 2, fields, 0, NULL};
  return &_ImActorModelApiUpdatesUpdateContactsRemoved;
}

@end

ImActorModelApiUpdatesUpdateContactsRemoved *ImActorModelApiUpdatesUpdateContactsRemoved_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiUpdatesUpdateContactsRemoved_init();
  return ((ImActorModelApiUpdatesUpdateContactsRemoved *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiUpdatesUpdateContactsRemoved alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiUpdatesUpdateContactsRemoved)
