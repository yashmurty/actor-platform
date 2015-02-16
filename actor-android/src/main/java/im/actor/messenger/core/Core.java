package im.actor.messenger.core;

import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;

import im.actor.messenger.BuildConfig;
import im.actor.messenger.app.emoji.EmojiProcessor;
import im.actor.messenger.app.view.Formatter;

import com.droidkit.images.cache.BitmapClasificator;
import com.droidkit.images.loading.ImageLoader;

import im.actor.messenger.core.images.*;
import im.actor.messenger.model.TypingModel;
import im.actor.messenger.model.UserPresence;
import im.actor.messenger.storage.provider.AppEngineFactory;
import im.actor.model.ConfigurationBuilder;
import im.actor.model.Messenger;
import im.actor.model.MessengerCallback;
import im.actor.model.android.AndroidLog;
import im.actor.model.android.AndroidMainThread;
import im.actor.model.jvm.JavaNetworking;
import im.actor.model.jvm.JavaThreading;

import static com.droidkit.actors.ActorSystem.system;
import static im.actor.messenger.storage.KeyValueEngines.users;

/**
 * Created by ex3ndr on 30.08.14.
 */
public class Core {

    private static volatile Core core;

    public static void init(Application application) {
        core = new Core(application);
    }

    public static Core core() {
        if (core == null) {
            throw new RuntimeException("Core is not initialized");
        }

        return core;
    }

    public static EmojiProcessor emoji() {
        return core().emojiProcessor;
    }

    public static int myUid() {
        return core().messenger.myUid();
    }

    public static ImageLoader getImageLoader() {
        return core().imageLoader;
    }

    public static Messenger messenger() {
        return core().messenger;
    }

    private ImageLoader imageLoader;
    private EmojiProcessor emojiProcessor;
    private im.actor.model.Messenger messenger;

    private Core(Application application) {

        // Helpers
        AppContext.setContext(application);
        Formatter.init(application);

        // Init actor system
        system().setClassLoader(AppContext.getContext().getClassLoader());
        system().addDispatcher("db", 1);
        system().addDispatcher("contacts", 1);
        system().addDispatcher("file_encryption", 1);
        system().addDispatcher("rsa", 1);
        system().addDispatcher("updates", 1);
        system().addDispatcher("push", 1);

        // Emoji
        this.emojiProcessor = new EmojiProcessor(application);

        // Init Image Engine
        ActivityManager activityManager = (ActivityManager) AppContext.getContext().getSystemService(Context.ACTIVITY_SERVICE);
        int memoryInMB = Math.min(activityManager.getMemoryClass(), 32);
        long totalAppHeap = memoryInMB * 1024 * 1024;
        int cacheLimit = (int) totalAppHeap / 4;
        int freeCacheLimit = cacheLimit / 2;

        BitmapClasificator clasificator = new BitmapClasificator.Builder()
                .startExactSize(100, 100)
                .setFreeSize(2)
                .setLruSize(15)
                .endFilter()
                .startAny()
                .useSizeInBytes()
                .setLruSize(cacheLimit)
                .setFreeSize(freeCacheLimit)
                .endFilter()
                .build();
        this.imageLoader = new ImageLoader(clasificator, application);
        this.imageLoader.getTaskResolver().register(ImagePreviewTask.class, ImagePreviewActor.class);
        this.imageLoader.getTaskResolver().register(VideoPreviewTask.class, VideoPreviewActor.class);
        this.imageLoader.getTaskResolver().register(VideoTask.class, VideoActor.class);
        this.imageLoader.getTaskResolver().register(AvatarTask.class, AvatarActor.class);
        this.imageLoader.getTaskResolver().register(FullAvatarTask.class, FullAvatarActor.class);

        ConfigurationBuilder builder = new ConfigurationBuilder();

        builder.setThreading(new JavaThreading());
        builder.setNetworking(new JavaNetworking());

        builder.setMainThread(new AndroidMainThread());
        builder.setLog(new AndroidLog());

        builder.setCallback(new MessengerCallback() {
            @Override
            public void onUserOnline(int uid) {
                users().get(uid).getPresence().change(new UserPresence(UserPresence.State.ONLINE, 0));
            }

            @Override
            public void onUserOffline(int uid) {
                users().get(uid).getPresence().change(new UserPresence(UserPresence.State.OFFLINE, 0));
            }

            @Override
            public void onUserLastSeen(int uid, long lastSeen) {
                users().get(uid).getPresence().change(new UserPresence(UserPresence.State.OFFLINE, lastSeen));
            }

            @Override
            public void onGroupOnline(int gid, int count) {
                // TODO: Implement
            }

            @Override
            public void onTypingStart(int uid) {
                TypingModel.privateChatTyping(uid).change(true);
            }

            @Override
            public void onTypingEnd(int uid) {
                TypingModel.privateChatTyping(uid).change(false);
            }

            @Override
            public void onGroupTyping(int gid, int[] uids) {
                TypingModel.groupChatTyping(gid).change(uids);
            }
        });
        builder.setStorage(new AppEngineFactory());

        if (BuildConfig.API_SSL) {
            builder.addEndpoint("tls://" + BuildConfig.API_HOST + ":" + BuildConfig.API_PORT);
        } else {
            builder.addEndpoint("tcp://" + BuildConfig.API_HOST + ":" + BuildConfig.API_PORT);
        }

        this.messenger = new im.actor.model.Messenger(builder.build());
    }
}
