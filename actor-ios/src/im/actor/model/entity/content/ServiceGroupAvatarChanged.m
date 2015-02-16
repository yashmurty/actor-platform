//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/entity/content/ServiceGroupAvatarChanged.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/entity/Avatar.h"
#include "im/actor/model/entity/content/AbsContent.h"
#include "im/actor/model/entity/content/ServiceGroupAvatarChanged.h"
#include "java/io/IOException.h"

@interface ImActorModelEntityContentServiceGroupAvatarChanged () {
 @public
  AMAvatar *newAvatar_;
}
- (instancetype)init;
@end

J2OBJC_FIELD_SETTER(ImActorModelEntityContentServiceGroupAvatarChanged, newAvatar_, AMAvatar *)

@implementation ImActorModelEntityContentServiceGroupAvatarChanged

+ (ImActorModelEntityContentServiceGroupAvatarChanged *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelEntityContentServiceGroupAvatarChanged_fromBytesWithByteArray_(data);
}

- (instancetype)initWithAMAvatar:(AMAvatar *)newAvatar {
  if (self = [super initWithNSString:@"Group avatar changed"]) {
    self->newAvatar_ = newAvatar;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (AMAvatar *)getNewAvatar {
  return newAvatar_;
}

- (ImActorModelEntityContentAbsContent_ContentTypeEnum *)getContentType {
  return ImActorModelEntityContentAbsContent_ContentTypeEnum_get_SERVICE_AVATAR();
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  [super parseWithBSBserValues:values];
  IOSByteArray *data = [((BSBserValues *) nil_chk(values)) optBytesWithInt:10];
  if (data != nil) {
    newAvatar_ = AMAvatar_fromBytesWithByteArray_(data);
  }
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [super serializeWithBSBserWriter:writer];
  if (newAvatar_ != nil) {
    [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:10 withBSBserObject:newAvatar_];
  }
}

- (void)copyAllFieldsTo:(ImActorModelEntityContentServiceGroupAvatarChanged *)other {
  [super copyAllFieldsTo:other];
  other->newAvatar_ = newAvatar_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromBytesWithByteArray:", "fromBytes", "Lim.actor.model.entity.content.ServiceGroupAvatarChanged;", 0x9, "Ljava.io.IOException;" },
    { "initWithAMAvatar:", "ServiceGroupAvatarChanged", NULL, 0x1, NULL },
    { "init", "ServiceGroupAvatarChanged", NULL, 0x2, NULL },
    { "getNewAvatar", NULL, "Lim.actor.model.entity.Avatar;", 0x1, NULL },
    { "getContentType", NULL, "Lim.actor.model.entity.content.AbsContent$ContentType;", 0x4, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "newAvatar_", NULL, 0x2, "Lim.actor.model.entity.Avatar;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelEntityContentServiceGroupAvatarChanged = { 1, "ServiceGroupAvatarChanged", "im.actor.model.entity.content", NULL, 0x1, 7, methods, 1, fields, 0, NULL};
  return &_ImActorModelEntityContentServiceGroupAvatarChanged;
}

@end

ImActorModelEntityContentServiceGroupAvatarChanged *ImActorModelEntityContentServiceGroupAvatarChanged_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelEntityContentServiceGroupAvatarChanged_init();
  return ((ImActorModelEntityContentServiceGroupAvatarChanged *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelEntityContentServiceGroupAvatarChanged alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelEntityContentServiceGroupAvatarChanged)
