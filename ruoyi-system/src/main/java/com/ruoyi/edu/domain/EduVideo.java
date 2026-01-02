package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class EduVideo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Long videoId;
    private Long chapterId;
    private Long courseId;
    private String videoName;
    private String videoSourceId;
    private Integer sort;
    private Integer isFree;

    public Long getVideoId() { return videoId; }
    public void setVideoId(Long videoId) { this.videoId = videoId; }

    public Long getChapterId() { return chapterId; }
    public void setChapterId(Long chapterId) { this.chapterId = chapterId; }

    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }

    public String getVideoName() { return videoName; }
    public void setVideoName(String videoName) { this.videoName = videoName; }

    public String getVideoSourceId() { return videoSourceId; }
    public void setVideoSourceId(String videoSourceId) { this.videoSourceId = videoSourceId; }

    public Integer getSort() { return sort; }
    public void setSort(Integer sort) { this.sort = sort; }

    public Integer getIsFree() { return isFree; }
    public void setIsFree(Integer isFree) { this.isFree = isFree; }
}
