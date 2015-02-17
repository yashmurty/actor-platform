package im.actor.model.modules;

import im.actor.model.api.base.SeqUpdate;
import im.actor.model.api.rpc.RequestEditName;
import im.actor.model.api.rpc.RequestEditUserLocalName;
import im.actor.model.api.rpc.ResponseSeq;
import im.actor.model.api.updates.UpdateUserLocalNameChanged;
import im.actor.model.api.updates.UpdateUserNameChanged;
import im.actor.model.concurrency.Command;
import im.actor.model.concurrency.CommandCallback;
import im.actor.model.entity.User;
import im.actor.model.mvvm.KeyValueEngine;
import im.actor.model.network.RpcCallback;
import im.actor.model.network.RpcException;
import im.actor.model.network.RpcInternalException;

/**
 * Created by ex3ndr on 08.02.15.
 */
public class Users extends BaseModule {
    private KeyValueEngine<User> users;

    public Users(Modules messenger) {
        super(messenger);
        this.users = messenger.getConfiguration().getStorage().createUsersEngine();
    }

    public KeyValueEngine<User> getUsers() {
        return users;
    }

    public Command<Boolean> editMyName(final String newName) {
        return new Command<Boolean>() {
            @Override
            public void start(final CommandCallback<Boolean> callback) {
                request(new RequestEditName(newName), new RpcCallback<ResponseSeq>() {
                    @Override
                    public void onResult(ResponseSeq response) {
                        SeqUpdate update = new SeqUpdate(response.getSeq(), response.getState(),
                                UpdateUserNameChanged.HEADER, new UpdateUserNameChanged(myUid(),
                                newName).toByteArray());
                        updates().onUpdateReceived(update);
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                callback.onResult(true);
                            }
                        });
                    }

                    @Override
                    public void onError(final RpcException e) {
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                callback.onError(e);
                            }
                        });
                    }
                });
            }
        };
    }

    public Command<Boolean> editName(final int uid, final String name) {
        return new Command<Boolean>() {
            @Override
            public void start(final CommandCallback<Boolean> callback) {
                User user = getUsers().getValue(uid);
                if (user == null) {
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            callback.onError(new RpcInternalException());
                        }
                    });
                    return;
                }
                request(new RequestEditUserLocalName(
                        user.getUid(), user.getAccessHash(), name), new RpcCallback<ResponseSeq>() {
                    @Override
                    public void onResult(ResponseSeq response) {
                        SeqUpdate update = new SeqUpdate(response.getSeq(), response.getState(),
                                UpdateUserLocalNameChanged.HEADER, new UpdateUserLocalNameChanged(uid,
                                name).toByteArray());
                        updates().onUpdateReceived(update);
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                callback.onResult(true);
                            }
                        });
                    }

                    @Override
                    public void onError(RpcException e) {
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                callback.onError(new RpcInternalException());
                            }
                        });
                    }
                });
            }
        };
    }
}