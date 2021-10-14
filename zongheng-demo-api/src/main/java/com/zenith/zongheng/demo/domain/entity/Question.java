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
 * 题目类型	选择、对错、填空	题目标识：1：题干 2：选项	题目
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("es_question")
@SuppressWarnings("serial")
@ApiModel(value="Question对象", description="题目类型	选择、对错、填空	题目标识：1：题干 2：选项	题目")
public class Question implements Serializable {

    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "试题/选项id")
    @TableId
    private Long id;

    @ApiModelProperty(value = "试卷id")
    private Long examPaperId;

    private String titleFlag;

    @ApiModelProperty(value = "题目类型")
    private String type;

    @ApiModelProperty(value = "标题/选项内容")
    private String title;

    @ApiModelProperty(value = "父级试题")
    private Long parentId;

    @ApiModelProperty(value = "正确标识")
    private String correctFlag;

    @ApiModelProperty(value = "分值")
    private Integer point;

    @ApiModelProperty(value = "排序号")
    private Integer orderNo;

    @ApiModelProperty(value = "解析")
    private String resolution;



    public static final String ID = "id";
    public static final String EXAM_PAPER_ID = "exam_paper_id";
    public static final String TITLE_FLAG = "title_flag";
    public static final String TYPE = "type";
    public static final String TITLE = "title";
    public static final String PARENT_ID = "parent_id";
    public static final String CORRECT_FLAG = "correct_flag";
    public static final String POINT = "point";
    public static final String ORDER_NO = "order_no";
    public static final String RESOLUTION = "resolution";
}
