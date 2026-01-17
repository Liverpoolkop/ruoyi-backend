package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.EduMessage;

/**
 * 站内消息Service接口
 * 
 * @author ruoyi
 */
public interface IEduMessageService 
{
    /**
     * 查询站内消息
     * 
     * @param id 站内消息主键
     * @return 站内消息
     */
    public EduMessage selectEduMessageById(Long id);

    /**
     * 查询站内消息列表
     * 
     * @param eduMessage 站内消息
     * @return 站内消息集合
     */
    public List<EduMessage> selectEduMessageList(EduMessage eduMessage);

    /**
     * 新增站内消息
     * 
     * @param eduMessage 站内消息
     * @return 结果
     */
    public int insertEduMessage(EduMessage eduMessage);

    /**
     * 修改站内消息
     * 
     * @param eduMessage 站内消息
     * @return 结果
     */
    public int updateEduMessage(EduMessage eduMessage);

    /**
     * 批量删除站内消息
     * 
     * @param ids 需要删除的站内消息主键集合
     * @return 结果
     */
    public int deleteEduMessageByIds(Long[] ids);

    /**
     * 删除站内消息信息
     * 
     * @param id 站内消息主键
     * @return 结果
     */
    public int deleteEduMessageById(Long id);
    
    public int selectUnreadCount(Long userId);
    
    public int readMessage(Long id);
}
