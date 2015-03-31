//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/entity/Avatar.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/entity/Avatar.h"
#include "im/actor/model/entity/AvatarImage.h"
#include "java/io/IOException.h"

@interface AMAvatar () {
 @public
  AMAvatarImage *smallImage_;
  AMAvatarImage *largeImage_;
  AMAvatarImage *fullImage_;
}
- (instancetype)init;
@end

J2OBJC_FIELD_SETTER(AMAvatar, smallImage_, AMAvatarImage *)
J2OBJC_FIELD_SETTER(AMAvatar, largeImage_, AMAvatarImage *)
J2OBJC_FIELD_SETTER(AMAvatar, fullImage_, AMAvatarImage *)

@implementation AMAvatar

+ (AMAvatar *)fromBytesWithByteArray:(IOSByteArray *)data {
  return AMAvatar_fromBytesWithByteArray_(data);
}

- (instancetype)initWithAMAvatarImage:(AMAvatarImage *)smallImage
                    withAMAvatarImage:(AMAvatarImage *)largeImage
                    withAMAvatarImage:(AMAvatarImage *)fullImage {
  if (self = [super init]) {
    self->smallImage_ = smallImage;
    self->largeImage_ = largeImage;
    self->fullImage_ = fullImage;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (AMAvatarImage *)getSmallImage {
  return smallImage_;
}

- (AMAvatarImage *)getLargeImage {
  return largeImage_;
}

- (AMAvatarImage *)getFullImage {
  return fullImage_;
}

- (jboolean)isEqual:(id)o {
  if (self == o) return YES;
  if (o == nil || [self getClass] != [o getClass]) return NO;
  AMAvatar *avatar = (AMAvatar *) check_class_cast(o, [AMAvatar class]);
  if (fullImage_ != nil ? ![fullImage_ isEqual:((AMAvatar *) nil_chk(avatar))->fullImage_] : ((AMAvatar *) nil_chk(avatar))->fullImage_ != nil) return NO;
  if (largeImage_ != nil ? ![largeImage_ isEqual:((AMAvatar *) nil_chk(avatar))->largeImage_] : ((AMAvatar *) nil_chk(avatar))->largeImage_ != nil) return NO;
  if (smallImage_ != nil ? ![smallImage_ isEqual:((AMAvatar *) nil_chk(avatar))->smallImage_] : ((AMAvatar *) nil_chk(avatar))->smallImage_ != nil) return NO;
  return YES;
}

- (NSUInteger)hash {
  jint result = smallImage_ != nil ? ((jint) [smallImage_ hash]) : 0;
  result = 31 * result + (largeImage_ != nil ? ((jint) [largeImage_ hash]) : 0);
  result = 31 * result + (fullImage_ != nil ? ((jint) [fullImage_ hash]) : 0);
  return result;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  IOSByteArray *small = [((BSBserValues *) nil_chk(values)) optBytesWithInt:1];
  if (small != nil) {
    smallImage_ = AMAvatarImage_fromBytesWithByteArray_(small);
  }
  IOSByteArray *large = [values optBytesWithInt:2];
  if (large != nil) {
    largeImage_ = AMAvatarImage_fromBytesWithByteArray_(large);
  }
  IOSByteArray *full = [values optBytesWithInt:3];
  if (full != nil) {
    fullImage_ = AMAvatarImage_fromBytesWithByteArray_(full);
  }
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (smallImage_ != nil) {
    [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:1 withBSBserObject:smallImage_];
  }
  if (largeImage_ != nil) {
    [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:2 withBSBserObject:smallImage_];
  }
  if (fullImage_ != nil) {
    [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:3 withBSBserObject:fullImage_];
  }
}

- (void)copyAllFieldsTo:(AMAvatar *)other {
  [super copyAllFieldsTo:other];
  other->smallImage_ = smallImage_;
  other->largeImage_ = largeImage_;
  other->fullImage_ = fullImage_;
}

@end

AMAvatar *AMAvatar_fromBytesWithByteArray_(IOSByteArray *data) {
  AMAvatar_init();
  return ((AMAvatar *) BSBser_parseWithBSBserObject_withByteArray_([[AMAvatar alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMAvatar)