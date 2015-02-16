//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/modules/updates/MessagesProcessor.java
//

#include "J2ObjC_source.h"
#include "im/actor/model/api/Dialog.h"
#include "im/actor/model/api/MessageContent.h"
#include "im/actor/model/api/MessageState.h"
#include "im/actor/model/api/Peer.h"
#include "im/actor/model/api/rpc/ResponseLoadDialogs.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/entity/Message.h"
#include "im/actor/model/entity/MessageState.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/entity/content/AbsContent.h"
#include "im/actor/model/entity/content/ServiceUserRegistered.h"
#include "im/actor/model/modules/BaseModule.h"
#include "im/actor/model/modules/Messages.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/entity/DialogHistory.h"
#include "im/actor/model/modules/entity/EntityConverter.h"
#include "im/actor/model/modules/messages/ConversationActor.h"
#include "im/actor/model/modules/messages/DialogsActor.h"
#include "im/actor/model/modules/messages/DialogsHistoryActor.h"
#include "im/actor/model/modules/updates/MessagesProcessor.h"
#include "im/actor/model/modules/utils/RandomUtils.h"
#include "java/lang/Math.h"
#include "java/lang/System.h"
#include "java/util/ArrayList.h"
#include "java/util/List.h"

__attribute__((unused)) static DKActorRef *ImActorModelModulesUpdatesMessagesProcessor_dialogsActor(ImActorModelModulesUpdatesMessagesProcessor *self);
__attribute__((unused)) static DKActorRef *ImActorModelModulesUpdatesMessagesProcessor_dialogsHistoryActor(ImActorModelModulesUpdatesMessagesProcessor *self);
__attribute__((unused)) static DKActorRef *ImActorModelModulesUpdatesMessagesProcessor_conversationActorWithAMPeer_(ImActorModelModulesUpdatesMessagesProcessor *self, AMPeer *peer);

@interface ImActorModelModulesUpdatesMessagesProcessor ()

- (DKActorRef *)dialogsActor;

- (DKActorRef *)dialogsHistoryActor;

- (DKActorRef *)conversationActorWithAMPeer:(AMPeer *)peer;

- (jlong)buildSortKey;
@end

@implementation ImActorModelModulesUpdatesMessagesProcessor

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)messenger {
  return [super initWithImActorModelModulesModules:messenger];
}

- (DKActorRef *)dialogsActor {
  return ImActorModelModulesUpdatesMessagesProcessor_dialogsActor(self);
}

- (DKActorRef *)dialogsHistoryActor {
  return ImActorModelModulesUpdatesMessagesProcessor_dialogsHistoryActor(self);
}

- (DKActorRef *)conversationActorWithAMPeer:(AMPeer *)peer {
  return ImActorModelModulesUpdatesMessagesProcessor_conversationActorWithAMPeer_(self, peer);
}

- (jlong)buildSortKey {
  return JavaLangSystem_currentTimeMillis();
}

- (void)onDialogsLoadedWithImActorModelApiRpcResponseLoadDialogs:(ImActorModelApiRpcResponseLoadDialogs *)dialogsResponse {
  JavaUtilArrayList *dialogs = [[JavaUtilArrayList alloc] init];
  jlong maxLoadedDate = 0;
  for (ImActorModelApiDialog * __strong dialog in nil_chk([((ImActorModelApiRpcResponseLoadDialogs *) nil_chk(dialogsResponse)) getDialogs])) {
    maxLoadedDate = JavaLangMath_maxWithLong_withLong_([((ImActorModelApiDialog *) nil_chk(dialog)) getSortDate], maxLoadedDate);
    AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_([dialog getPeer]);
    ImActorModelEntityContentAbsContent *msgContent = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiMessageContent_([dialog getMessage]);
    if (msgContent == nil) {
      continue;
    }
    [dialogs addWithId:[[ImActorModelModulesEntityDialogHistory alloc] initWithAMPeer:peer withInt:[dialog getUnreadCount] withLong:[dialog getSortDate] withLong:[dialog getRid] withLong:[dialog getDate] withInt:[dialog getSenderUid] withImActorModelEntityContentAbsContent:msgContent withAMMessageStateEnum:ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiMessageStateEnum_([dialog getState])]];
  }
  [((DKActorRef *) nil_chk(ImActorModelModulesUpdatesMessagesProcessor_dialogsActor(self))) sendWithId:[[ImActorModelModulesMessagesDialogsActor_HistoryLoaded alloc] initWithJavaUtilList:dialogs]];
  [((DKActorRef *) nil_chk(ImActorModelModulesUpdatesMessagesProcessor_dialogsHistoryActor(self))) sendWithId:[[ImActorModelModulesMessagesDialogsHistoryActor_LoadedMore alloc] initWithBoolean:maxLoadedDate == 0 withLong:maxLoadedDate]];
}

- (void)onMessageWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer
                                 withInt:(jint)senderUid
                                withLong:(jlong)date
                                withLong:(jlong)rid
       withImActorModelApiMessageContent:(ImActorModelApiMessageContent *)content {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
  ImActorModelEntityContentAbsContent *msgContent = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiMessageContent_(content);
  if (msgContent == nil) {
    return;
  }
  AMMessage *message = [[AMMessage alloc] initWithLong:rid withLong:date withLong:date withInt:senderUid withAMMessageStateEnum:[self myUid] == senderUid ? AMMessageStateEnum_get_SENT() : AMMessageStateEnum_get_UNKNOWN() withImActorModelEntityContentAbsContent:msgContent];
  [((DKActorRef *) nil_chk(ImActorModelModulesUpdatesMessagesProcessor_conversationActorWithAMPeer_(self, peer))) sendWithId:message];
}

- (void)onMessageReadWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer
                                    withLong:(jlong)startDate
                                    withLong:(jlong)readDate {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
  [((DKActorRef *) nil_chk(ImActorModelModulesUpdatesMessagesProcessor_conversationActorWithAMPeer_(self, peer))) sendWithId:[[ImActorModelModulesMessagesConversationActor_MessageRead alloc] initWithLong:startDate]];
}

- (void)onMessageEncryptedReadWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer
                                             withLong:(jlong)rid
                                             withLong:(jlong)readDate {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
}

- (void)onMessageReceivedWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer
                                        withLong:(jlong)startDate
                                        withLong:(jlong)receivedDate {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
  [((DKActorRef *) nil_chk(ImActorModelModulesUpdatesMessagesProcessor_conversationActorWithAMPeer_(self, peer))) sendWithId:[[ImActorModelModulesMessagesConversationActor_MessageReceived alloc] initWithLong:startDate]];
}

- (void)onMessageEncryptedReceivedWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer
                                                 withLong:(jlong)rid
                                                 withLong:(jlong)receivedDate {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
}

- (void)onMessageReadByMeWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer
                                        withLong:(jlong)startDate {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
}

- (void)onMessageEncryptedReadByMeWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer
                                                 withLong:(jlong)rid {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
}

- (void)onMessageDeleteWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer
                              withJavaUtilList:(id<JavaUtilList>)rids {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
  [((DKActorRef *) nil_chk(ImActorModelModulesUpdatesMessagesProcessor_conversationActorWithAMPeer_(self, peer))) sendWithId:[[ImActorModelModulesMessagesConversationActor_MessageDeleted alloc] initWithJavaUtilList:rids]];
}

- (void)onMessageSentWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer
                                    withLong:(jlong)rid
                                    withLong:(jlong)date {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
  [((DKActorRef *) nil_chk(ImActorModelModulesUpdatesMessagesProcessor_conversationActorWithAMPeer_(self, peer))) sendWithId:[[ImActorModelModulesMessagesConversationActor_MessageSent alloc] initWithLong:rid withLong:date]];
}

- (void)onChatClearWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
  [((DKActorRef *) nil_chk(ImActorModelModulesUpdatesMessagesProcessor_dialogsActor(self))) sendWithId:[[ImActorModelModulesMessagesDialogsActor_ChatClear alloc] initWithAMPeer:peer]];
}

- (void)onChatDeleteWithImActorModelApiPeer:(ImActorModelApiPeer *)_peer {
  AMPeer *peer = ImActorModelModulesEntityEntityConverter_convertWithImActorModelApiPeer_(_peer);
  [((DKActorRef *) nil_chk(ImActorModelModulesUpdatesMessagesProcessor_dialogsActor(self))) sendWithId:[[ImActorModelModulesMessagesDialogsActor_ChatDelete alloc] initWithAMPeer:peer]];
}

- (void)onUserRegisteredWithInt:(jint)uid
                       withLong:(jlong)date {
  AMMessage *message = [[AMMessage alloc] initWithLong:ImActorModelModulesUtilsRandomUtils_nextRid() withLong:date withLong:date withInt:uid withAMMessageStateEnum:AMMessageStateEnum_get_UNKNOWN() withImActorModelEntityContentAbsContent:[[ImActorModelEntityContentServiceUserRegistered alloc] init]];
  [((DKActorRef *) nil_chk(ImActorModelModulesUpdatesMessagesProcessor_conversationActorWithAMPeer_(self, AMPeer_userWithInt_(uid)))) sendWithId:message];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithImActorModelModulesModules:", "MessagesProcessor", NULL, 0x1, NULL },
    { "dialogsActor", NULL, "Lim.actor.model.droidkit.actors.ActorRef;", 0x2, NULL },
    { "dialogsHistoryActor", NULL, "Lim.actor.model.droidkit.actors.ActorRef;", 0x2, NULL },
    { "conversationActorWithAMPeer:", "conversationActor", "Lim.actor.model.droidkit.actors.ActorRef;", 0x2, NULL },
    { "buildSortKey", NULL, "J", 0x2, NULL },
    { "onDialogsLoadedWithImActorModelApiRpcResponseLoadDialogs:", "onDialogsLoaded", "V", 0x1, NULL },
    { "onMessageWithImActorModelApiPeer:withInt:withLong:withLong:withImActorModelApiMessageContent:", "onMessage", "V", 0x1, NULL },
    { "onMessageReadWithImActorModelApiPeer:withLong:withLong:", "onMessageRead", "V", 0x1, NULL },
    { "onMessageEncryptedReadWithImActorModelApiPeer:withLong:withLong:", "onMessageEncryptedRead", "V", 0x1, NULL },
    { "onMessageReceivedWithImActorModelApiPeer:withLong:withLong:", "onMessageReceived", "V", 0x1, NULL },
    { "onMessageEncryptedReceivedWithImActorModelApiPeer:withLong:withLong:", "onMessageEncryptedReceived", "V", 0x1, NULL },
    { "onMessageReadByMeWithImActorModelApiPeer:withLong:", "onMessageReadByMe", "V", 0x1, NULL },
    { "onMessageEncryptedReadByMeWithImActorModelApiPeer:withLong:", "onMessageEncryptedReadByMe", "V", 0x1, NULL },
    { "onMessageDeleteWithImActorModelApiPeer:withJavaUtilList:", "onMessageDelete", "V", 0x1, NULL },
    { "onMessageSentWithImActorModelApiPeer:withLong:withLong:", "onMessageSent", "V", 0x1, NULL },
    { "onChatClearWithImActorModelApiPeer:", "onChatClear", "V", 0x1, NULL },
    { "onChatDeleteWithImActorModelApiPeer:", "onChatDelete", "V", 0x1, NULL },
    { "onUserRegisteredWithInt:withLong:", "onUserRegistered", "V", 0x1, NULL },
  };
  static const J2ObjcClassInfo _ImActorModelModulesUpdatesMessagesProcessor = { 1, "MessagesProcessor", "im.actor.model.modules.updates", NULL, 0x1, 18, methods, 0, NULL, 0, NULL};
  return &_ImActorModelModulesUpdatesMessagesProcessor;
}

@end

DKActorRef *ImActorModelModulesUpdatesMessagesProcessor_dialogsActor(ImActorModelModulesUpdatesMessagesProcessor *self) {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getDialogsActor];
}

DKActorRef *ImActorModelModulesUpdatesMessagesProcessor_dialogsHistoryActor(ImActorModelModulesUpdatesMessagesProcessor *self) {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getDialogsHistoryActor];
}

DKActorRef *ImActorModelModulesUpdatesMessagesProcessor_conversationActorWithAMPeer_(ImActorModelModulesUpdatesMessagesProcessor *self, AMPeer *peer) {
  return [((ImActorModelModulesMessages *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getMessagesModule])) getConversationActorWithAMPeer:peer];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesUpdatesMessagesProcessor)
