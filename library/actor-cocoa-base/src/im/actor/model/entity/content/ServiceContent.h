//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/entity/content/ServiceContent.java
//

#ifndef _AMServiceContent_H_
#define _AMServiceContent_H_

#include "J2ObjC_header.h"
#include "im/actor/model/entity/content/AbsContent.h"

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;

@interface AMServiceContent : AMAbsContent

#pragma mark Public

- (instancetype)initWithNSString:(NSString *)compatText;

- (NSString *)getCompatText;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

+ (AMServiceContent *)serviceFromBytesWithByteArray:(IOSByteArray *)data;

#pragma mark Protected

- (instancetype)init;

- (AMAbsContent_ContentTypeEnum *)getContentType;

@end

J2OBJC_EMPTY_STATIC_INIT(AMServiceContent)

FOUNDATION_EXPORT AMServiceContent *AMServiceContent_serviceFromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void AMServiceContent_initWithNSString_(AMServiceContent *self, NSString *compatText);

FOUNDATION_EXPORT AMServiceContent *new_AMServiceContent_initWithNSString_(NSString *compatText) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void AMServiceContent_init(AMServiceContent *self);

FOUNDATION_EXPORT AMServiceContent *new_AMServiceContent_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMServiceContent)

typedef AMServiceContent ImActorModelEntityContentServiceContent;

#endif // _AMServiceContent_H_