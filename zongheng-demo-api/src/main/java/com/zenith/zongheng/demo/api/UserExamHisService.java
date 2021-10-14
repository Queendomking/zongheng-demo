package com.zenith.zongheng.demo.api;

import com.zenith.zongheng.demo.domain.dto.ExamPaperDTO;
import com.zenith.zongheng.demo.domain.entity.ExamPaper;
import com.zenith.zongheng.demo.domain.entity.UserExamHis;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zenith.zongheng.demo.domain.dto.UserExamHisDTO;
import com.zenith.zongheng.demo.domain.dto.UserExamHisSaveDTO;
import com.zenith.zongheng.demo.domain.vo.UserExamHisVO;
import com.zenith.zongheng.common.domain.vo.PageVO;

import java.util.Map;

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

    /**
     * 根据试卷得到所有考生在线考试情况统计
     *
     * @author tzx
     * @method statUserExam
     * @param examPaperDTO 试卷
     * @return 	java.util.Map<java.lang.String,java.lang.Object>
     */
    Map<String,Object> statUserExam(ExamPaperDTO examPaperDTO);
 }
