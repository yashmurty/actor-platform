package im.actor.model.api;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.model.droidkit.bser.BserObject;
import im.actor.model.droidkit.bser.BserValues;
import im.actor.model.droidkit.bser.BserWriter;
import java.io.IOException;

public class AvatarImage extends BserObject {

    private FileLocation fileLocation;
    private int width;
    private int height;
    private int fileSize;

    public AvatarImage(FileLocation fileLocation, int width, int height, int fileSize) {
        this.fileLocation = fileLocation;
        this.width = width;
        this.height = height;
        this.fileSize = fileSize;
    }

    public AvatarImage() {

    }

    public FileLocation getFileLocation() {
        return this.fileLocation;
    }

    public int getWidth() {
        return this.width;
    }

    public int getHeight() {
        return this.height;
    }

    public int getFileSize() {
        return this.fileSize;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.fileLocation = values.getObj(1, new FileLocation());
        this.width = values.getInt(2);
        this.height = values.getInt(3);
        this.fileSize = values.getInt(4);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        if (this.fileLocation == null) {
            throw new IOException();
        }
        writer.writeObject(1, this.fileLocation);
        writer.writeInt(2, this.width);
        writer.writeInt(3, this.height);
        writer.writeInt(4, this.fileSize);
    }

}