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
public class ExamPaperDTO extends AbstractPageRequest {

    private static final long serialVersionUID = 1L;


    private Long id;

    private String name;

    private String type;

    private String subject;

    private String grade;

    private String duration;

    private String remark;

}
