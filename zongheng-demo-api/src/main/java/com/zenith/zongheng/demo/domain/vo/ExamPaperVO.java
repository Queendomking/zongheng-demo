package com.zenith.zongheng.demo.domain.vo;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.List;

import com.zenith.zongheng.demo.domain.entity.Question;
import lombok.Data;

/**
 * <p>
 *
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@Data
public class ExamPaperVO implements Serializable {

    private static final long serialVersionUID = 1L;


    private Long id;

    private String name;

    private String type;

    private String subject;

    private String grade;

    private String duration;

    private String remark;



}
