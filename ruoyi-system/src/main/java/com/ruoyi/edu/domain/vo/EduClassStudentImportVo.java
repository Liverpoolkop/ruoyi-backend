package com.ruoyi.edu.domain.vo;

import com.ruoyi.common.annotation.Excel;

public class EduClassStudentImportVo {
    @Excel(name = "学号")
    private String studentNo;

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }
}
