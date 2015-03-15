//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/modules/Modules.java
//

#ifndef _ImActorModelModulesModules_H_
#define _ImActorModelModulesModules_H_

@class AMActorApi;
@class AMConfiguration;
@class AMI18nEngine;
@class ImActorModelModulesAuth;
@class ImActorModelModulesContacts;
@class ImActorModelModulesDisplayLists;
@class ImActorModelModulesFiles;
@class ImActorModelModulesGroups;
@class ImActorModelModulesMessages;
@class ImActorModelModulesNotifications;
@class ImActorModelModulesPresence;
@class ImActorModelModulesProfile;
@class ImActorModelModulesSettings;
@class ImActorModelModulesTyping;
@class ImActorModelModulesUpdates;
@class ImActorModelModulesUsers;
@protocol ImActorModelDroidkitEnginePreferencesStorage;

#include "J2ObjC_header.h"
#include "im/actor/model/network/ActorApiCallback.h"

@interface ImActorModelModulesModules : NSObject {
}

- (instancetype)initWithAMConfiguration:(AMConfiguration *)configuration;

- (void)run;

- (void)onLoggedIn;

- (ImActorModelModulesDisplayLists *)getDisplayLists;

- (id<ImActorModelDroidkitEnginePreferencesStorage>)getPreferences;

- (AMConfiguration *)getConfiguration;

- (ImActorModelModulesAuth *)getAuthModule;

- (ImActorModelModulesUsers *)getUsersModule;

- (ImActorModelModulesGroups *)getGroupsModule;

- (ImActorModelModulesMessages *)getMessagesModule;

- (ImActorModelModulesUpdates *)getUpdatesModule;

- (ImActorModelModulesTyping *)getTypingModule;

- (ImActorModelModulesPresence *)getPresenceModule;

- (AMActorApi *)getActorApi;

- (AMI18nEngine *)getI18nEngine;

- (ImActorModelModulesContacts *)getContactsModule;

- (ImActorModelModulesFiles *)getFilesModule;

- (ImActorModelModulesNotifications *)getNotifications;

- (ImActorModelModulesSettings *)getSettings;

- (ImActorModelModulesProfile *)getProfile;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesModules)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesModules)

@interface ImActorModelModulesModules_$1 : NSObject < AMActorApiCallback > {
}

- (void)onAuthIdInvalidatedWithLong:(jlong)authKey;

- (void)onNewSessionCreated;

- (void)onUpdateReceivedWithId:(id)obj;

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesModules_$1)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesModules_$1)

#endif // _ImActorModelModulesModules_H_