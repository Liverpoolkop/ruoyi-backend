package com.ruoyi.edu.mapper;

import com.ruoyi.edu.domain.EduHomeworkSubmit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EduHomeworkSubmitMapper {

    EduHomeworkSubmit selectByHomeworkAndUser(@Param("homeworkId") Long homeworkId,
                                              @Param("userId") Long userId);

    List<EduHomeworkSubmit> selectByCourseIdAndUserId(@Param("courseId") Long courseId,
                                                      @Param("userId") Long userId);

    int insertEduHomeworkSubmit(EduHomeworkSubmit submit);
    List<EduHomeworkSubmit> selectSubmitsByHomeworkId(@Param("homeworkId") Long homeworkId);

    int gradeSubmit(EduHomeworkSubmit submit);

    int updateEduHomeworkSubmit(EduHomeworkSubmit submit);
    int updateGrade(@Param("submitId") Long submitId,
                    @Param("score") Integer score,
                    @Param("teacherComment") String teacherComment,
                    @Param("graderId") Long graderId);
}

