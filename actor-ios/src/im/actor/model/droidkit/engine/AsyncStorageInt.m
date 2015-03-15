//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/droidkit/engine/AsyncStorageInt.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/droidkit/bser/BserCreator.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/engine/AsyncStorageActor.h"
#include "im/actor/model/droidkit/engine/AsyncStorageInt.h"
#include "im/actor/model/droidkit/engine/ListEngineCallback.h"
#include "im/actor/model/droidkit/engine/ListEngineItem.h"
#include "im/actor/model/droidkit/engine/ListStorage.h"
#include "java/lang/Integer.h"
#include "java/lang/InterruptedException.h"
#include "java/lang/Long.h"
#include "java/lang/RuntimeException.h"
#include "java/util/ArrayList.h"
#include "java/util/List.h"

@interface ImActorModelDroidkitEngineAsyncStorageInt () {
 @public
  DKActorRef *storageActor_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitEngineAsyncStorageInt, storageActor_, DKActorRef *)

@interface ImActorModelDroidkitEngineAsyncStorageInt_$1 () {
 @public
  id<ImActorModelDroidkitEngineListStorage> val$storage_;
  id<BSBserCreator> val$creator_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitEngineAsyncStorageInt_$1, val$storage_, id<ImActorModelDroidkitEngineListStorage>)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitEngineAsyncStorageInt_$1, val$creator_, id<BSBserCreator>)

@interface ImActorModelDroidkitEngineAsyncStorageInt_$2 () {
 @public
  id val$lock_;
  id<JavaUtilList> val$resultList_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitEngineAsyncStorageInt_$2, val$lock_, id)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitEngineAsyncStorageInt_$2, val$resultList_, id<JavaUtilList>)

@interface ImActorModelDroidkitEngineAsyncStorageInt_$3 () {
 @public
  id val$lock_;
  id<JavaUtilList> val$resultList_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitEngineAsyncStorageInt_$3, val$lock_, id)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitEngineAsyncStorageInt_$3, val$resultList_, id<JavaUtilList>)

@interface ImActorModelDroidkitEngineAsyncStorageInt_$4 () {
 @public
  id val$lock_;
  id<JavaUtilList> val$resultList_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelDroidkitEngineAsyncStorageInt_$4, val$lock_, id)
J2OBJC_FIELD_SETTER(ImActorModelDroidkitEngineAsyncStorageInt_$4, val$resultList_, id<JavaUtilList>)

@implementation ImActorModelDroidkitEngineAsyncStorageInt

jint ImActorModelDroidkitEngineAsyncStorageInt_NEXT_ID_ = 0;

- (instancetype)initWithImActorModelDroidkitEngineListStorage:(id<ImActorModelDroidkitEngineListStorage>)storage
                                            withBSBserCreator:(id<BSBserCreator>)creator {
  if (self = [super init]) {
    storageActor_ = [((DKActorSystem *) nil_chk(DKActorSystem_system())) actorOfWithDKProps:DKProps_createWithIOSClass_withDKActorCreator_(ImActorModelDroidkitEngineAsyncStorageActor_class_(), [[ImActorModelDroidkitEngineAsyncStorageInt_$1 alloc] initWithImActorModelDroidkitEngineListStorage:storage withBSBserCreator:creator]) withNSString:JreStrcat("$I", @"list_engine/", ImActorModelDroidkitEngineAsyncStorageInt_NEXT_ID_++)];
  }
  return self;
}

- (void)addOrUpdateItemsWithJavaUtilList:(id<JavaUtilList>)items {
  [((DKActorRef *) nil_chk(storageActor_)) sendWithId:[[ImActorModelDroidkitEngineAsyncStorageActor_AddOrUpdate alloc] initWithJavaUtilList:items]];
}

- (void)replaceItemsWithJavaUtilList:(id<JavaUtilList>)items {
  [((DKActorRef *) nil_chk(storageActor_)) sendWithId:[[ImActorModelDroidkitEngineAsyncStorageActor_Replace alloc] initWithJavaUtilList:items]];
}

