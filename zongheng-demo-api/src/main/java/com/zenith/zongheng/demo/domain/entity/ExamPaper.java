package com.zenith.zongheng.demo.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 试卷类型type:	1：期中、2：期末、3、模拟考	学科subject：	1：Jav
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("es_exam_paper")
@SuppressWarnings("serial")
@ApiModel(value="ExamPaper对象", description="试卷类型type:	1：期中、2：期末、3、模拟考	学科subject：	1：Jav")
public class ExamPaper implements Serializable {

    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "主键")
    @TableId
    private Long id;

    @ApiModelProperty(value = "试卷名称")
    private String name;

    @ApiModelProperty(value = "类型")
    private String type;

    @ApiModelProperty(value = "学科")
    private String subject;

    @ApiModelProperty(value = "年级")
    private String grade;

    @ApiModelProperty(value = "考试时长(分)")
    private String duration;

    @ApiModelProperty(value = "备注")
    private String remark;



    public static final String ID = "id";
    public static final String NAME = "name";
    public static final String TYPE = "type";
    public static final String SUBJECT = "subject";
    public static final String GRADE = "grade";
    public static final String DURATION = "duration";
    public static final String REMARK = "remark";
}
