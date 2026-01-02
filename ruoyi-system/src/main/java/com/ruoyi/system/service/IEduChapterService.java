package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.EduChapter;

/**
 * 课程章节Service接口
 */
public interface IEduChapterService 
{
    /**
     * 查询课程章节
     * 
     * @param chapterId 课程章节主键
     * @return 课程章节
     */
    public EduChapter selectEduChapterByChapterId(Long chapterId);

    /**
     * 查询课程章节列表
     * 
     * @param eduChapter 课程章节
     * @return 课程章节集合
     */
    public List<EduChapter> selectEduChapterList(EduChapter eduChapter);

    /**
     * 构建课程章节树
     * @param courseId 课程ID
     * @return 树结构列表
     */
    public List<EduChapter> buildChapterTree(Long courseId);

    /**
     * 新增课程章节
     * 
     * @param eduChapter 课程章节
     * @return 结果
     */
    public int insertEduChapter(EduChapter eduChapter);

    /**
     * 修改课程章节
     * 
     * @param eduChapter 课程章节
     * @return 结果
     */
    public int updateEduChapter(EduChapter eduChapter);

    /**
     * 批量删除课程章节
     * 
     * @param chapterIds 需要删除的课程章节主键集合
     * @return 结果
     */
    public int deleteEduChapterByChapterIds(Long[] chapterIds);

    /**
     * 删除课程章节信息
     * 
     * @param chapterId 课程章节主键
     * @return 结果
     */
    public int deleteEduChapterByChapterId(Long chapterId);
}
