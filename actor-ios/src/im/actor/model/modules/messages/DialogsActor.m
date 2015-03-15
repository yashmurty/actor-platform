//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/modules/messages/DialogsActor.java
//

#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/engine/ListEngine.h"
#include "im/actor/model/entity/Avatar.h"
#include "im/actor/model/entity/ContentDescription.h"
#include "im/actor/model/entity/ContentType.h"
#include "im/actor/model/entity/Dialog.h"
#include "im/actor/model/entity/DialogBuilder.h"
#include "im/actor/model/entity/Group.h"
#include "im/actor/model/entity/Message.h"
#include "im/actor/model/entity/MessageState.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/entity/PeerType.h"
#include "im/actor/model/entity/User.h"
#include "im/actor/model/entity/content/AbsContent.h"
#include "im/actor/model/modules/Messages.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/messages/DialogsActor.h"
#include "im/actor/model/modules/messages/entity/DialogHistory.h"
#include "im/actor/model/modules/utils/ModuleActor.h"
#include "im/actor/model/util/JavaUtil.h"
#include "java/util/ArrayList.h"
#include "java/util/List.h"

__attribute__((unused)) static void ImActorModelModulesMessagesDialogsActor_onMessageWithAMPeer_withAMMessage_withBoolean_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer, AMMessage *message, jboolean forceWrite);
__attribute__((unused)) static void ImActorModelModulesMessagesDialogsActor_onUserChangedWithAMUser_(ImActorModelModulesMessagesDialogsActor *self, AMUser *user);
__attribute__((unused)) static void ImActorModelModulesMessagesDialogsActor_onGroupChangedWithAMGroup_(ImActorModelModulesMessagesDialogsActor *self, AMGroup *group);
__attribute__((unused)) static void ImActorModelModulesMessagesDialogsActor_onChatDeletedWithAMPeer_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer);
__attribute__((unused)) static void ImActorModelModulesMessagesDialogsActor_onChatClearWithAMPeer_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer);
__attribute__((unused)) static void ImActorModelModulesMessagesDialogsActor_onMessageStatusChangedWithAMPeer_withLong_withAMMessageStateEnum_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer, jlong rid, AMMessageStateEnum *state);
__attribute__((unused)) static void ImActorModelModulesMessagesDialogsActor_onMessageSentWithAMPeer_withLong_withLong_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer, jlong rid, jlong date);
__attribute__((unused)) static void ImActorModelModulesMessagesDialogsActor_onMessageContentChangedWithAMPeer_withLong_withAMAbsContent_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer, jlong rid, AMAbsContent *content);
__attribute__((unused)) static void ImActorModelModulesMessagesDialogsActor_onCounterChangedWithAMPeer_withInt_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer, jint count);
__attribute__((unused)) static void ImActorModelModulesMessagesDialogsActor_onHistoryLoadedWithJavaUtilList_(ImActorModelModulesMessagesDialogsActor *self, id<JavaUtilList> history);
__attribute__((unused)) static ImActorModelModulesMessagesDialogsActor_PeerDesc *ImActorModelModulesMessagesDialogsActor_buildPeerDescWithAMPeer_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer);

@interface ImActorModelModulesMessagesDialogsActor () {
 @public
  id<ImActorModelDroidkitEngineListEngine> dialogs_;
}

- (void)onMessageWithAMPeer:(AMPeer *)peer
              withAMMessage:(AMMessage *)message
                withBoolean:(jboolean)forceWrite;

- (void)onUserChangedWithAMUser:(AMUser *)user;

- (void)onGroupChangedWithAMGroup:(AMGroup *)group;

- (void)onChatDeletedWithAMPeer:(AMPeer *)peer;

- (void)onChatClearWithAMPeer:(AMPeer *)peer;

- (void)onMessageStatusChangedWithAMPeer:(AMPeer *)peer
                                withLong:(jlong)rid
                  withAMMessageStateEnum:(AMMessageStateEnum *)state;

- (void)onMessageSentWithAMPeer:(AMPeer *)peer
                       withLong:(jlong)rid
                       withLong:(jlong)date;

