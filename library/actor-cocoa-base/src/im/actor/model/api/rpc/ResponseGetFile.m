//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/ResponseGetFile.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/ResponseGetFile.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/rpc/ResponseGetFile.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiRpcResponseGetFile () {
 @public
  IOSByteArray *payload_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiRpcResponseGetFile, payload_, IOSByteArray *)


#line 20
@implementation ImActorModelApiRpcResponseGetFile


#line 23
+ (ImActorModelApiRpcResponseGetFile *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcResponseGetFile_fromBytesWithByteArray_(data);
}


#line 29
- (instancetype)initWithByteArray:(IOSByteArray *)payload {
  if (self = [super init]) {
    
#line 30
    self->payload_ = payload;
  }
  return self;
}


#line 33
- (instancetype)init {
  return [super init];
}

- (IOSByteArray *)getPayload {
  
#line 38
  return self->payload_;
}


#line 42
- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->payload_ = [((BSBserValues *) nil_chk(values)) getBytesWithInt:1];
}


#line 47
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 48
  if (self->payload_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [((BSBserWriter *) nil_chk(writer)) writeBytesWithInt:1 withByteArray:self->payload_];
}

- (NSString *)description {
  NSString *res = @"tuple GetFile{";
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  
#line 63
  return ImActorModelApiRpcResponseGetFile_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiRpcResponseGetFile *)other {
  [super copyAllFieldsTo:other];
  other->payload_ = payload_;
}

@end

ImActorModelApiRpcResponseGetFile *ImActorModelApiRpcResponseGetFile_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcResponseGetFile_init();
  
#line 24
  return ((ImActorModelApiRpcResponseGetFile *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiRpcResponseGetFile alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcResponseGetFile)