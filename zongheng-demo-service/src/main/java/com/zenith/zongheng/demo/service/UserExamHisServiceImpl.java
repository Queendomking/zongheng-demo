package com.zenith.zongheng.demo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zenith.zongheng.demo.domain.entity.UserExamHis;
import com.zenith.zongheng.demo.dao.UserExamHisMapper;
import com.zenith.zongheng.demo.api.UserExamHisService;
import com.zenith.zongheng.demo.domain.dto.UserExamHisDTO;
import com.zenith.zongheng.demo.domain.dto.UserExamHisSaveDTO;
import com.zenith.zongheng.demo.domain.vo.UserExamHisVO;
import com.zenith.zongheng.demo.converter.UserExamHisConverter;
import com.zenith.zongheng.common.domain.vo.PageVO;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author tangzx
 * @since 2021-10-06
 */

@Service
@org.apache.dubbo.config.annotation.Service
public class UserExamHisServiceImpl extends ServiceImpl<UserExamHisMapper, UserExamHis> implements UserExamHisService {

    @Autowired
    private UserExamHisConverter userExamHisConverter;

    @Override
    public PageVO<UserExamHisVO> queryPage(UserExamHisDTO dto) {
        IPage<UserExamHisVO> page = baseMapper.selectPage(new Page<>(dto.getCurrPage(), dto.getPageSize()), dto);
        return new PageVO<>(page.getRecords(), (int) page.getTotal(), (int) page.getSize(), (int) page.getCurrent());
    }

    @Override
    @Transactional
    public void saveUserExamHis(UserExamHisSaveDTO dto) {
        UserExamHis entity = userExamHisConverter.dto2UserExamHis(dto);
        baseMapper.insert(entity);
    }


    @Override
    @Transactional
    public void updateUserExamHis(UserExamHisSaveDTO dto) {
        UserExamHis entity = userExamHisConverter.dto2UserExamHis(dto);
        baseMapper.updateById(entity);
    }

    @Override
    @Transactional
    public void deleteUserExamHis(Long... ids) {
        this.removeByIds(Arrays.asList(ids));
    }
}
