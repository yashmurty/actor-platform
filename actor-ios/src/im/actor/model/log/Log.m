//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/log/Log.java
//

#include "J2ObjC_source.h"
#include "im/actor/model/LogCallback.h"
#include "im/actor/model/log/Log.h"
#include "java/lang/Throwable.h"

@interface AMLog () {
}
@end

@implementation AMLog

id<AMLogCallback> AMLog_log_;

+ (id<AMLogCallback>)getLog {
  return AMLog_getLog();
}

+ (void)setLogWithAMLogCallback:(id<AMLogCallback>)log {
  AMLog_setLogWithAMLogCallback_(log);
}

+ (void)wWithNSString:(NSString *)tag
         withNSString:(NSString *)message {
  AMLog_wWithNSString_withNSString_(tag, message);
}

+ (void)eWithNSString:(NSString *)tag
withJavaLangThrowable:(JavaLangThrowable *)throwable {
  AMLog_eWithNSString_withJavaLangThrowable_(tag, throwable);
}

+ (void)dWithNSString:(NSString *)tag
         withNSString:(NSString *)message {
  AMLog_dWithNSString_withNSString_(tag, message);
}

+ (void)vWithNSString:(NSString *)tag
         withNSString:(NSString *)message {
  AMLog_vWithNSString_withNSString_(tag, message);
}

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "getLog", NULL, "Lim.actor.model.LogCallback;", 0x9, NULL },
    { "setLogWithAMLogCallback:", "setLog", "V", 0x9, NULL },
    { "wWithNSString:withNSString:", "w", "V", 0x9, NULL },
    { "eWithNSString:withJavaLangThrowable:", "e", "V", 0x9, NULL },
    { "dWithNSString:withNSString:", "d", "V", 0x9, NULL },
    { "vWithNSString:withNSString:", "v", "V", 0x9, NULL },
    { "init", NULL, NULL, 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "log_", NULL, 0xa, "Lim.actor.model.LogCallback;", &AMLog_log_,  },
  };
  static const J2ObjcClassInfo _AMLog = { 1, "Log", "im.actor.model.log", NULL, 0x1, 7, methods, 1, fields, 0, NULL};
  return &_AMLog;
}

@end

id<AMLogCallback> AMLog_getLog() {
  AMLog_init();
  return AMLog_log_;
}

void AMLog_setLogWithAMLogCallback_(id<AMLogCallback> log) {
  AMLog_init();
  AMLog_log_ = log;
}

void AMLog_wWithNSString_withNSString_(NSString *tag, NSString *message) {
  AMLog_init();
  if (AMLog_log_ != nil) {
    [AMLog_log_ w:tag withMessage:message];
  }
}

void AMLog_eWithNSString_withJavaLangThrowable_(NSString *tag, JavaLangThrowable *throwable) {
  AMLog_init();
  if (AMLog_log_ != nil) {
    [AMLog_log_ v:tag withError:throwable];
  }
}

void AMLog_dWithNSString_withNSString_(NSString *tag, NSString *message) {
  AMLog_init();
  if (AMLog_log_ != nil) {
    [AMLog_log_ d:tag withMessage:message];
  }
}

void AMLog_vWithNSString_withNSString_(NSString *tag, NSString *message) {
  AMLog_init();
  if (AMLog_log_ != nil) {
    [AMLog_log_ v:tag withMessage:message];
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMLog)
