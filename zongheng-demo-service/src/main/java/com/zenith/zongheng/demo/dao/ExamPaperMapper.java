package com.zenith.zongheng.demo.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zenith.zongheng.demo.domain.entity.ExamPaper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zenith.zongheng.demo.domain.dto.ExamPaperDTO;
import com.zenith.zongheng.demo.domain.vo.ExamPaperVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
/**
 * <p>
 * 试卷类型type:	1：期中、2：期末、3、模拟考	学科subject：	1：Jav Mapper 接口
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@Mapper
public interface ExamPaperMapper extends BaseMapper<ExamPaper> {

    /**
     *
     * @param page 分页对象
     * @param dto  条件参数对象
     * @return     分页对象
     */
    IPage<ExamPaperVO> selectPage(IPage<ExamPaperVO> page, @Param("dto") ExamPaperDTO dto);
}
