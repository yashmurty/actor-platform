//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/rpc/RequestSubscribeToGroupOnline.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/GroupOutPeer.h"
#include "im/actor/model/api/rpc/RequestSubscribeToGroupOnline.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"
#include "java/util/ArrayList.h"
#include "java/util/List.h"

@interface ImActorModelApiRpcRequestSubscribeToGroupOnline () {
 @public
  id<JavaUtilList> groups_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiRpcRequestSubscribeToGroupOnline, groups_, id<JavaUtilList>)

@implementation ImActorModelApiRpcRequestSubscribeToGroupOnline

+ (ImActorModelApiRpcRequestSubscribeToGroupOnline *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcRequestSubscribeToGroupOnline_fromBytesWithByteArray_(data);
}

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)groups {
  if (self = [super init]) {
    self->groups_ = groups;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (id<JavaUtilList>)getGroups {
  return self->groups_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  id<JavaUtilList> _groups = [[JavaUtilArrayList alloc] init];
  for (jint i = 0; i < [((BSBserValues *) nil_chk(values)) getRepeatedCountWithInt:1]; i++) {
    [_groups addWithId:[[ImActorModelApiGroupOutPeer alloc] init]];
  }
  self->groups_ = [values getRepeatedObjWithInt:1 withJavaUtilList:_groups];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeRepeatedObjWithInt:1 withJavaUtilList:self->groups_];
}

- (jint)getHeaderKey {
  return ImActorModelApiRpcRequestSubscribeToGroupOnline_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiRpcRequestSubscribeToGroupOnline *)other {
  [super copyAllFieldsTo:other];
  other->groups_ = groups_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromBytesWithByteArray:", "fromBytes", "Lim.actor.model.api.rpc.RequestSubscribeToGroupOnline;", 0x9, "Ljava.io.IOException;" },
    { "initWithJavaUtilList:", "RequestSubscribeToGroupOnline", NULL, 0x1, NULL },
    { "init", "RequestSubscribeToGroupOnline", NULL, 0x1, NULL },
    { "getGroups", NULL, "Ljava.util.List;", 0x1, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
    { "getHeaderKey", NULL, "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "HEADER_", NULL, 0x19, "I", NULL, .constantValue.asInt = ImActorModelApiRpcRequestSubscribeToGroupOnline_HEADER },
    { "groups_", NULL, 0x2, "Ljava.util.List;", NULL,  },
  };
  static const char *superclass_type_args[] = {"Lim.actor.model.api.rpc.ResponseVoid;"};
  static const J2ObjcClassInfo _ImActorModelApiRpcRequestSubscribeToGroupOnline = { 1, "RequestSubscribeToGroupOnline", "im.actor.model.api.rpc", NULL, 0x1, 7, methods, 2, fields, 1, superclass_type_args};
  return &_ImActorModelApiRpcRequestSubscribeToGroupOnline;
}

@end

ImActorModelApiRpcRequestSubscribeToGroupOnline *ImActorModelApiRpcRequestSubscribeToGroupOnline_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcRequestSubscribeToGroupOnline_init();
  return ((ImActorModelApiRpcRequestSubscribeToGroupOnline *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiRpcRequestSubscribeToGroupOnline alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcRequestSubscribeToGroupOnline)
