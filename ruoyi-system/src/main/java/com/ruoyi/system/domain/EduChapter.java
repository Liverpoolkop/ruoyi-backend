package com.ruoyi.system.domain;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 课程章节对象 edu_chapter
 */
public class EduChapter extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 章节ID */
    private Long chapterId;

    /** 课程ID */
    private Long courseId;

    /** 父章节ID */
    private Long parentId;

    /** 章节名称 */
    private String chapterName;

    /** 显示顺序 */
    private Integer sort;

    /** 子章节 */
    private List<EduChapter> children = new ArrayList<>();

    /** 章节视频 */
    private List<com.ruoyi.edu.domain.EduVideo> videos = new ArrayList<>();

    public void setChapterId(Long chapterId) 
    {
        this.chapterId = chapterId;
    }

    public Long getChapterId() 
    {
        return chapterId;
    }
    public void setCourseId(Long courseId) 
    {
        this.courseId = courseId;
    }

    public Long getCourseId() 
    {
        return courseId;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setChapterName(String chapterName) 
    {
        this.chapterName = chapterName;
    }

    public String getChapterName() 
    {
        return chapterName;
    }
    public void setSort(Integer sort) 
    {
        this.sort = sort;
    }

    public Integer getSort() 
    {
        return sort;
    }

    public List<EduChapter> getChildren()
    {
        return children;
    }

    public void setChildren(List<EduChapter> children)
    {
        this.children = children;
    }

    public List<com.ruoyi.edu.domain.EduVideo> getVideos() {
        return videos;
    }

    public void setVideos(List<com.ruoyi.edu.domain.EduVideo> videos) {
        this.videos = videos;
    }
}
