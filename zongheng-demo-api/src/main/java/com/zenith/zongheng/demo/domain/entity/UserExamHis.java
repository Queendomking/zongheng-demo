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
 * 考生试卷记录
 * </p>
 *
 * @author tangzx
 * @since 2021-10-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("es_user_exam_his")
@SuppressWarnings("serial")
@ApiModel(value="UserExamHis对象", description="考生试卷记录")
public class UserExamHis implements Serializable {

    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "考生试卷id")
    @TableId
    private Long id;

    @ApiModelProperty(value = "总分")
    private Integer totalPoint;

    @ApiModelProperty(value = "试卷名+姓名+考试序号(时间戳)")
    private String name;

    @ApiModelProperty(value = "试卷id")
    private Long examPaperId;

    @ApiModelProperty(value = "考生id")
    private Long userId;

    @ApiModelProperty(value = "试题id")
    private Long questionId;

    @ApiModelProperty(value = "学生答案")
    private String userOption;

    @ApiModelProperty(value = "是否正确")
    private String correctFlag;

    @ApiModelProperty(value = "真实得分")
    private Integer point;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "考试开始时间")
    private Date beginTime;

    @ApiModelProperty(value = "考试结束时间")
    private Date endTime;



    public static final String ID = "id";
    public static final String TOTAL_POINT = "total_point";
    public static final String NAME = "name";
    public static final String EXAM_PAPER_ID = "exam_paper_id";
    public static final String USER_ID = "user_id";
    public static final String QUESTION_ID = "question_id";
    public static final String USER_OPTION = "user_option";
    public static final String CORRECT_FLAG = "correct_flag";
    public static final String POINT = "point";
    public static final String CREATE_TIME = "create_time";
    public static final String BEGIN_TIME = "begin_time";
    public static final String END_TIME = "end_time";
}
