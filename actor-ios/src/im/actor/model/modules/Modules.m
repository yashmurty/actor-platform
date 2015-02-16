//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/modules/Modules.java
//

#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/Networking.h"
#include "im/actor/model/Storage.h"
#include "im/actor/model/modules/Auth.h"
#include "im/actor/model/modules/Messages.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Presence.h"
#include "im/actor/model/modules/Typing.h"
#include "im/actor/model/modules/Updates.h"
#include "im/actor/model/modules/Users.h"
#include "im/actor/model/network/ActorApi.h"
#include "im/actor/model/network/Endpoints.h"
#include "im/actor/model/storage/PreferenceApiStorage.h"
#include "im/actor/model/storage/PreferencesStorage.h"

@interface ImActorModelModulesModules () {
 @public
  AMConfiguration *configuration_;
  AMActorApi *actorApi_;
  ImActorModelModulesAuth *auth_;
  id<AMPreferencesStorage> preferences_;
  ImActorModelModulesUsers *users_;
  ImActorModelModulesUpdates *updates_;
  ImActorModelModulesMessages *messages_;
  ImActorModelModulesPresence *presence_;
  ImActorModelModulesTyping *typing_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesModules, configuration_, AMConfiguration *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, actorApi_, AMActorApi *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, auth_, ImActorModelModulesAuth *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, preferences_, id<AMPreferencesStorage>)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, users_, ImActorModelModulesUsers *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, updates_, ImActorModelModulesUpdates *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, messages_, ImActorModelModulesMessages *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, presence_, ImActorModelModulesPresence *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, typing_, ImActorModelModulesTyping *)

@interface ImActorModelModulesModules_$1 () {
 @public
  ImActorModelModulesModules *this$0_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesModules_$1, this$0_, ImActorModelModulesModules *)

@implementation ImActorModelModulesModules

- (instancetype)initWithAMConfiguration:(AMConfiguration *)configuration {
  if (self = [super init]) {
    self->configuration_ = configuration;
    self->preferences_ = [((id<AMStorage>) nil_chk([((AMConfiguration *) nil_chk(configuration)) getStorage])) createPreferencesStorage];
    self->actorApi_ = [[AMActorApi alloc] initWithAMEndpoints:[[AMEndpoints alloc] initWithAMConnectionEndpointArray:[configuration getEndpoints]] withAMAuthKeyStorage:[[AMPreferenceApiStorage alloc] initWithAMPreferencesStorage:preferences_] withAMActorApiCallback:[[ImActorModelModulesModules_$1 alloc] initWithImActorModelModulesModules:self] withAMNetworking:[configuration getNetworking]];
    self->auth_ = [[ImActorModelModulesAuth alloc] initWithImActorModelModulesModules:self];
  }
  return self;
}

- (void)onLoggedIn {
  users_ = [[ImActorModelModulesUsers alloc] initWithImActorModelModulesModules:self];
  messages_ = [[ImActorModelModulesMessages alloc] initWithImActorModelModulesModules:self];
  updates_ = [[ImActorModelModulesUpdates alloc] initWithImActorModelModulesModules:self];
  presence_ = [[ImActorModelModulesPresence alloc] initWithImActorModelModulesModules:self];
  typing_ = [[ImActorModelModulesTyping alloc] initWithImActorModelModulesModules:self];
  [messages_ run];
  [updates_ run];
  [presence_ run];
}

- (id<AMPreferencesStorage>)getPreferences {
  return preferences_;
}

- (AMConfiguration *)getConfiguration {
  return configuration_;
}

- (ImActorModelModulesAuth *)getAuthModule {
  return auth_;
}

- (ImActorModelModulesUsers *)getUsersModule {
  return users_;
}

- (ImActorModelModulesMessages *)getMessagesModule {
  return messages_;
}

- (ImActorModelModulesUpdates *)getUpdatesModule {
  return updates_;
}

- (ImActorModelModulesTyping *)getTypingModule {
  return typing_;
}