- (void)onMessageContentChangedWithAMPeer:(AMPeer *)peer
                                 withLong:(jlong)rid
                         withAMAbsContent:(AMAbsContent *)content;

- (void)onCounterChangedWithAMPeer:(AMPeer *)peer
                           withInt:(jint)count;

- (void)onHistoryLoadedWithJavaUtilList:(id<JavaUtilList>)history;

- (ImActorModelModulesMessagesDialogsActor_PeerDesc *)buildPeerDescWithAMPeer:(AMPeer *)peer;
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor, dialogs_, id<ImActorModelDroidkitEngineListEngine>)

@interface ImActorModelModulesMessagesDialogsActor_PeerDesc () {
 @public
  NSString *title_;
  AMAvatar *avatar_;
}
- (instancetype)initWithImActorModelModulesMessagesDialogsActor:(ImActorModelModulesMessagesDialogsActor *)outer$
                                                   withNSString:(NSString *)title
                                                   withAMAvatar:(AMAvatar *)avatar;
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_PeerDesc, title_, NSString *)
J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_PeerDesc, avatar_, AMAvatar *)

@interface ImActorModelModulesMessagesDialogsActor_InMessage () {
 @public
  AMPeer *peer_;
  AMMessage *message_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_InMessage, peer_, AMPeer *)
J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_InMessage, message_, AMMessage *)

@interface ImActorModelModulesMessagesDialogsActor_UserChanged () {
 @public
  AMUser *user_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_UserChanged, user_, AMUser *)

@interface ImActorModelModulesMessagesDialogsActor_GroupChanged () {
 @public
  AMGroup *group_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_GroupChanged, group_, AMGroup *)

@interface ImActorModelModulesMessagesDialogsActor_ChatClear () {
 @public
  AMPeer *peer_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_ChatClear, peer_, AMPeer *)

@interface ImActorModelModulesMessagesDialogsActor_ChatDelete () {
 @public
  AMPeer *peer_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_ChatDelete, peer_, AMPeer *)

@interface ImActorModelModulesMessagesDialogsActor_MessageStateChanged () {
 @public
  AMPeer *peer_;
  jlong rid_;
  AMMessageStateEnum *state_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_MessageStateChanged, peer_, AMPeer *)
J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_MessageStateChanged, state_, AMMessageStateEnum *)

@interface ImActorModelModulesMessagesDialogsActor_MessageSent () {
 @public
  AMPeer *peer_;
  jlong rid_;
  jlong date_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_MessageSent, peer_, AMPeer *)

@interface ImActorModelModulesMessagesDialogsActor_MessageContentChanged () {
 @public
  AMPeer *peer_;
  jlong rid_;
  AMAbsContent *content_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_MessageContentChanged, peer_, AMPeer *)
J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_MessageContentChanged, content_, AMAbsContent *)

@interface ImActorModelModulesMessagesDialogsActor_MessageDeleted () {
 @public
  AMPeer *peer_;
  AMMessage *topMessage_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_MessageDeleted, peer_, AMPeer *)
J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_MessageDeleted, topMessage_, AMMessage *)

@interface ImActorModelModulesMessagesDialogsActor_HistoryLoaded () {
 @public
  id<JavaUtilList> history_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_HistoryLoaded, history_, id<JavaUtilList>)

@interface ImActorModelModulesMessagesDialogsActor_CounterChanged () {
 @public
  AMPeer *peer_;
  jint count_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesDialogsActor_CounterChanged, peer_, AMPeer *)

@implementation ImActorModelModulesMessagesDialogsActor

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)messenger {
  return [super initWithImActorModelModulesModules:messenger];
}

- (void)preStart {
  [super preStart];
  self->dialogs_ = [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getDialogsEngine];
}

- (void)onMessageWithAMPeer:(AMPeer *)peer
              withAMMessage:(AMMessage *)message
                withBoolean:(jboolean)forceWrite {
  ImActorModelModulesMessagesDialogsActor_onMessageWithAMPeer_withAMMessage_withBoolean_(self, peer, message, forceWrite);
}

