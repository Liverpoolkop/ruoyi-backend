package com.ruoyi.system.domain;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.edu.domain.EduResource;

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

    /** 章节资源 */
    private List<EduResource> resources = new ArrayList<>();

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

    public List<EduResource> getResources() {
        return resources;
    }

    public void setResources(List<EduResource> resources) {
        this.resources = resources;
    }
}
