package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.EduMessageMapper;
import com.ruoyi.system.domain.EduMessage;
import com.ruoyi.system.service.IEduMessageService;

/**
 * 站内消息Service业务层处理
 * 
 * @author ruoyi
 */
@Service
public class EduMessageServiceImpl implements IEduMessageService 
{
    @Autowired
    private EduMessageMapper eduMessageMapper;

    /**
     * 查询站内消息
     * 
     * @param id 站内消息主键
     * @return 站内消息
     */
    @Override
    public EduMessage selectEduMessageById(Long id)
    {
        return eduMessageMapper.selectEduMessageById(id);
    }

    /**
     * 查询站内消息列表
     * 
     * @param eduMessage 站内消息
     * @return 站内消息
     */
    @Override
    public List<EduMessage> selectEduMessageList(EduMessage eduMessage)
    {
        return eduMessageMapper.selectEduMessageList(eduMessage);
    }

    /**
     * 新增站内消息
     * 
     * @param eduMessage 站内消息
     * @return 结果
     */
    @Override
    public int insertEduMessage(EduMessage eduMessage)
    {
        eduMessage.setCreateTime(DateUtils.getNowDate());
        if (eduMessage.getReadStatus() == null) {
            eduMessage.setReadStatus("0"); // Default unread
        }
        return eduMessageMapper.insertEduMessage(eduMessage);
    }

    /**
     * 修改站内消息
     * 
     * @param eduMessage 站内消息
     * @return 结果
     */
    @Override
    public int updateEduMessage(EduMessage eduMessage)
    {
        return eduMessageMapper.updateEduMessage(eduMessage);
    }

    /**
     * 批量删除站内消息
     * 
     * @param ids 需要删除的站内消息主键
     * @return 结果
     */
    @Override
    public int deleteEduMessageByIds(Long[] ids)
    {
        return eduMessageMapper.deleteEduMessageByIds(ids);
    }

    /**
     * 删除站内消息信息
     * 
     * @param id 站内消息主键
     * @return 结果
     */
    @Override
    public int deleteEduMessageById(Long id)
    {
        return eduMessageMapper.deleteEduMessageById(id);
    }
    
    @Override
    public int selectUnreadCount(Long userId) {
        return eduMessageMapper.selectUnreadCount(userId);
    }
    
    @Override
    public int readMessage(Long id) {
        EduMessage msg = new EduMessage();
        msg.setId(id);
        msg.setReadStatus("1");
        return eduMessageMapper.updateEduMessage(msg);
    }
}