- (void)onUserChangedWithAMUser:(AMUser *)user {
  ImActorModelModulesMessagesDialogsActor_onUserChangedWithAMUser_(self, user);
}

- (void)onGroupChangedWithAMGroup:(AMGroup *)group {
  ImActorModelModulesMessagesDialogsActor_onGroupChangedWithAMGroup_(self, group);
}

- (void)onChatDeletedWithAMPeer:(AMPeer *)peer {
  ImActorModelModulesMessagesDialogsActor_onChatDeletedWithAMPeer_(self, peer);
}

- (void)onChatClearWithAMPeer:(AMPeer *)peer {
  ImActorModelModulesMessagesDialogsActor_onChatClearWithAMPeer_(self, peer);
}

- (void)onMessageStatusChangedWithAMPeer:(AMPeer *)peer
                                withLong:(jlong)rid
                  withAMMessageStateEnum:(AMMessageStateEnum *)state {
  ImActorModelModulesMessagesDialogsActor_onMessageStatusChangedWithAMPeer_withLong_withAMMessageStateEnum_(self, peer, rid, state);
}

- (void)onMessageSentWithAMPeer:(AMPeer *)peer
                       withLong:(jlong)rid
                       withLong:(jlong)date {
  ImActorModelModulesMessagesDialogsActor_onMessageSentWithAMPeer_withLong_withLong_(self, peer, rid, date);
}

- (void)onMessageContentChangedWithAMPeer:(AMPeer *)peer
                                 withLong:(jlong)rid
                         withAMAbsContent:(AMAbsContent *)content {
  ImActorModelModulesMessagesDialogsActor_onMessageContentChangedWithAMPeer_withLong_withAMAbsContent_(self, peer, rid, content);
}

- (void)onCounterChangedWithAMPeer:(AMPeer *)peer
                           withInt:(jint)count {
  ImActorModelModulesMessagesDialogsActor_onCounterChangedWithAMPeer_withInt_(self, peer, count);
}

- (void)onHistoryLoadedWithJavaUtilList:(id<JavaUtilList>)history {
  ImActorModelModulesMessagesDialogsActor_onHistoryLoadedWithJavaUtilList_(self, history);
}

