package im.actor.model.api.rpc;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.model.droidkit.bser.Bser;
import im.actor.model.droidkit.bser.BserParser;
import im.actor.model.droidkit.bser.BserObject;
import im.actor.model.droidkit.bser.BserValues;
import im.actor.model.droidkit.bser.BserWriter;
import im.actor.model.droidkit.bser.DataInput;
import im.actor.model.droidkit.bser.DataOutput;
import im.actor.model.droidkit.bser.util.SparseArray;
import org.jetbrains.annotations.Nullable;
import org.jetbrains.annotations.NotNull;
import com.google.j2objc.annotations.ObjectiveCName;
import static im.actor.model.droidkit.bser.Utils.*;
import java.io.IOException;
import im.actor.model.network.parser.*;
import java.util.List;
import java.util.ArrayList;
import im.actor.model.api.*;

public class RequestSignUp extends Request<ResponseAuth> {

    public static final int HEADER = 0xbe;
    public static RequestSignUp fromBytes(byte[] data) throws IOException {
        return Bser.parse(new RequestSignUp(), data);
    }

    private String transactionHash;
    private String name;
    private Sex sex;

    public RequestSignUp(@NotNull String transactionHash, @NotNull String name, @Nullable Sex sex) {
        this.transactionHash = transactionHash;
        this.name = name;
        this.sex = sex;
    }

    public RequestSignUp() {

    }

    @NotNull
    public String getTransactionHash() {
        return this.transactionHash;
    }

    @NotNull
    public String getName() {
        return this.name;
    }

    @Nullable
    public Sex getSex() {
        return this.sex;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.transactionHash = values.getString(1);
        this.name = values.getString(2);
        int val_sex = values.getInt(3, 0);
        if (val_sex != 0) {
            this.sex = Sex.parse(val_sex);
        }
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        if (this.transactionHash == null) {
            throw new IOException();
        }
        writer.writeString(1, this.transactionHash);
        if (this.name == null) {
            throw new IOException();
        }
        writer.writeString(2, this.name);
        if (this.sex != null) {
            writer.writeInt(3, this.sex.getValue());
        }
    }

    @Override
    public String toString() {
        String res = "rpc SignUp{";
        res += "name=" + this.name;
        res += ", sex=" + this.sex;
        res += "}";
        return res;
    }

    @Override
    public int getHeaderKey() {
        return HEADER;
    }
}
