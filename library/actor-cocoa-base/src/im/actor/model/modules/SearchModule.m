//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/SearchModule.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/SearchModule.java"

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/StorageProvider.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/droidkit/engine/ListEngine.h"
#include "im/actor/model/droidkit/engine/ListStorage.h"
#include "im/actor/model/modules/BaseModule.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/SearchModule.h"
#include "im/actor/model/modules/search/SearchActor.h"
#include "java/lang/Integer.h"
#include "java/util/List.h"

@interface ImActorModelModulesSearchModule () {
 @public
  id<DKListEngine> searchList_;
  DKActorRef *actorRef_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesSearchModule, searchList_, id<DKListEngine>)
J2OBJC_FIELD_SETTER(ImActorModelModulesSearchModule, actorRef_, DKActorRef *)

@interface ImActorModelModulesSearchModule_$1 () {
 @public
  ImActorModelModulesSearchModule *this$0_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesSearchModule_$1, this$0_, ImActorModelModulesSearchModule *)


#line 18
@implementation ImActorModelModulesSearchModule


#line 23
- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  if (self =
#line 24
  [super initWithImActorModelModulesModules:modules]) {
    
#line 26
    searchList_ = [((id<AMStorageProvider>) nil_chk([self storage])) createSearchListWithDKListStorage:[((id<AMStorageProvider>) nil_chk([self storage])) createList:ImActorModelModulesBaseModule_get_STORAGE_SEARCH_()]];
  }
  return self;
}


#line 29
- (void)run {
  
#line 30
  actorRef_ = [((DKActorSystem *) nil_chk(DKActorSystem_system())) actorOfWithDKProps:DKProps_createWithIOSClass_withDKActorCreator_(ImActorModelModulesSearchSearchActor_class_(), [[ImActorModelModulesSearchModule_$1 alloc] initWithImActorModelModulesSearchModule:self]) withNSString:
#line 35
  @"actor/search"];
}


#line 38
- (id<DKListEngine>)getSearchList {
  
#line 39
  return searchList_;
}


#line 42
- (void)onDialogsChangedWithJavaUtilList:(id<JavaUtilList>)dialogs {
  
#line 43
  [((DKActorRef *) nil_chk(actorRef_)) sendWithId:[[ImActorModelModulesSearchSearchActor_OnDialogsUpdated alloc] initWithJavaUtilList:dialogs]];
}


#line 46
- (void)onContactsChangedWithJavaLangIntegerArray:(IOSObjectArray *)contacts {
  
#line 47
  IOSIntArray *res = [IOSIntArray newArrayWithLength:((IOSObjectArray *) nil_chk(contacts))->size_];
  for (jint i = 0; i < res->size_; i++) {
    *IOSIntArray_GetRef(res, i) = [((JavaLangInteger *) nil_chk(IOSObjectArray_Get(contacts, i))) intValue];
  }
  [((DKActorRef *) nil_chk(actorRef_)) sendWithId:[[ImActorModelModulesSearchSearchActor_OnContactsUpdated alloc] initWithIntArray:res]];
}

- (void)copyAllFieldsTo:(ImActorModelModulesSearchModule *)other {
  [super copyAllFieldsTo:other];
  other->searchList_ = searchList_;
  other->actorRef_ = actorRef_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesSearchModule)

@implementation ImActorModelModulesSearchModule_$1


#line 32
- (ImActorModelModulesSearchSearchActor *)create {
  
#line 33
  return [[ImActorModelModulesSearchSearchActor alloc] initWithImActorModelModulesModules:[this$0_ modules]];
}

- (instancetype)initWithImActorModelModulesSearchModule:(ImActorModelModulesSearchModule *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelModulesSearchModule_$1 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesSearchModule_$1)