- (ImActorModelModulesMessagesDialogsActor_PeerDesc *)buildPeerDescWithAMPeer:(AMPeer *)peer {
  return ImActorModelModulesMessagesDialogsActor_buildPeerDescWithAMPeer_(self, peer);
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_InMessage class]]) {
    ImActorModelModulesMessagesDialogsActor_InMessage *inMessage = (ImActorModelModulesMessagesDialogsActor_InMessage *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_InMessage class]);
    ImActorModelModulesMessagesDialogsActor_onMessageWithAMPeer_withAMMessage_withBoolean_(self, [((ImActorModelModulesMessagesDialogsActor_InMessage *) nil_chk(inMessage)) getPeer], [inMessage getMessage], NO);
  }
  else if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_UserChanged class]]) {
    ImActorModelModulesMessagesDialogsActor_UserChanged *userChanged = (ImActorModelModulesMessagesDialogsActor_UserChanged *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_UserChanged class]);
    ImActorModelModulesMessagesDialogsActor_onUserChangedWithAMUser_(self, [((ImActorModelModulesMessagesDialogsActor_UserChanged *) nil_chk(userChanged)) getUser]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_ChatClear class]]) {
    ImActorModelModulesMessagesDialogsActor_onChatClearWithAMPeer_(self, [((ImActorModelModulesMessagesDialogsActor_ChatClear *) nil_chk(((ImActorModelModulesMessagesDialogsActor_ChatClear *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_ChatClear class])))) getPeer]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_ChatDelete class]]) {
    ImActorModelModulesMessagesDialogsActor_onChatDeletedWithAMPeer_(self, [((ImActorModelModulesMessagesDialogsActor_ChatDelete *) nil_chk(((ImActorModelModulesMessagesDialogsActor_ChatDelete *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_ChatDelete class])))) getPeer]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_MessageStateChanged class]]) {
    ImActorModelModulesMessagesDialogsActor_MessageStateChanged *messageStateChanged = (ImActorModelModulesMessagesDialogsActor_MessageStateChanged *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_MessageStateChanged class]);
    ImActorModelModulesMessagesDialogsActor_onMessageStatusChangedWithAMPeer_withLong_withAMMessageStateEnum_(self, [((ImActorModelModulesMessagesDialogsActor_MessageStateChanged *) nil_chk(messageStateChanged)) getPeer], [messageStateChanged getRid], [messageStateChanged getState]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_CounterChanged class]]) {
    ImActorModelModulesMessagesDialogsActor_CounterChanged *counterChanged = (ImActorModelModulesMessagesDialogsActor_CounterChanged *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_CounterChanged class]);
    ImActorModelModulesMessagesDialogsActor_onCounterChangedWithAMPeer_withInt_(self, [((ImActorModelModulesMessagesDialogsActor_CounterChanged *) nil_chk(counterChanged)) getPeer], [counterChanged getCount]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_MessageDeleted class]]) {
    ImActorModelModulesMessagesDialogsActor_MessageDeleted *deleted = (ImActorModelModulesMessagesDialogsActor_MessageDeleted *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_MessageDeleted class]);
    ImActorModelModulesMessagesDialogsActor_onMessageWithAMPeer_withAMMessage_withBoolean_(self, [((ImActorModelModulesMessagesDialogsActor_MessageDeleted *) nil_chk(deleted)) getPeer], [deleted getTopMessage], YES);
  }
  else if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_HistoryLoaded class]]) {
    ImActorModelModulesMessagesDialogsActor_HistoryLoaded *historyLoaded = (ImActorModelModulesMessagesDialogsActor_HistoryLoaded *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_HistoryLoaded class]);
    ImActorModelModulesMessagesDialogsActor_onHistoryLoadedWithJavaUtilList_(self, [((ImActorModelModulesMessagesDialogsActor_HistoryLoaded *) nil_chk(historyLoaded)) getHistory]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_GroupChanged class]]) {
    ImActorModelModulesMessagesDialogsActor_GroupChanged *groupChanged = (ImActorModelModulesMessagesDialogsActor_GroupChanged *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_GroupChanged class]);
    ImActorModelModulesMessagesDialogsActor_onGroupChangedWithAMGroup_(self, [((ImActorModelModulesMessagesDialogsActor_GroupChanged *) nil_chk(groupChanged)) getGroup]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_MessageSent class]]) {
    ImActorModelModulesMessagesDialogsActor_MessageSent *messageSent = (ImActorModelModulesMessagesDialogsActor_MessageSent *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_MessageSent class]);
    ImActorModelModulesMessagesDialogsActor_onMessageSentWithAMPeer_withLong_withLong_(self, [((ImActorModelModulesMessagesDialogsActor_MessageSent *) nil_chk(messageSent)) getPeer], [messageSent getRid], [messageSent getDate]);
  }
  else if ([message isKindOfClass:[ImActorModelModulesMessagesDialogsActor_MessageContentChanged class]]) {
    ImActorModelModulesMessagesDialogsActor_MessageContentChanged *contentChanged = (ImActorModelModulesMessagesDialogsActor_MessageContentChanged *) check_class_cast(message, [ImActorModelModulesMessagesDialogsActor_MessageContentChanged class]);
    ImActorModelModulesMessagesDialogsActor_onMessageContentChangedWithAMPeer_withLong_withAMAbsContent_(self, [((ImActorModelModulesMessagesDialogsActor_MessageContentChanged *) nil_chk(contentChanged)) getPeer], [contentChanged getRid], [contentChanged getContent]);
  }
  else {
    [self dropWithId:message];
  }
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor *)other {
  [super copyAllFieldsTo:other];
  other->dialogs_ = dialogs_;
}

@end

