//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/entity/MessageState.java
//

#ifndef _AMMessageState_H_
#define _AMMessageState_H_

#include "J2ObjC_header.h"
#include "java/lang/Enum.h"

typedef NS_ENUM(NSUInteger, AMMessageState) {
  AMMessageState_PENDING = 0,
  AMMessageState_SENT = 1,
  AMMessageState_RECEIVED = 2,
  AMMessageState_READ = 3,
  AMMessageState_ERROR = 4,
  AMMessageState_UNKNOWN = 5,
};

@interface AMMessageStateEnum : JavaLangEnum < NSCopying > {
 @public
  jint value_;
}

- (instancetype)initWithInt:(jint)value
               withNSString:(NSString *)__name
                    withInt:(jint)__ordinal;

- (jint)getValue;

+ (AMMessageStateEnum *)fromValueWithInt:(jint)value;

+ (IOSObjectArray *)values;
FOUNDATION_EXPORT IOSObjectArray *AMMessageStateEnum_values();

+ (AMMessageStateEnum *)valueOfWithNSString:(NSString *)name;

FOUNDATION_EXPORT AMMessageStateEnum *AMMessageStateEnum_valueOfWithNSString_(NSString *name);
- (id)copyWithZone:(NSZone *)zone;

@end

FOUNDATION_EXPORT BOOL AMMessageStateEnum_initialized;
J2OBJC_STATIC_INIT(AMMessageStateEnum)

FOUNDATION_EXPORT AMMessageStateEnum *AMMessageStateEnum_fromValueWithInt_(jint value);

FOUNDATION_EXPORT AMMessageStateEnum *AMMessageStateEnum_values_[];

#define AMMessageStateEnum_PENDING AMMessageStateEnum_values_[AMMessageState_PENDING]
J2OBJC_ENUM_CONSTANT_GETTER(AMMessageStateEnum, PENDING)

#define AMMessageStateEnum_SENT AMMessageStateEnum_values_[AMMessageState_SENT]
J2OBJC_ENUM_CONSTANT_GETTER(AMMessageStateEnum, SENT)

#define AMMessageStateEnum_RECEIVED AMMessageStateEnum_values_[AMMessageState_RECEIVED]
J2OBJC_ENUM_CONSTANT_GETTER(AMMessageStateEnum, RECEIVED)

#define AMMessageStateEnum_READ AMMessageStateEnum_values_[AMMessageState_READ]
J2OBJC_ENUM_CONSTANT_GETTER(AMMessageStateEnum, READ)

#define AMMessageStateEnum_ERROR AMMessageStateEnum_values_[AMMessageState_ERROR]
J2OBJC_ENUM_CONSTANT_GETTER(AMMessageStateEnum, ERROR)

#define AMMessageStateEnum_UNKNOWN AMMessageStateEnum_values_[AMMessageState_UNKNOWN]
J2OBJC_ENUM_CONSTANT_GETTER(AMMessageStateEnum, UNKNOWN)

typedef AMMessageStateEnum ImActorModelEntityMessageStateEnum;

J2OBJC_TYPE_LITERAL_HEADER(AMMessageStateEnum)

#endif // _AMMessageState_H_
