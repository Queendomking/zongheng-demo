package com.zenith.zongheng.demo.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zenith.zongheng.demo.domain.entity.Question;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zenith.zongheng.demo.domain.dto.QuestionDTO;
import com.zenith.zongheng.demo.domain.vo.QuestionVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
/**
 * <p>
 * 题目类型	选择、对错、填空	题目标识：1：题干 2：选项	题目 Mapper 接口
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@Mapper
public interface QuestionMapper extends BaseMapper<Question> {

    /**
     *
     * @param page 分页对象
     * @param dto  条件参数对象
     * @return     分页对象
     */
    IPage<QuestionVO> selectPage(IPage<QuestionVO> page, @Param("dto") QuestionDTO dto);
}