void ImActorModelModulesMessagesDialogsActor_onMessageWithAMPeer_withAMMessage_withBoolean_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer, AMMessage *message, jboolean forceWrite) {
  ImActorModelModulesMessagesDialogsActor_PeerDesc *peerDesc = ImActorModelModulesMessagesDialogsActor_buildPeerDescWithAMPeer_(self, peer);
  if (peerDesc == nil) {
    return;
  }
  if (message == nil) {
    if (!forceWrite) {
      return;
    }
    ImActorModelModulesMessagesDialogsActor_onChatClearWithAMPeer_(self, peer);
  }
  else {
    AMDialog *dialog = [((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) getValueWithLong:[((AMPeer *) nil_chk(peer)) getUnuqueId]];
    AMContentDescription *contentDescription = AMContentDescription_fromContentWithAMAbsContent_([message getContent]);
    AMDialogBuilder *builder = [((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) [[AMDialogBuilder alloc] init]) setRidWithLong:[message getRid]])) setTimeWithLong:[message getDate]])) setMessageTypeWithAMContentTypeEnum:[((AMContentDescription *) nil_chk(contentDescription)) getContentType]])) setTextWithNSString:[contentDescription getText]])) setRelatedUidWithInt:[contentDescription getRelatedUser]])) setStatusWithAMMessageStateEnum:[message getMessageState]])) setSenderIdWithInt:[message getSenderId]];
    if (dialog != nil) {
      if (!forceWrite && [dialog getSortDate] > [message getSortDate]) {
        return;
      }
      (void) [((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk(builder)) setPeerWithAMPeer:[dialog getPeer]])) setDialogTitleWithNSString:[dialog getDialogTitle]])) setDialogAvatarWithAMAvatar:[dialog getDialogAvatar]])) setUnreadCountWithInt:[dialog getUnreadCount]])) setSortKeyWithLong:[dialog getSortDate]];
      if (![contentDescription isSilent]) {
        (void) [builder setSortKeyWithLong:[message getSortDate]];
      }
    }
    else {
      if ([contentDescription isSilent]) {
        return;
      }
      (void) [((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk(builder)) setPeerWithAMPeer:peer])) setDialogTitleWithNSString:[((ImActorModelModulesMessagesDialogsActor_PeerDesc *) nil_chk(peerDesc)) getTitle]])) setDialogAvatarWithAMAvatar:[peerDesc getAvatar]])) setUnreadCountWithInt:0])) setSortKeyWithLong:[message getSortDate]];
    }
    [self->dialogs_ addOrUpdateItemWithBSBserObject:[((AMDialogBuilder *) nil_chk(builder)) createDialog]];
  }
}

void ImActorModelModulesMessagesDialogsActor_onUserChangedWithAMUser_(ImActorModelModulesMessagesDialogsActor *self, AMUser *user) {
  AMDialog *dialog = [((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) getValueWithLong:[((AMPeer *) nil_chk([((AMUser *) nil_chk(user)) peer])) getUnuqueId]];
  if (dialog != nil) {
    if ([((NSString *) nil_chk([dialog getDialogTitle])) isEqual:[user getName]] && AMJavaUtil_equalsEWithId_withId_([dialog getDialogAvatar], [user getAvatar])) {
      return;
    }
    [self->dialogs_ addOrUpdateItemWithBSBserObject:[dialog editPeerInfoWithNSString:[user getName] withAMAvatar:[user getAvatar]]];
  }
}

void ImActorModelModulesMessagesDialogsActor_onGroupChangedWithAMGroup_(ImActorModelModulesMessagesDialogsActor *self, AMGroup *group) {
  AMDialog *dialog = [((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) getValueWithLong:[((AMPeer *) nil_chk([((AMGroup *) nil_chk(group)) peer])) getUnuqueId]];
  if (dialog != nil) {
    if ([((NSString *) nil_chk([dialog getDialogTitle])) isEqual:[group getTitle]] && AMJavaUtil_equalsEWithId_withId_([dialog getDialogAvatar], [group getAvatar])) {
      return;
    }
    [self->dialogs_ addOrUpdateItemWithBSBserObject:[dialog editPeerInfoWithNSString:[group getTitle] withAMAvatar:[group getAvatar]]];
  }
}

void ImActorModelModulesMessagesDialogsActor_onChatDeletedWithAMPeer_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer) {
  [((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) removeItemWithLong:[((AMPeer *) nil_chk(peer)) getUnuqueId]];
}

void ImActorModelModulesMessagesDialogsActor_onChatClearWithAMPeer_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer) {
  AMDialog *dialog = [((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) getValueWithLong:[((AMPeer *) nil_chk(peer)) getUnuqueId]];
  if (dialog != nil) {
    [self->dialogs_ addOrUpdateItemWithBSBserObject:[((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) [[AMDialogBuilder alloc] initWithAMDialog:dialog]) setMessageTypeWithAMContentTypeEnum:AMContentTypeEnum_get_EMPTY()])) setTextWithNSString:@""])) setTimeWithLong:0])) setUnreadCountWithInt:0])) setRidWithLong:0])) setSenderIdWithInt:0])) setStatusWithAMMessageStateEnum:AMMessageStateEnum_get_UNKNOWN()])) createDialog]];
  }
}

