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
public class QuestionVO implements Serializable {

    private static final long serialVersionUID = 1L;


    private Long id;

    private Long examPaperId;

    private String examPaperName;

    private String titleFlag;

    private String titleFlagDel;

    private String type;

    private String typeName;

    private String title;

    private Long parentId;

    private String correctFlag;

    private Integer point;

    private Integer orderNo;

    private String resolution;

    private List<Question> children;

}
