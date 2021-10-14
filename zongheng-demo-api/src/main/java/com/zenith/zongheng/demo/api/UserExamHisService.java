package com.zenith.zongheng.demo.api;

import com.zenith.zongheng.demo.domain.entity.UserExamHis;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zenith.zongheng.demo.domain.dto.UserExamHisDTO;
import com.zenith.zongheng.demo.domain.dto.UserExamHisSaveDTO;
import com.zenith.zongheng.demo.domain.vo.UserExamHisVO;
import com.zenith.zongheng.common.domain.vo.PageVO;
/**
 * <p>
 *  服务类
 * </p>
 *
 * @author tangzx
 * @since 2021-10-06
 */
public interface UserExamHisService extends IService<UserExamHis> {

    /**
     * 分页查询
     *
     * @author tzx
     * @method queryPage
     * @param dto
     * @return 	com.zenith.zongheng.common.domain.vo.PageVO<com.zenith.zongheng.demo.domain.vo.UserExamHisVO>
     */
    PageVO<UserExamHisVO> queryPage(UserExamHisDTO dto);

    void saveUserExamHis(UserExamHisSaveDTO dto);

    void updateUserExamHis(UserExamHisSaveDTO dto);

    void deleteUserExamHis(Long ... id);
}
