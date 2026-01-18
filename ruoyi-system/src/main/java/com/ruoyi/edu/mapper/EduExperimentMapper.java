package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.EduExperiment;

/**
 * 实验Mapper接口
 */
public interface EduExperimentMapper {

    /**
     * 查询实验列表
     */
    List<EduExperiment> selectList(EduExperiment experiment);

    /**
     * 根据ID查询实验
     */
    EduExperiment selectById(Long experimentId);

    /**
     * 新增实验
     */
    int insert(EduExperiment experiment);

    /**
     * 修改实验
     */
    int update(EduExperiment experiment);

    /**
     * 删除实验
     */
    int deleteById(Long experimentId);
}
