package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.EduHomework;

/**
 * Homework Mapper Interface
 */
public interface EduHomeworkMapper {
    /**
     * Query Homework
     * 
     * @param id Homework ID
     * @return Homework
     */
    public EduHomework selectEduHomeworkById(Long id);

    /**
     * Query Homework List
     * 
     * @param eduHomework Homework
     * @return Homework Collection
     */
    public List<EduHomework> selectEduHomeworkList(EduHomework eduHomework);

    /**
     * Insert Homework
     * 
     * @param eduHomework Homework
     * @return Result
     */
    public int insertEduHomework(EduHomework eduHomework);

    /**
     * Update Homework
     * 
     * @param eduHomework Homework
     * @return Result
     */
    public int updateEduHomework(EduHomework eduHomework);

    /**
     * Delete Homework
     * 
     * @param id Homework ID
     * @return Result
     */
    public int deleteEduHomeworkById(Long id);

    /**
     * Batch Delete Homework
     * 
     * @param ids IDs to delete
     * @return Result
     */
    public int deleteEduHomeworkByIds(Long[] ids);

    /**
     * Query homeworks by deadline range
     */
    public List<EduHomework> selectEduHomeworkListByDeadline(@org.apache.ibatis.annotations.Param("startTime") String startTime, @org.apache.ibatis.annotations.Param("endTime") String endTime);
}