void ImActorModelModulesMessagesDialogsActor_onMessageStatusChangedWithAMPeer_withLong_withAMMessageStateEnum_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer, jlong rid, AMMessageStateEnum *state) {
  AMDialog *dialog = [((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) getValueWithLong:[((AMPeer *) nil_chk(peer)) getUnuqueId]];
  if (dialog != nil && [dialog getRid] == rid) {
    [self->dialogs_ addOrUpdateItemWithBSBserObject:[((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) [[AMDialogBuilder alloc] initWithAMDialog:dialog]) setStatusWithAMMessageStateEnum:state])) createDialog]];
  }
}

void ImActorModelModulesMessagesDialogsActor_onMessageSentWithAMPeer_withLong_withLong_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer, jlong rid, jlong date) {
  AMDialog *dialog = [((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) getValueWithLong:[((AMPeer *) nil_chk(peer)) getUnuqueId]];
  if (dialog != nil && [dialog getRid] == rid) {
    [self->dialogs_ addOrUpdateItemWithBSBserObject:[((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) [[AMDialogBuilder alloc] initWithAMDialog:dialog]) setStatusWithAMMessageStateEnum:AMMessageStateEnum_get_SENT()])) setTimeWithLong:date])) createDialog]];
  }
}

void ImActorModelModulesMessagesDialogsActor_onMessageContentChangedWithAMPeer_withLong_withAMAbsContent_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer, jlong rid, AMAbsContent *content) {
  AMDialog *dialog = [((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) getValueWithLong:[((AMPeer *) nil_chk(peer)) getUnuqueId]];
  if (dialog != nil && [dialog getRid] == rid) {
    AMContentDescription *description_ = AMContentDescription_fromContentWithAMAbsContent_(content);
    [self->dialogs_ addOrUpdateItemWithBSBserObject:[((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) [[AMDialogBuilder alloc] initWithAMDialog:dialog]) setTextWithNSString:[((AMContentDescription *) nil_chk(description_)) getText]])) setRelatedUidWithInt:[description_ getRelatedUser]])) setMessageTypeWithAMContentTypeEnum:[description_ getContentType]])) createDialog]];
  }
}

