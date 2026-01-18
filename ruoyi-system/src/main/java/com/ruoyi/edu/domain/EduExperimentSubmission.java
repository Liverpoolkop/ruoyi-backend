package com.ruoyi.edu.domain;

import java.util.Date;

/**
 * 实验提交记录对象 edu_experiment_submission
 */
public class EduExperimentSubmission {
    private static final long serialVersionUID = 1L;

    /** 提交ID */
    private Long submissionId;

    /** 实验ID */
    private Long experimentId;

    /** 学生ID */
    private Long studentId;

    /** 提交的代码 */
    private String code;

    /** 评测结果 */
    private String result;

    /** 输出结果 */
    private String stdout;

    /** 错误信息 */
    private String stderr;

    /** 编译输出 */
    private String compileOutput;

    /** 运行时间 */
    private String runTime;

    /** 内存使用 */
    private String memoryUsed;

    /** 提交时间 */
    private Date submitTime;

    public Long getSubmissionId() {
        return submissionId;
    }

    public void setSubmissionId(Long submissionId) {
        this.submissionId = submissionId;
    }

    public Long getExperimentId() {
        return experimentId;
    }

    public void setExperimentId(Long experimentId) {
        this.experimentId = experimentId;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getStdout() {
        return stdout;
    }

    public void setStdout(String stdout) {
        this.stdout = stdout;
    }

    public String getStderr() {
        return stderr;
    }

    public void setStderr(String stderr) {
        this.stderr = stderr;
    }

    public String getCompileOutput() {
        return compileOutput;
    }

    public void setCompileOutput(String compileOutput) {
        this.compileOutput = compileOutput;
    }

    public String getRunTime() {
        return runTime;
    }

    public void setRunTime(String runTime) {
        this.runTime = runTime;
    }

    public String getMemoryUsed() {
        return memoryUsed;
    }

    public void setMemoryUsed(String memoryUsed) {
        this.memoryUsed = memoryUsed;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }
}
