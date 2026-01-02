package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.EduChapterMapper;
import com.ruoyi.edu.mapper.EduVideoMapper;
import com.ruoyi.system.domain.EduChapter;
import com.ruoyi.edu.domain.EduVideo;
import com.ruoyi.system.service.IEduChapterService;

/**
 * 课程章节Service业务层处理
 */
@Service
public class EduChapterServiceImpl implements IEduChapterService 
{
    @Autowired
    private EduChapterMapper eduChapterMapper;

    @Autowired
    private EduVideoMapper eduVideoMapper;

    /**
     * 查询课程章节
     * 
     * @param chapterId 课程章节主键
     * @return 课程章节
     */
    @Override
    public EduChapter selectEduChapterByChapterId(Long chapterId)
    {
        return eduChapterMapper.selectEduChapterByChapterId(chapterId);
    }

    /**
     * 查询课程章节列表
     * 
     * @param eduChapter 课程章节
     * @return 课程章节
     */
    @Override
    public List<EduChapter> selectEduChapterList(EduChapter eduChapter)
    {
        return eduChapterMapper.selectEduChapterList(eduChapter);
    }

    @Override
    public List<EduChapter> buildChapterTree(Long courseId) {
        EduChapter query = new EduChapter();
        query.setCourseId(courseId);
        List<EduChapter> list = eduChapterMapper.selectEduChapterList(query);
        
        // Fetch all videos for the course
        List<EduVideo> videoList = eduVideoMapper.selectByCourseId(courseId);
        
        // Assign videos to chapters
        for (EduChapter chapter : list) {
            List<EduVideo> chapterVideos = new ArrayList<>();
            for (EduVideo video : videoList) {
                if (video.getChapterId().equals(chapter.getChapterId())) {
                    chapterVideos.add(video);
                }
            }
            chapter.setVideos(chapterVideos);
        }

        List<EduChapter> returnList = new ArrayList<>();
        List<Long> tempList = new ArrayList<>();
        
        // Find Roots (parentId = 0)
        for (EduChapter t : list) {
            if (t.getParentId() == 0) {
                returnList.add(t);
                tempList.add(t.getChapterId());
            }
        }
        
        // Find Children
        for (EduChapter root : returnList) {
            recursionFn(list, root);
        }
        
        return returnList;
    }

    /**
     * 递归列表
     */
    private void recursionFn(List<EduChapter> list, EduChapter t) {
        // 得到子节点列表
        List<EduChapter> childList = getChildList(list, t);
        t.setChildren(childList);
        for (EduChapter tChild : childList) {
            if (hasChild(list, tChild)) {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<EduChapter> getChildList(List<EduChapter> list, EduChapter t) {
        List<EduChapter> tlist = new ArrayList<>();
        for (EduChapter n : list) {
            if (n.getParentId() != null && n.getParentId().longValue() == t.getChapterId().longValue()) {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<EduChapter> list, EduChapter t) {
        return getChildList(list, t).size() > 0;
    }

    /**
     * 新增课程章节
     * 
     * @param eduChapter 课程章节
     * @return 结果
     */
    @Override
    public int insertEduChapter(EduChapter eduChapter)
    {
        eduChapter.setCreateTime(DateUtils.getNowDate());
        return eduChapterMapper.insertEduChapter(eduChapter);
    }

    /**
     * 修改课程章节
     * 
     * @param eduChapter 课程章节
     * @return 结果
     */
    @Override
    public int updateEduChapter(EduChapter eduChapter)
    {
        eduChapter.setUpdateTime(DateUtils.getNowDate());
        return eduChapterMapper.updateEduChapter(eduChapter);
    }

    /**
     * 批量删除课程章节
     * 
     * @param chapterIds 需要删除的课程章节主键
     * @return 结果
     */
    @Override
    public int deleteEduChapterByChapterIds(Long[] chapterIds)
    {
        return eduChapterMapper.deleteEduChapterByChapterIds(chapterIds);
    }

    /**
     * 删除课程章节信息
     * 
     * @param chapterId 课程章节主键
     * @return 结果
     */
    @Override
    public int deleteEduChapterByChapterId(Long chapterId)
    {
        return eduChapterMapper.deleteEduChapterByChapterId(chapterId);
    }
}