void ImActorModelModulesMessagesDialogsActor_onCounterChangedWithAMPeer_withInt_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer, jint count) {
  AMDialog *dialog = [((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) getValueWithLong:[((AMPeer *) nil_chk(peer)) getUnuqueId]];
  if (dialog != nil) {
    [self->dialogs_ addOrUpdateItemWithBSBserObject:[((AMDialogBuilder *) nil_chk([((AMDialogBuilder *) [[AMDialogBuilder alloc] initWithAMDialog:dialog]) setUnreadCountWithInt:count])) createDialog]];
  }
}

void ImActorModelModulesMessagesDialogsActor_onHistoryLoadedWithJavaUtilList_(ImActorModelModulesMessagesDialogsActor *self, id<JavaUtilList> history) {
  JavaUtilArrayList *updated = [[JavaUtilArrayList alloc] init];
  for (ImActorModelModulesMessagesEntityDialogHistory * __strong dialogHistory in nil_chk(history)) {
    if ([((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) getValueWithLong:[((AMPeer *) nil_chk([((ImActorModelModulesMessagesEntityDialogHistory *) nil_chk(dialogHistory)) getPeer])) getUnuqueId]] != nil) {
      continue;
    }
    ImActorModelModulesMessagesDialogsActor_PeerDesc *peerDesc = ImActorModelModulesMessagesDialogsActor_buildPeerDescWithAMPeer_(self, [dialogHistory getPeer]);
    if (peerDesc == nil) {
      continue;
    }
    AMContentDescription *description_ = AMContentDescription_fromContentWithAMAbsContent_([dialogHistory getContent]);
    [updated addWithId:[[AMDialog alloc] initWithAMPeer:[dialogHistory getPeer] withLong:[dialogHistory getSortDate] withNSString:[((ImActorModelModulesMessagesDialogsActor_PeerDesc *) nil_chk(peerDesc)) getTitle] withAMAvatar:[peerDesc getAvatar] withInt:[dialogHistory getUnreadCount] withLong:[dialogHistory getRid] withAMContentTypeEnum:[((AMContentDescription *) nil_chk(description_)) getContentType] withNSString:[description_ getText] withAMMessageStateEnum:[dialogHistory getStatus] withInt:[dialogHistory getSenderId] withLong:[dialogHistory getDate] withInt:[description_ getRelatedUser]]];
  }
  [((id<ImActorModelDroidkitEngineListEngine>) nil_chk(self->dialogs_)) addOrUpdateItemsWithJavaUtilList:updated];
}

ImActorModelModulesMessagesDialogsActor_PeerDesc *ImActorModelModulesMessagesDialogsActor_buildPeerDescWithAMPeer_(ImActorModelModulesMessagesDialogsActor *self, AMPeer *peer) {
  {
    AMUser *u;
    AMGroup *g;
    switch ([[((AMPeer *) nil_chk(peer)) getPeerType] ordinal]) {
      case AMPeerType_PRIVATE:
      u = [self getUserWithInt:[peer getPeerId]];
      return [[ImActorModelModulesMessagesDialogsActor_PeerDesc alloc] initWithImActorModelModulesMessagesDialogsActor:self withNSString:[((AMUser *) nil_chk(u)) getName] withAMAvatar:[u getAvatar]];
      case AMPeerType_GROUP:
      g = [self getGroupWithInt:[peer getPeerId]];
      return [[ImActorModelModulesMessagesDialogsActor_PeerDesc alloc] initWithImActorModelModulesMessagesDialogsActor:self withNSString:[((AMGroup *) nil_chk(g)) getTitle] withAMAvatar:[g getAvatar]];
      default:
      return nil;
    }
  }
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor)

@implementation ImActorModelModulesMessagesDialogsActor_PeerDesc

- (instancetype)initWithImActorModelModulesMessagesDialogsActor:(ImActorModelModulesMessagesDialogsActor *)outer$
                                                   withNSString:(NSString *)title
                                                   withAMAvatar:(AMAvatar *)avatar {
  if (self = [super init]) {
    self->title_ = title;
    self->avatar_ = avatar;
  }
  return self;
}

- (NSString *)getTitle {
  return title_;
}

- (AMAvatar *)getAvatar {
  return avatar_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_PeerDesc *)other {
  [super copyAllFieldsTo:other];
  other->title_ = title_;
  other->avatar_ = avatar_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_PeerDesc)

@implementation ImActorModelModulesMessagesDialogsActor_InMessage

- (instancetype)initWithAMPeer:(AMPeer *)peer
                 withAMMessage:(AMMessage *)message {
  if (self = [super init]) {
    self->peer_ = peer;
    self->message_ = message;
  }
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (AMMessage *)getMessage {
  return message_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_InMessage *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->message_ = message_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_InMessage)

@implementation ImActorModelModulesMessagesDialogsActor_UserChanged

- (instancetype)initWithAMUser:(AMUser *)user {
  if (self = [super init]) {
    self->user_ = user;
  }
  return self;
}

- (AMUser *)getUser {
  return user_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_UserChanged *)other {
  [super copyAllFieldsTo:other];
  other->user_ = user_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_UserChanged)

@implementation ImActorModelModulesMessagesDialogsActor_GroupChanged

- (instancetype)initWithAMGroup:(AMGroup *)group {
  if (self = [super init]) {
    self->group_ = group;
  }
  return self;
}

- (AMGroup *)getGroup {
  return group_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_GroupChanged *)other {
  [super copyAllFieldsTo:other];
  other->group_ = group_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_GroupChanged)

@implementation ImActorModelModulesMessagesDialogsActor_ChatClear

- (instancetype)initWithAMPeer:(AMPeer *)peer {
  if (self = [super init]) {
    self->peer_ = peer;
  }
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_ChatClear *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_ChatClear)

@implementation ImActorModelModulesMessagesDialogsActor_ChatDelete

- (instancetype)initWithAMPeer:(AMPeer *)peer {
  if (self = [super init]) {
    self->peer_ = peer;
  }
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_ChatDelete *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_ChatDelete)

@implementation ImActorModelModulesMessagesDialogsActor_MessageStateChanged

- (instancetype)initWithAMPeer:(AMPeer *)peer
                      withLong:(jlong)rid
        withAMMessageStateEnum:(AMMessageStateEnum *)state {
  if (self = [super init]) {
    self->peer_ = peer;
    self->rid_ = rid;
    self->state_ = state;
  }
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (jlong)getRid {
  return rid_;
}

- (AMMessageStateEnum *)getState {
  return state_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_MessageStateChanged *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->rid_ = rid_;
  other->state_ = state_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_MessageStateChanged)

@implementation ImActorModelModulesMessagesDialogsActor_MessageSent

- (instancetype)initWithAMPeer:(AMPeer *)peer
                      withLong:(jlong)rid
                      withLong:(jlong)date {
  if (self = [super init]) {
    self->peer_ = peer;
    self->rid_ = rid;
    self->date_ = date;
  }
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (jlong)getRid {
  return rid_;
}

- (jlong)getDate {
  return date_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_MessageSent *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->rid_ = rid_;
  other->date_ = date_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_MessageSent)

@implementation ImActorModelModulesMessagesDialogsActor_MessageContentChanged

- (instancetype)initWithAMPeer:(AMPeer *)peer
                      withLong:(jlong)rid
              withAMAbsContent:(AMAbsContent *)content {
  if (self = [super init]) {
    self->peer_ = peer;
    self->rid_ = rid;
    self->content_ = content;
  }
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (jlong)getRid {
  return rid_;
}

- (AMAbsContent *)getContent {
  return content_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_MessageContentChanged *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->rid_ = rid_;
  other->content_ = content_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_MessageContentChanged)

@implementation ImActorModelModulesMessagesDialogsActor_MessageDeleted

- (instancetype)initWithAMPeer:(AMPeer *)peer
                 withAMMessage:(AMMessage *)topMessage {
  if (self = [super init]) {
    self->peer_ = peer;
    self->topMessage_ = topMessage;
  }
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (AMMessage *)getTopMessage {
  return topMessage_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_MessageDeleted *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->topMessage_ = topMessage_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_MessageDeleted)

@implementation ImActorModelModulesMessagesDialogsActor_HistoryLoaded

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)history {
  if (self = [super init]) {
    self->history_ = history;
  }
  return self;
}

- (id<JavaUtilList>)getHistory {
  return history_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_HistoryLoaded *)other {
  [super copyAllFieldsTo:other];
  other->history_ = history_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_HistoryLoaded)

@implementation ImActorModelModulesMessagesDialogsActor_CounterChanged

- (instancetype)initWithAMPeer:(AMPeer *)peer
                       withInt:(jint)count {
  if (self = [super init]) {
    self->peer_ = peer;
    self->count_ = count;
  }
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (jint)getCount {
  return count_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesDialogsActor_CounterChanged *)other {
  [super copyAllFieldsTo:other];
  other->peer_ = peer_;
  other->count_ = count_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesDialogsActor_CounterChanged)