- (ImActorModelModulesPresence *)getPresenceModule {
  return presence_;
}

- (AMActorApi *)getActorApi {
  return actorApi_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesModules *)other {
  [super copyAllFieldsTo:other];
  other->configuration_ = configuration_;
  other->actorApi_ = actorApi_;
  other->auth_ = auth_;
  other->preferences_ = preferences_;
  other->users_ = users_;
  other->updates_ = updates_;
  other->messages_ = messages_;
  other->presence_ = presence_;
  other->typing_ = typing_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithAMConfiguration:", "Modules", NULL, 0x1, NULL },
    { "onLoggedIn", NULL, "V", 0x1, NULL },
    { "getPreferences", NULL, "Lim.actor.model.storage.PreferencesStorage;", 0x1, NULL },
    { "getConfiguration", NULL, "Lim.actor.model.Configuration;", 0x1, NULL },
    { "getAuthModule", NULL, "Lim.actor.model.modules.Auth;", 0x1, NULL },
    { "getUsersModule", NULL, "Lim.actor.model.modules.Users;", 0x1, NULL },
    { "getMessagesModule", NULL, "Lim.actor.model.modules.Messages;", 0x1, NULL },
    { "getUpdatesModule", NULL, "Lim.actor.model.modules.Updates;", 0x1, NULL },
    { "getTypingModule", NULL, "Lim.actor.model.modules.Typing;", 0x1, NULL },
    { "getPresenceModule", NULL, "Lim.actor.model.modules.Presence;", 0x1, NULL },
    { "getActorApi", NULL, "Lim.actor.model.network.ActorApi;", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "configuration_", NULL, 0x12, "Lim.actor.model.Configuration;", NULL,  },
    { "actorApi_", NULL, 0x12, "Lim.actor.model.network.ActorApi;", NULL,  },
    { "auth_", NULL, 0x12, "Lim.actor.model.modules.Auth;", NULL,  },
    { "preferences_", NULL, 0x42, "Lim.actor.model.storage.PreferencesStorage;", NULL,  },
    { "users_", NULL, 0x42, "Lim.actor.model.modules.Users;", NULL,  },
    { "updates_", NULL, 0x42, "Lim.actor.model.modules.Updates;", NULL,  },
    { "messages_", NULL, 0x42, "Lim.actor.model.modules.Messages;", NULL,  },
    { "presence_", NULL, 0x42, "Lim.actor.model.modules.Presence;", NULL,  },
    { "typing_", NULL, 0x42, "Lim.actor.model.modules.Typing;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelModulesModules = { 1, "Modules", "im.actor.model.modules", NULL, 0x1, 11, methods, 9, fields, 0, NULL};
  return &_ImActorModelModulesModules;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesModules)

@implementation ImActorModelModulesModules_$1

- (void)onAuthIdInvalidatedWithLong:(jlong)authKey {
}

- (void)onNewSessionCreated {
  if (this$0_->updates_ != nil) {
    [this$0_->updates_ onNewSessionCreated];
  }
  if (this$0_->presence_ != nil) {
    [this$0_->presence_ onNewSessionCreated];
  }
}

- (void)onUpdateReceivedWithId:(id)obj {
  if (this$0_->updates_ != nil) {
    [this$0_->updates_ onUpdateReceivedWithId:obj];
  }
}

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelModulesModules_$1 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "onAuthIdInvalidatedWithLong:", "onAuthIdInvalidated", "V", 0x1, NULL },
    { "onNewSessionCreated", NULL, "V", 0x1, NULL },
    { "onUpdateReceivedWithId:", "onUpdateReceived", "V", 0x1, NULL },
    { "initWithImActorModelModulesModules:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lim.actor.model.modules.Modules;", NULL,  },
  };
  static const J2ObjcClassInfo _ImActorModelModulesModules_$1 = { 1, "$1", "im.actor.model.modules", "Modules", 0x8000, 4, methods, 1, fields, 0, NULL};
  return &_ImActorModelModulesModules_$1;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesModules_$1)
