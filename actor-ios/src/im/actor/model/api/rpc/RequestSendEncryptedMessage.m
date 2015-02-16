//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/rpc/RequestSendEncryptedMessage.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/EncryptedAesKey.h"
#include "im/actor/model/api/OutPeer.h"
#include "im/actor/model/api/rpc/RequestSendEncryptedMessage.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"
#include "java/util/ArrayList.h"
#include "java/util/List.h"

@interface ImActorModelApiRpcRequestSendEncryptedMessage () {
 @public
  ImActorModelApiOutPeer *peer_;
  jlong rid_;
  IOSByteArray *encryptedMessage_;
  id<JavaUtilList> keys_;
  id<JavaUtilList> ownKeys_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiRpcRequestSendEncryptedMessage, peer_, ImActorModelApiOutPeer *)
J2OBJC_FIELD_SETTER(ImActorModelApiRpcRequestSendEncryptedMessage, encryptedMessage_, IOSByteArray *)
J2OBJC_FIELD_SETTER(ImActorModelApiRpcRequestSendEncryptedMessage, keys_, id<JavaUtilList>)
J2OBJC_FIELD_SETTER(ImActorModelApiRpcRequestSendEncryptedMessage, ownKeys_, id<JavaUtilList>)

@implementation ImActorModelApiRpcRequestSendEncryptedMessage

+ (ImActorModelApiRpcRequestSendEncryptedMessage *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcRequestSendEncryptedMessage_fromBytesWithByteArray_(data);
}

- (instancetype)initWithImActorModelApiOutPeer:(ImActorModelApiOutPeer *)peer
                                      withLong:(jlong)rid
                                 withByteArray:(IOSByteArray *)encryptedMessage
                              withJavaUtilList:(id<JavaUtilList>)keys
                              withJavaUtilList:(id<JavaUtilList>)ownKeys {
  if (self = [super init]) {
    self->peer_ = peer;
    self->rid_ = rid;
    self->encryptedMessage_ = encryptedMessage;
    self->keys_ = keys;
    self->ownKeys_ = ownKeys;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (ImActorModelApiOutPeer *)getPeer {
  return self->peer_;
}

- (jlong)getRid {
  return self->rid_;
}

- (IOSByteArray *)getEncryptedMessage {
  return self->encryptedMessage_;
}

- (id<JavaUtilList>)getKeys {
  return self->keys_;
}

- (id<JavaUtilList>)getOwnKeys {
  return self->ownKeys_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->peer_ = [((BSBserValues *) nil_chk(values)) getObjWithInt:1 withBSBserObject:[[ImActorModelApiOutPeer alloc] init]];
  self->rid_ = [values getLongWithInt:3];
  self->encryptedMessage_ = [values getBytesWithInt:4];
  id<JavaUtilList> _keys = [[JavaUtilArrayList alloc] init];
  for (jint i = 0; i < [values getRepeatedCountWithInt:5]; i++) {
    [_keys addWithId:[[ImActorModelApiEncryptedAesKey alloc] init]];
  }
  self->keys_ = [values getRepeatedObjWithInt:5 withJavaUtilList:_keys];
  id<JavaUtilList> _ownKeys = [[JavaUtilArrayList alloc] init];
  for (jint i = 0; i < [values getRepeatedCountWithInt:6]; i++) {
    [_ownKeys addWithId:[[ImActorModelApiEncryptedAesKey alloc] init]];
  }
  self->ownKeys_ = [values getRepeatedObjWithInt:6 withJavaUtilList:_ownKeys];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (self->peer_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:1 withBSBserObject:self->peer_];
  [writer writeLongWithInt:3 withLong:self->rid_];
  if (self->encryptedMessage_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [writer writeBytesWithInt:4 withByteArray:self->encryptedMessage_];
  [writer writeRepeatedObjWithInt:5 withJavaUtilList:self->keys_];
  [writer writeRepeatedObjWithInt:6 withJavaUtilList:self->ownKeys_];
}

- (jint)getHeaderKey {
  return ImActorModelApiRpcRequestSendEncryptedMessage_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiRpcRequestSendEncryptedMessage *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->rid_ = rid_;
  other->encryptedMessage_ = encryptedMessage_;
  other->keys_ = keys_;
  other->ownKeys_ = ownKeys_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "fromBytesWithByteArray:", "fromBytes", "Lim.actor.model.api.rpc.RequestSendEncryptedMessage;", 0x9, "Ljava.io.IOException;" },
    { "initWithImActorModelApiOutPeer:withLong:withByteArray:withJavaUtilList:withJavaUtilList:", "RequestSendEncryptedMessage", NULL, 0x1, NULL },
    { "init", "RequestSendEncryptedMessage", NULL, 0x1, NULL },
    { "getPeer", NULL, "Lim.actor.model.api.OutPeer;", 0x1, NULL },
    { "getRid", NULL, "J", 0x1, NULL },
    { "getEncryptedMessage", NULL, "[B", 0x1, NULL },
    { "getKeys", NULL, "Ljava.util.List;", 0x1, NULL },
    { "getOwnKeys", NULL, "Ljava.util.List;", 0x1, NULL },
    { "parseWithBSBserValues:", "parse", "V", 0x1, "Ljava.io.IOException;" },
    { "serializeWithBSBserWriter:", "serialize", "V", 0x1, "Ljava.io.IOException;" },
    { "getHeaderKey", NULL, "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "HEADER_", NULL, 0x19, "I", NULL, .constantValue.asInt = ImActorModelApiRpcRequestSendEncryptedMessage_HEADER },
    { "peer_", NULL, 0x2, "Lim.actor.model.api.OutPeer;", NULL,  },
    { "rid_", NULL, 0x2, "J", NULL,  },
    { "encryptedMessage_", NULL, 0x2, "[B", NULL,  },
    { "keys_", NULL, 0x2, "Ljava.util.List;", NULL,  },
    { "ownKeys_", NULL, 0x2, "Ljava.util.List;", NULL,  },
  };
  static const char *superclass_type_args[] = {"Lim.actor.model.api.rpc.ResponseSeqDate;"};
  static const J2ObjcClassInfo _ImActorModelApiRpcRequestSendEncryptedMessage = { 1, "RequestSendEncryptedMessage", "im.actor.model.api.rpc", NULL, 0x1, 11, methods, 6, fields, 1, superclass_type_args};
  return &_ImActorModelApiRpcRequestSendEncryptedMessage;
}

@end

ImActorModelApiRpcRequestSendEncryptedMessage *ImActorModelApiRpcRequestSendEncryptedMessage_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcRequestSendEncryptedMessage_init();
  return ((ImActorModelApiRpcRequestSendEncryptedMessage *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiRpcRequestSendEncryptedMessage alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcRequestSendEncryptedMessage)
