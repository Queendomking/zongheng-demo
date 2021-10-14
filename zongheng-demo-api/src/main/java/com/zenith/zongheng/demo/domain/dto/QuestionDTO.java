package com.zenith.zongheng.demo.domain.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;
import com.zenith.zongheng.common.result.AbstractPageRequest;

/**
 * <p>
 *
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@Data
public class QuestionDTO extends AbstractPageRequest {

    private static final long serialVersionUID = 1L;


    private Long id;

    private Long examPaperId;

    private String titleFlag;

    private String type;

    private String title;

    private Long parentId;

    private String correctFlag;

    private Integer point;

    private Integer orderNo;

    private String resolution;

}
