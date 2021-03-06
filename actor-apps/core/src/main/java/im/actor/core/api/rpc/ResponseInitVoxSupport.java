package im.actor.core.api.rpc;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.runtime.bser.*;
import im.actor.runtime.collections.*;
import static im.actor.runtime.bser.Utils.*;
import im.actor.core.network.parser.*;
import org.jetbrains.annotations.Nullable;
import org.jetbrains.annotations.NotNull;
import com.google.j2objc.annotations.ObjectiveCName;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import im.actor.core.api.*;

public class ResponseInitVoxSupport extends Response {

    public static final int HEADER = 0x81;
    public static ResponseInitVoxSupport fromBytes(byte[] data) throws IOException {
        return Bser.parse(new ResponseInitVoxSupport(), data);
    }

    private String userName;
    private String password;

    public ResponseInitVoxSupport(@NotNull String userName, @NotNull String password) {
        this.userName = userName;
        this.password = password;
    }

    public ResponseInitVoxSupport() {

    }

    @NotNull
    public String getUserName() {
        return this.userName;
    }

    @NotNull
    public String getPassword() {
        return this.password;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.userName = values.getString(1);
        this.password = values.getString(2);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        if (this.userName == null) {
            throw new IOException();
        }
        writer.writeString(1, this.userName);
        if (this.password == null) {
            throw new IOException();
        }
        writer.writeString(2, this.password);
    }

    @Override
    public String toString() {
        String res = "tuple InitVoxSupport{";
        res += "}";
        return res;
    }

    @Override
    public int getHeaderKey() {
        return HEADER;
    }
}
