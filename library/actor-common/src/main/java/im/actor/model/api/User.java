package im.actor.model.api;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import im.actor.model.droidkit.bser.BserObject;
import im.actor.model.droidkit.bser.BserValues;
import im.actor.model.droidkit.bser.BserWriter;
import im.actor.model.droidkit.bser.util.SparseArray;

public class User extends BserObject {

    private int id;
    private long accessHash;
    private String name;
    private String localName;
    private Sex sex;
    private Avatar avatar;
    private List<ContactRecord> contactInfo;
    private Boolean isBot;

    public User(int id, long accessHash, String name, String localName, Sex sex, Avatar avatar, List<ContactRecord> contactInfo, Boolean isBot) {
        this.id = id;
        this.accessHash = accessHash;
        this.name = name;
        this.localName = localName;
        this.sex = sex;
        this.avatar = avatar;
        this.contactInfo = contactInfo;
        this.isBot = isBot;
    }

    public User() {

    }

    public int getId() {
        return this.id;
    }

    public long getAccessHash() {
        return this.accessHash;
    }

    public String getName() {
        return this.name;
    }

    public String getLocalName() {
        return this.localName;
    }

    public Sex getSex() {
        return this.sex;
    }

    public Avatar getAvatar() {
        return this.avatar;
    }

    public List<ContactRecord> getContactInfo() {
        return this.contactInfo;
    }

    public Boolean isBot() {
        return this.isBot;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.id = values.getInt(1);
        this.accessHash = values.getLong(2);
        this.name = values.getString(3);
        this.localName = values.optString(4);
        int val_sex = values.getInt(5, 0);
        if (val_sex != 0) {
            this.sex = Sex.parse(val_sex);
        }
        this.avatar = values.optObj(8, new Avatar());
        List<ContactRecord> _contactInfo = new ArrayList<ContactRecord>();
        for (int i = 0; i < values.getRepeatedCount(12); i ++) {
            _contactInfo.add(new ContactRecord());
        }
        this.contactInfo = values.getRepeatedObj(12, _contactInfo);
        this.isBot = values.optBool(11);
        if (values.hasRemaining()) {
            setUnmappedObjects(values.buildRemaining());
        }
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        writer.writeInt(1, this.id);
        writer.writeLong(2, this.accessHash);
        if (this.name == null) {
            throw new IOException();
        }
        writer.writeString(3, this.name);
        if (this.localName != null) {
            writer.writeString(4, this.localName);
        }
        if (this.sex != null) {
            writer.writeInt(5, this.sex.getValue());
        }
        if (this.avatar != null) {
            writer.writeObject(8, this.avatar);
        }
        writer.writeRepeatedObj(12, this.contactInfo);
        if (this.isBot != null) {
            writer.writeBool(11, this.isBot);
        }
        if (this.getUnmappedObjects() != null) {
            SparseArray<Object> unmapped = this.getUnmappedObjects();
            for (int i = 0; i < unmapped.size(); i++) {
                int key = unmapped.keyAt(i);
                writer.writeUnmapped(key, unmapped.get(key));
            }
        }
    }

    @Override
    public String toString() {
        String res = "struct User{";
        res += "id=" + this.id;
        res += ", name=" + this.name;
        res += ", localName=" + this.localName;
        res += ", sex=" + this.sex;
        res += ", avatar=" + (this.avatar != null ? "set":"empty");
        res += ", contactInfo=" + this.contactInfo.size();
        res += ", isBot=" + this.isBot;
        res += "}";
        return res;
    }

}