package com.zenith.zongheng.demo.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author tangzx
 * @since 2021-10-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("es_user_exam")
@SuppressWarnings("serial")
@ApiModel(value="UserExam对象", description="")
public class UserExam implements Serializable {

    private static final long serialVersionUID = 1L;


    @TableId
    private Long id;

    private Long userId;

    private Long questionId;

    private String userOption;

    private String correctFlag;

    private Integer point;

    private Date createTime;

    @ApiModelProperty(value = "考试开始时间")
    private Date beginTime;

    @ApiModelProperty(value = "考试结束时间")
    private Date endTime;



    public static final String ID = "id";
    public static final String USER_ID = "user_id";
    public static final String QUESTION_ID = "question_id";
    public static final String USER_OPTION = "user_option";
    public static final String CORRECT_FLAG = "correct_flag";
    public static final String POINT = "point";
    public static final String CREATE_TIME = "create_time";
    public static final String BEGIN_TIME = "begin_time";
    public static final String END_TIME = "end_time";
}
