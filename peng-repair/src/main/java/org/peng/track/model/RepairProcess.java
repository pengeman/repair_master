package org.peng.track.model;

public class RepairProcess {
    private int id;
    private int mainId;
    private String mediaFile;
    private String mediaDesc;
    private String recordTime;
    private String fileType;

    public RepairProcess() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getMainId() { return mainId; }
    public void setMainId(int mainId) { this.mainId = mainId; }

    public String getMediaFile() { return mediaFile; }
    public void setMediaFile(String mediaFile) { this.mediaFile = mediaFile; }

    public String getMediaDesc() { return mediaDesc; }
    public void setMediaDesc(String mediaDesc) { this.mediaDesc = mediaDesc; }

    public String getRecordTime() { return recordTime; }
    public void setRecordTime(String recordTime) { this.recordTime = recordTime; }

    public String getFileType() { return fileType; }
    public void setFileType(String fileType) { this.fileType = fileType; }
}
