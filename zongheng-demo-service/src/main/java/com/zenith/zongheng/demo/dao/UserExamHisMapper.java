package com.zenith.zongheng.demo.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zenith.zongheng.demo.domain.entity.UserExamHis;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zenith.zongheng.demo.domain.dto.UserExamHisDTO;
import com.zenith.zongheng.demo.domain.vo.UserExamHisVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author tangzx
 * @since 2021-10-06
 */
@Mapper
public interface UserExamHisMapper extends BaseMapper<UserExamHis> {

    /**
     *
     * @param page 分页对象
     * @param dto  条件参数对象
     * @return     分页对象
     */
    IPage<UserExamHisVO> selectPage(IPage<UserExamHisVO> page, @Param("dto") UserExamHisDTO dto);
}
