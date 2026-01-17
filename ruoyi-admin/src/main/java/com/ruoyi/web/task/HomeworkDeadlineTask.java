package com.ruoyi.web.task;

import org.springframework.stereotype.Component;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.system.mapper.EduHomeworkMapper;
import com.ruoyi.edu.mapper.EduCourseStudentMapper;
import com.ruoyi.system.mapper.EduHomeworkSubmissionMapper;
import com.ruoyi.system.service.IEduMessageService;
import com.ruoyi.system.domain.EduHomework;
import com.ruoyi.system.domain.EduHomeworkSubmission;
import com.ruoyi.system.domain.EduMessage;
import com.ruoyi.common.core.domain.entity.SysUser;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Component
public class HomeworkDeadlineTask {
    @Autowired
    private EduHomeworkMapper homeworkMapper;
    @Autowired
    private EduCourseStudentMapper courseStudentMapper;
    @Autowired
    private EduHomeworkSubmissionMapper submissionMapper;
    @Autowired
    private IEduMessageService messageService;

    // Run every hour
    @Scheduled(cron = "0 0 * * * ?")
    public void checkDeadlines() {
        // Calculate time range (now to now + 24h)
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        String startTime = sdf.format(cal.getTime());
        cal.add(Calendar.HOUR, 24);
        String endTime = sdf.format(cal.getTime());

        List<EduHomework> list = homeworkMapper.selectEduHomeworkListByDeadline(startTime, endTime);
        for (EduHomework hw : list) {
            if (hw.getCourseId() == null) continue;

            // Get enrolled students
            List<SysUser> students = courseStudentMapper.selectStudentsByCourseId(hw.getCourseId());
            // Get submissions
            EduHomeworkSubmission query = new EduHomeworkSubmission();
            query.setHomeworkId(hw.getId());
            List<EduHomeworkSubmission> submissions = submissionMapper.selectEduHomeworkSubmissionList(query);
            
            for (SysUser student : students) {
                boolean submitted = submissions.stream().anyMatch(s -> student.getUserId().equals(s.getStudentId()));
                if (!submitted) {
                    sendMessage(student.getUserId(), hw);
                }
            }
        }
    }

    private void sendMessage(Long userId, EduHomework hw) {
        EduMessage msg = new EduMessage();
        msg.setReceiverId(userId);
        msg.setSenderId(0L);
        msg.setTitle("作业即将截止提醒: " + hw.getTitle());
        msg.setContent("您有一项作业即将截止，请尽快提交。截止时间: " + hw.getDeadline());
        msg.setType("0");
        msg.setReadStatus("0");
        messageService.insertEduMessage(msg);
    }
}
