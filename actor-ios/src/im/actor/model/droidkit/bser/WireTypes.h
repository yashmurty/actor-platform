//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/droidkit/bser/WireTypes.java
//

#ifndef _BSWireTypes_H_
#define _BSWireTypes_H_

#include "J2ObjC_header.h"

#define BSWireTypes_TYPE_32BIT 5
#define BSWireTypes_TYPE_64BIT 1
#define BSWireTypes_TYPE_LENGTH_DELIMITED 2
#define BSWireTypes_TYPE_VARINT 0

@interface BSWireTypes : NSObject {
}

- (instancetype)init;

@end

J2OBJC_EMPTY_STATIC_INIT(BSWireTypes)

CF_EXTERN_C_BEGIN

J2OBJC_STATIC_FIELD_GETTER(BSWireTypes, TYPE_VARINT, jint)

J2OBJC_STATIC_FIELD_GETTER(BSWireTypes, TYPE_32BIT, jint)

J2OBJC_STATIC_FIELD_GETTER(BSWireTypes, TYPE_64BIT, jint)

J2OBJC_STATIC_FIELD_GETTER(BSWireTypes, TYPE_LENGTH_DELIMITED, jint)
CF_EXTERN_C_END

typedef BSWireTypes ImActorModelDroidkitBserWireTypes;

J2OBJC_TYPE_LITERAL_HEADER(BSWireTypes)

#endif // _BSWireTypes_H_