- (void)removeWithLongArray:(IOSLongArray *)keys {
  [((DKActorRef *) nil_chk(storageActor_)) sendWithId:[[ImActorModelDroidkitEngineAsyncStorageActor_Remove alloc] initWithLongArray:keys]];
}

- (void)clear {
  [((DKActorRef *) nil_chk(storageActor_)) sendWithId:[[ImActorModelDroidkitEngineAsyncStorageActor_Clear alloc] init]];
}

- (id)getValueWithLong:(jlong)value {
  id lock = [[NSObject alloc] init];
  id<JavaUtilList> resultList = [[JavaUtilArrayList alloc] init];
  @synchronized(lock) {
    [((DKActorRef *) nil_chk(storageActor_)) sendWithId:[[ImActorModelDroidkitEngineAsyncStorageActor_LoadItem alloc] initWithLong:value withImActorModelDroidkitEngineAsyncStorageActor_LoadItemCallback:[[ImActorModelDroidkitEngineAsyncStorageInt_$2 alloc] initWithId:lock withJavaUtilList:resultList]]];
    @try {
      [lock wait];
    }
    @catch (JavaLangInterruptedException *e) {
      return nil;
    }
    if ([resultList size] > 0) {
      return [resultList getWithInt:0];
    }
    else {
      return nil;
    }
  }
}

- (id)getHeadValue {
  id lock = [[NSObject alloc] init];
  id<JavaUtilList> resultList = [[JavaUtilArrayList alloc] init];
  @synchronized(lock) {
    [((DKActorRef *) nil_chk(storageActor_)) sendWithId:[[ImActorModelDroidkitEngineAsyncStorageActor_LoadHead alloc] initWithImActorModelDroidkitEngineAsyncStorageActor_LoadItemCallback:[[ImActorModelDroidkitEngineAsyncStorageInt_$3 alloc] initWithId:lock withJavaUtilList:resultList]]];
    @try {
      [lock wait];
    }
    @catch (JavaLangInterruptedException *e) {
      return nil;
    }
    if ([resultList size] > 0) {
      return [resultList getWithInt:0];
    }
    else {
      return nil;
    }
  }
}

- (jint)getCount {
  id lock = [[NSObject alloc] init];
  id<JavaUtilList> resultList = [[JavaUtilArrayList alloc] init];
  @synchronized(lock) {
    [((DKActorRef *) nil_chk(storageActor_)) sendWithId:[[ImActorModelDroidkitEngineAsyncStorageActor_LoadCount alloc] initWithImActorModelDroidkitEngineAsyncStorageActor_LoadCountCallback:[[ImActorModelDroidkitEngineAsyncStorageInt_$4 alloc] initWithId:lock withJavaUtilList:resultList]]];
    @try {
      [lock wait];
    }
    @catch (JavaLangInterruptedException *e) {
      return 0;
    }
    if ([resultList size] > 0) {
      return [((JavaLangInteger *) nil_chk([resultList getWithInt:0])) intValue];
    }
    else {
      return 0;
    }
  }
}

- (void)loadForwardWithNSString:(NSString *)query
               withJavaLangLong:(JavaLangLong *)afterSortKey
                        withInt:(jint)limit
withImActorModelDroidkitEngineListEngineCallback:(id<ImActorModelDroidkitEngineListEngineCallback>)callback {
  [((DKActorRef *) nil_chk(storageActor_)) sendWithId:[[ImActorModelDroidkitEngineAsyncStorageActor_LoadForward alloc] initWithNSString:query withJavaLangLong:afterSortKey withInt:limit withImActorModelDroidkitEngineListEngineCallback:callback]];
}

- (void)loadBackwardWithNSString:(NSString *)query
                withJavaLangLong:(JavaLangLong *)beforeSortKey
                         withInt:(jint)limit
withImActorModelDroidkitEngineListEngineCallback:(id<ImActorModelDroidkitEngineListEngineCallback>)callback {
  [((DKActorRef *) nil_chk(storageActor_)) sendWithId:[[ImActorModelDroidkitEngineAsyncStorageActor_LoadBackward alloc] initWithNSString:query withJavaLangLong:beforeSortKey withInt:limit withImActorModelDroidkitEngineListEngineCallback:callback]];
}

- (void)loadCenterWithLong:(jlong)centerSortKey
                   withInt:(jint)limit
withImActorModelDroidkitEngineListEngineCallback:(id<ImActorModelDroidkitEngineListEngineCallback>)callback {
  @throw [[JavaLangRuntimeException alloc] initWithNSString:@"Unsupported"];
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitEngineAsyncStorageInt *)other {
  [super copyAllFieldsTo:other];
  other->storageActor_ = storageActor_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitEngineAsyncStorageInt)

@implementation ImActorModelDroidkitEngineAsyncStorageInt_$1

- (ImActorModelDroidkitEngineAsyncStorageActor *)create {
  return [[ImActorModelDroidkitEngineAsyncStorageActor alloc] initWithImActorModelDroidkitEngineListStorage:val$storage_ withBSBserCreator:val$creator_];
}

- (instancetype)initWithImActorModelDroidkitEngineListStorage:(id<ImActorModelDroidkitEngineListStorage>)capture$0
                                            withBSBserCreator:(id<BSBserCreator>)capture$1 {
  val$storage_ = capture$0;
  val$creator_ = capture$1;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitEngineAsyncStorageInt_$1 *)other {
  [super copyAllFieldsTo:other];
  other->val$storage_ = val$storage_;
  other->val$creator_ = val$creator_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitEngineAsyncStorageInt_$1)

@implementation ImActorModelDroidkitEngineAsyncStorageInt_$2

- (void)onLoadedWithBSBserObject:(BSBserObject<ImActorModelDroidkitEngineListEngineItem> *)item {
  @synchronized(val$lock_) {
    if (item != nil) {
      [((id<JavaUtilList>) nil_chk(val$resultList_)) addWithId:item];
    }
    [nil_chk(val$lock_) notify];
  }
}

- (instancetype)initWithId:(id)capture$0
          withJavaUtilList:(id<JavaUtilList>)capture$1 {
  val$lock_ = capture$0;
  val$resultList_ = capture$1;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitEngineAsyncStorageInt_$2 *)other {
  [super copyAllFieldsTo:other];
  other->val$lock_ = val$lock_;
  other->val$resultList_ = val$resultList_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitEngineAsyncStorageInt_$2)

@implementation ImActorModelDroidkitEngineAsyncStorageInt_$3

- (void)onLoadedWithBSBserObject:(BSBserObject<ImActorModelDroidkitEngineListEngineItem> *)item {
  @synchronized(val$lock_) {
    if (item != nil) {
      [((id<JavaUtilList>) nil_chk(val$resultList_)) addWithId:item];
    }
    [nil_chk(val$lock_) notify];
  }
}

- (instancetype)initWithId:(id)capture$0
          withJavaUtilList:(id<JavaUtilList>)capture$1 {
  val$lock_ = capture$0;
  val$resultList_ = capture$1;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitEngineAsyncStorageInt_$3 *)other {
  [super copyAllFieldsTo:other];
  other->val$lock_ = val$lock_;
  other->val$resultList_ = val$resultList_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitEngineAsyncStorageInt_$3)

@implementation ImActorModelDroidkitEngineAsyncStorageInt_$4

- (void)onLoadedWithInt:(jint)count {
  @synchronized(val$lock_) {
    [((id<JavaUtilList>) nil_chk(val$resultList_)) addWithId:JavaLangInteger_valueOfWithInt_(count)];
    [nil_chk(val$lock_) notify];
  }
}

- (instancetype)initWithId:(id)capture$0
          withJavaUtilList:(id<JavaUtilList>)capture$1 {
  val$lock_ = capture$0;
  val$resultList_ = capture$1;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelDroidkitEngineAsyncStorageInt_$4 *)other {
  [super copyAllFieldsTo:other];
  other->val$lock_ = val$lock_;
  other->val$resultList_ = val$resultList_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelDroidkitEngineAsyncStorageInt_$4)