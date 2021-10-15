package com.zenith.zongheng.demo.contants;

import com.zenith.zongheng.core.result.ResultConstant;

/**
 * @version: V2.0
 * @author: tzx
 * @className:
 * @packageName: com.zenith.zongheng.demo.contants
 * @description: 考试系统异常常量
 * @date: 2021/10/15
 **/

public enum ExamContantException implements ResultConstant {

    /**
     * 7000-8000
     */
    EXAM_NAME_ERROR(7001,"试卷名称错");

    private int code;
    private String message;

    ExamContantException(int code, String message) {
        this.code = code;
        this.message = message;
    }

    @Override
    public int getCode() {
        return code;
    }

    @Override
    public void setCode(int code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    @Override
    public void setMessage(String message) {
        this.message = message;
    }

}
