package com.zenith.zongheng.demo.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zenith.zongheng.demo.domain.entity.UserExam;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zenith.zongheng.demo.domain.dto.UserExamDTO;
import com.zenith.zongheng.demo.domain.vo.UserExamVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@Mapper
public interface UserExamMapper extends BaseMapper<UserExam> {

    /**
     *
     * @param page 分页对象
     * @param dto  条件参数对象
     * @return     分页对象
     */
    IPage<UserExamVO> selectPage(IPage<UserExamVO> page, @Param("dto") UserExamDTO dto);
}
