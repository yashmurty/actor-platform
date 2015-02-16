//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/entity/GroupState.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/entity/GroupState.h"
#include "java/lang/IllegalArgumentException.h"

BOOL AMGroupStateEnum_initialized = NO;

AMGroupStateEnum *AMGroupStateEnum_values_[4];

@implementation AMGroupStateEnum

- (instancetype)initWithNSString:(NSString *)__name
                         withInt:(jint)__ordinal {
  return [super initWithNSString:__name withInt:__ordinal];
}

IOSObjectArray *AMGroupStateEnum_values() {
  AMGroupStateEnum_init();
  return [IOSObjectArray arrayWithObjects:AMGroupStateEnum_values_ count:4 type:AMGroupStateEnum_class_()];
}
+ (IOSObjectArray *)values {
  return AMGroupStateEnum_values();
}

+ (AMGroupStateEnum *)valueOfWithNSString:(NSString *)name {
  return AMGroupStateEnum_valueOfWithNSString_(name);
}

AMGroupStateEnum *AMGroupStateEnum_valueOfWithNSString_(NSString *name) {
  AMGroupStateEnum_init();
  for (int i = 0; i < 4; i++) {
    AMGroupStateEnum *e = AMGroupStateEnum_values_[i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:name];
  return nil;
}

- (id)copyWithZone:(NSZone *)zone {
  return self;
}

+ (void)initialize {
  if (self == [AMGroupStateEnum class]) {
    AMGroupStateEnum_JOINED = [[AMGroupStateEnum alloc] initWithNSString:@"JOINED" withInt:0];
    AMGroupStateEnum_KICKED = [[AMGroupStateEnum alloc] initWithNSString:@"KICKED" withInt:1];
    AMGroupStateEnum_DELETED_PENDING = [[AMGroupStateEnum alloc] initWithNSString:@"DELETED_PENDING" withInt:2];
    AMGroupStateEnum_DELETED = [[AMGroupStateEnum alloc] initWithNSString:@"DELETED" withInt:3];
    J2OBJC_SET_INITIALIZED(AMGroupStateEnum)
  }
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithNSString:withInt:", "init", NULL, 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "JOINED", "JOINED", 0x4019, "Lim.actor.model.entity.GroupState;", &AMGroupStateEnum_JOINED,  },
    { "KICKED", "KICKED", 0x4019, "Lim.actor.model.entity.GroupState;", &AMGroupStateEnum_KICKED,  },
    { "DELETED_PENDING", "DELETED_PENDING", 0x4019, "Lim.actor.model.entity.GroupState;", &AMGroupStateEnum_DELETED_PENDING,  },
    { "DELETED", "DELETED", 0x4019, "Lim.actor.model.entity.GroupState;", &AMGroupStateEnum_DELETED,  },
  };
  static const char *superclass_type_args[] = {"Lim.actor.model.entity.GroupState;"};
  static const J2ObjcClassInfo _AMGroupStateEnum = { 1, "GroupState", "im.actor.model.entity", NULL, 0x4011, 1, methods, 4, fields, 1, superclass_type_args};
  return &_AMGroupStateEnum;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMGroupStateEnum)
