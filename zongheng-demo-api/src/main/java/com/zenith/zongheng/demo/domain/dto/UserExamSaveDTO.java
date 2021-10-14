package com.zenith.zongheng.demo.domain.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import java.util.Date;
import java.io.Serializable;
import lombok.Data;

/**
 * <p>
 *
 * </p>
 *
 * @author tangzx
 * @since 2021-10-09
 */
@Data
public class UserExamSaveDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    private Long id;

    private Long userId;

    private Long questionId;

    private String userOption;

    private String correctFlag;

    private Integer point;

    private Date createTime;

    private Date beginTime;

    private Date endTime;

}
