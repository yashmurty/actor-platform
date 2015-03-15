//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/modules/Modules.java
//

#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/LocaleProvider.h"
#include "im/actor/model/NetworkProvider.h"
#include "im/actor/model/StorageProvider.h"
#include "im/actor/model/ThreadingProvider.h"
#include "im/actor/model/droidkit/engine/PreferencesStorage.h"
#include "im/actor/model/i18n/I18nEngine.h"
#include "im/actor/model/log/Log.h"
#include "im/actor/model/modules/Auth.h"
#include "im/actor/model/modules/Contacts.h"
#include "im/actor/model/modules/DisplayLists.h"
#include "im/actor/model/modules/Files.h"
#include "im/actor/model/modules/Groups.h"
#include "im/actor/model/modules/Messages.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Notifications.h"
#include "im/actor/model/modules/Presence.h"
#include "im/actor/model/modules/Profile.h"
#include "im/actor/model/modules/Settings.h"
#include "im/actor/model/modules/Typing.h"
#include "im/actor/model/modules/Updates.h"
#include "im/actor/model/modules/Users.h"
#include "im/actor/model/modules/utils/PreferenceApiStorage.h"
#include "im/actor/model/network/ActorApi.h"
#include "im/actor/model/network/Endpoints.h"

@interface ImActorModelModulesModules () {
 @public
  AMConfiguration *configuration_;
  AMI18nEngine *i18nEngine_;
  AMActorApi *actorApi_;
  ImActorModelModulesAuth *auth_;
  id<ImActorModelDroidkitEnginePreferencesStorage> preferences_;
  ImActorModelModulesUsers *users_;
  ImActorModelModulesGroups *groups_;
  ImActorModelModulesUpdates *updates_;
  ImActorModelModulesMessages *messages_;
  ImActorModelModulesPresence *presence_;
  ImActorModelModulesTyping *typing_;
  ImActorModelModulesFiles *filesModule_;
  ImActorModelModulesContacts *contacts_;
  ImActorModelModulesNotifications *notifications_;
  ImActorModelModulesSettings *settings_;
  ImActorModelModulesProfile *profile_;
  ImActorModelModulesDisplayLists *displayLists_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesModules, configuration_, AMConfiguration *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, i18nEngine_, AMI18nEngine *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, actorApi_, AMActorApi *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, auth_, ImActorModelModulesAuth *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, preferences_, id<ImActorModelDroidkitEnginePreferencesStorage>)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, users_, ImActorModelModulesUsers *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, groups_, ImActorModelModulesGroups *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, updates_, ImActorModelModulesUpdates *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, messages_, ImActorModelModulesMessages *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, presence_, ImActorModelModulesPresence *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, typing_, ImActorModelModulesTyping *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, filesModule_, ImActorModelModulesFiles *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, contacts_, ImActorModelModulesContacts *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, notifications_, ImActorModelModulesNotifications *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, settings_, ImActorModelModulesSettings *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, profile_, ImActorModelModulesProfile *)
J2OBJC_FIELD_SETTER(ImActorModelModulesModules, displayLists_, ImActorModelModulesDisplayLists *)

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
    jlong start = [((id<AMThreadingProvider>) nil_chk([((AMConfiguration *) nil_chk(configuration)) getThreadingProvider])) getActorTime];
    self->i18nEngine_ = [[AMI18nEngine alloc] initWithAMLocaleProvider:[configuration getLocaleProvider]];
    AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage5.1 in ", ([((id<AMThreadingProvider>) nil_chk([configuration getThreadingProvider])) getActorTime] - start), @" ms"));
    self->preferences_ = [((id<AMStorageProvider>) nil_chk([configuration getStorageProvider])) createPreferencesStorage];
    AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage5.2 in ", ([((id<AMThreadingProvider>) nil_chk([configuration getThreadingProvider])) getActorTime] - start), @" ms"));
    start = [((id<AMThreadingProvider>) nil_chk([configuration getThreadingProvider])) getActorTime];
    self->actorApi_ = [[AMActorApi alloc] initWithAMEndpoints:[[AMEndpoints alloc] initWithAMConnectionEndpointArray:[configuration getEndpoints]] withAMAuthKeyStorage:[[ImActorModelModulesUtilsPreferenceApiStorage alloc] initWithImActorModelDroidkitEnginePreferencesStorage:preferences_] withAMActorApiCallback:[[ImActorModelModulesModules_$1 alloc] initWithImActorModelModulesModules:self] withAMNetworkProvider:[configuration getNetworkProvider]];
    AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage5.3 in ", ([((id<AMThreadingProvider>) nil_chk([configuration getThreadingProvider])) getActorTime] - start), @" ms"));
    start = [((id<AMThreadingProvider>) nil_chk([configuration getThreadingProvider])) getActorTime];
    self->auth_ = [[ImActorModelModulesAuth alloc] initWithImActorModelModulesModules:self];
    AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage5.4 in ", ([((id<AMThreadingProvider>) nil_chk([configuration getThreadingProvider])) getActorTime] - start), @" ms"));
    start = [((id<AMThreadingProvider>) nil_chk([configuration getThreadingProvider])) getActorTime];
  }
  return self;
}

