package com.zenith.zongheng.demo.domain.vo;

import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;
import java.util.List;

import com.zenith.zongheng.demo.domain.entity.ExamPaper;
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
public class UserExamVO implements Serializable {

    private static final long serialVersionUID = 1L;


    private Long id;

    private Long userId;

    private Long questionId;

    private String userOption;

    private String correctFlag;

    private Integer point;

    private Date createTime;

    private QuestionVO question;

    private ExamPaper examPaper;

    private Date beginTime;

    private Date endTime;

}
