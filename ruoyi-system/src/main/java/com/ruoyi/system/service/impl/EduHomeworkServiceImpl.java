package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.EduHomeworkMapper;
import com.ruoyi.system.domain.EduHomework;
import com.ruoyi.system.service.IEduHomeworkService;
import com.ruoyi.edu.mapper.EduCourseStudentMapper;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.IEduMessageService;
import com.ruoyi.system.domain.EduMessage;

/**
 * Homework Service Implementation
 */
@Service
public class EduHomeworkServiceImpl implements IEduHomeworkService 
{
    @Autowired
    private EduHomeworkMapper eduHomeworkMapper;
    
    @Autowired
    private EduCourseStudentMapper eduCourseStudentMapper;
    
    @Autowired
    private IEduMessageService eduMessageService;

    private void notifyStudents(EduHomework homework) {
        if (homework.getCourseId() == null) return;
        List<SysUser> students = eduCourseStudentMapper.selectStudentsByCourseId(homework.getCourseId());
        for (SysUser student : students) {
            EduMessage msg = new EduMessage();
            msg.setReceiverId(student.getUserId());
            msg.setSenderId(0L); // System
            msg.setTitle("新作业通知: " + homework.getTitle());
            msg.setContent("课程发布了新作业，请及时查看。截止时间: " + homework.getDeadline());
            msg.setType("0"); // Notification
            msg.setReadStatus("0");
            eduMessageService.insertEduMessage(msg);
        }
    }

    /**
     * Query Homework
     * 
     * @param id Homework ID
     * @return Homework
     */
    @Override
    public EduHomework selectEduHomeworkById(Long id)
    {
        return eduHomeworkMapper.selectEduHomeworkById(id);
    }

    /**
     * Query Homework List
     * 
     * @param eduHomework Homework
     * @return Homework
     */
    @Override
    public List<EduHomework> selectEduHomeworkList(EduHomework eduHomework)
    {
        return eduHomeworkMapper.selectEduHomeworkList(eduHomework);
    }

    /**
     * Insert Homework
     * 
     * @param eduHomework Homework
     * @return Result
     */
    @Override
    public int insertEduHomework(EduHomework eduHomework)
    {
        eduHomework.setCreateTime(DateUtils.getNowDate());
        int rows = eduHomeworkMapper.insertEduHomework(eduHomework);
        if (rows > 0 && "1".equals(eduHomework.getStatus())) {
            notifyStudents(eduHomework);
        }
        return rows;
    }

    /**
     * Update Homework
     * 
     * @param eduHomework Homework
     * @return Result
     */
    @Override
    public int updateEduHomework(EduHomework eduHomework)
    {
        EduHomework old = eduHomeworkMapper.selectEduHomeworkById(eduHomework.getId());
        eduHomework.setUpdateTime(DateUtils.getNowDate());
        int rows = eduHomeworkMapper.updateEduHomework(eduHomework);
        if (rows > 0 && "1".equals(eduHomework.getStatus()) && (old != null && !"1".equals(old.getStatus()))) {
             notifyStudents(eduHomework);
        }
        return rows;
    }

    /**
     * Batch Delete Homework
     * 
     * @param ids IDs to delete
     * @return Result
     */
    @Override
    public int deleteEduHomeworkByIds(Long[] ids)
    {
        return eduHomeworkMapper.deleteEduHomeworkByIds(ids);
    }

    /**
     * Delete Homework
     * 
     * @param id Homework ID
     * @return Result
     */
    @Override
    public int deleteEduHomeworkById(Long id)
    {
        return eduHomeworkMapper.deleteEduHomeworkById(id);
    }
}