- (void)run {
  [((ImActorModelModulesAuth *) nil_chk(self->auth_)) run];
}

- (void)onLoggedIn {
  jlong start = [((id<AMThreadingProvider>) nil_chk([((AMConfiguration *) nil_chk(configuration_)) getThreadingProvider])) getActorTime];
  users_ = [[ImActorModelModulesUsers alloc] initWithImActorModelModulesModules:self];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.1 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  groups_ = [[ImActorModelModulesGroups alloc] initWithImActorModelModulesModules:self];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.2 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  messages_ = [[ImActorModelModulesMessages alloc] initWithImActorModelModulesModules:self];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.3 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  updates_ = [[ImActorModelModulesUpdates alloc] initWithImActorModelModulesModules:self];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.4 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  presence_ = [[ImActorModelModulesPresence alloc] initWithImActorModelModulesModules:self];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.5 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  typing_ = [[ImActorModelModulesTyping alloc] initWithImActorModelModulesModules:self];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.6 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  filesModule_ = [[ImActorModelModulesFiles alloc] initWithImActorModelModulesModules:self];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.6.2 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  notifications_ = [[ImActorModelModulesNotifications alloc] initWithImActorModelModulesModules:self];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.7 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  contacts_ = [[ImActorModelModulesContacts alloc] initWithImActorModelModulesModules:self];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.8 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  settings_ = [[ImActorModelModulesSettings alloc] initWithImActorModelModulesModules:self];
  profile_ = [[ImActorModelModulesProfile alloc] initWithImActorModelModulesModules:self];
  displayLists_ = [[ImActorModelModulesDisplayLists alloc] initWithImActorModelModulesModules:self];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.8.2 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  [filesModule_ run];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.9 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  [messages_ run];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.10 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  [updates_ run];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.11 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  [presence_ run];
  AMLog_dWithNSString_withNSString_(@"CORE_INIT", JreStrcat("$J$", @"Loading stage6.12 in ", ([((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime] - start), @" ms"));
  start = [((id<AMThreadingProvider>) nil_chk([configuration_ getThreadingProvider])) getActorTime];
  [presence_ onAppVisible];
  [notifications_ onAppVisible];
}

- (ImActorModelModulesDisplayLists *)getDisplayLists {
  return displayLists_;
}

- (id<ImActorModelDroidkitEnginePreferencesStorage>)getPreferences {
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

- (ImActorModelModulesGroups *)getGroupsModule {
  return groups_;
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

- (AMI18nEngine *)getI18nEngine {
  return i18nEngine_;
}

- (ImActorModelModulesContacts *)getContactsModule {
  return contacts_;
}

- (ImActorModelModulesFiles *)getFilesModule {
  return filesModule_;
}

- (ImActorModelModulesNotifications *)getNotifications {
  return notifications_;
}

- (ImActorModelModulesSettings *)getSettings {
  return settings_;
}

- (ImActorModelModulesProfile *)getProfile {
  return profile_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesModules *)other {
  [super copyAllFieldsTo:other];
  other->configuration_ = configuration_;
  other->i18nEngine_ = i18nEngine_;
  other->actorApi_ = actorApi_;
  other->auth_ = auth_;
  other->preferences_ = preferences_;
  other->users_ = users_;
  other->groups_ = groups_;
  other->updates_ = updates_;
  other->messages_ = messages_;
  other->presence_ = presence_;
  other->typing_ = typing_;
  other->filesModule_ = filesModule_;
  other->contacts_ = contacts_;
  other->notifications_ = notifications_;
  other->settings_ = settings_;
  other->profile_ = profile_;
  other->displayLists_ = displayLists_;
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

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesModules_$1)