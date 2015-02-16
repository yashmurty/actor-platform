//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/jvm/JavaThreading.java
//

#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/ThreadPriority.h"
#include "im/actor/model/droidkit/actors/mailbox/ActorDispatcher.h"
#include "im/actor/model/jvm/JavaThreading.h"
#include "im/actor/model/jvm/threads/JavaAtomicInteger.h"
#include "im/actor/model/jvm/threads/JavaAtomicLong.h"
#include "im/actor/model/jvm/threads/JavaDispatcherActor.h"
#include "im/actor/model/jvm/threads/JavaThreadLocal.h"
#include "im/actor/model/util/AtomicIntegerCompat.h"
#include "im/actor/model/util/AtomicLongCompat.h"
#include "im/actor/model/util/ThreadLocalCompat.h"
#include "java/lang/Runtime.h"
#include "java/lang/System.h"

@implementation AMJavaThreading

- (instancetype)init {
  return [super init];
}

- (jlong)getActorTime {
  return JavaLangSystem_nanoTime() / 1000000;
}

- (jlong)getCurrentTime {
  return JavaLangSystem_currentTimeMillis();
}

- (jint)getCoresCount {
  return [((JavaLangRuntime *) nil_chk(JavaLangRuntime_getRuntime())) availableProcessors];
}

- (AMAtomicIntegerCompat *)createAtomicIntWithInt:(jint)init_ {
  return [[ImActorModelJvmThreadsJavaAtomicInteger alloc] initWithInt:init_];
}

- (AMAtomicLongCompat *)createAtomicLongWithLong:(jlong)init_ {
  return [[ImActorModelJvmThreadsJavaAtomicLong alloc] initWithLong:init_];
}

- (AMThreadLocalCompat *)createThreadLocal {
  return [[ImActorModelJvmThreadsJavaThreadLocal alloc] init];
}

- (DKActorDispatcher *)createDispatcherWithNSString:(NSString *)name
                                            withInt:(jint)threadsCount
                           withDKThreadPriorityEnum:(DKThreadPriorityEnum *)priority
                                  withDKActorSystem:(DKActorSystem *)actorSystem {
  return [[ImActorModelJvmThreadsJavaDispatcherActor alloc] initWithNSString:name withDKActorSystem:actorSystem withInt:threadsCount withDKThreadPriorityEnum:priority];
}

- (DKActorDispatcher *)createDefaultDispatcherWithNSString:(NSString *)name
                                  withDKThreadPriorityEnum:(DKThreadPriorityEnum *)priority
                                         withDKActorSystem:(DKActorSystem *)actorSystem {
  return [self createDispatcherWithNSString:name withInt:[self getCoresCount] withDKThreadPriorityEnum:priority withDKActorSystem:actorSystem];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", "JavaThreading", NULL, 0x1, NULL },
    { "getActorTime", NULL, "J", 0x1, NULL },
    { "getCurrentTime", NULL, "J", 0x1, NULL },
    { "getCoresCount", NULL, "I", 0x1, NULL },
    { "createAtomicIntWithInt:", "createAtomicInt", "Lim.actor.model.util.AtomicIntegerCompat;", 0x1, NULL },
    { "createAtomicLongWithLong:", "createAtomicLong", "Lim.actor.model.util.AtomicLongCompat;", 0x1, NULL },
    { "createThreadLocal", NULL, "Lim.actor.model.util.ThreadLocalCompat;", 0x1, NULL },
    { "createDispatcherWithNSString:withInt:withDKThreadPriorityEnum:withDKActorSystem:", "createDispatcher", "Lim.actor.model.droidkit.actors.mailbox.ActorDispatcher;", 0x1, NULL },
    { "createDefaultDispatcherWithNSString:withDKThreadPriorityEnum:withDKActorSystem:", "createDefaultDispatcher", "Lim.actor.model.droidkit.actors.mailbox.ActorDispatcher;", 0x1, NULL },
  };
  static const J2ObjcClassInfo _AMJavaThreading = { 1, "JavaThreading", "im.actor.model.jvm", NULL, 0x1, 9, methods, 0, NULL, 0, NULL};
  return &_AMJavaThreading;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMJavaThreading)
