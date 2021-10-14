package com.zenith.zongheng.demo.api;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zenith.zongheng.common.domain.vo.PageVO;
import com.zenith.zongheng.demo.domain.dto.UserExamDTO;
import com.zenith.zongheng.demo.domain.dto.UserExamSaveDTO;
import com.zenith.zongheng.demo.domain.entity.UserExam;
import com.zenith.zongheng.demo.domain.vo.UserExamVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
public interface UserExamService extends IService<UserExam> {

    /**
     * 分页查询
     *
     * @Author tzx
     * @Method queryPage
     * @param dto
     * @return 	com.zenith.zongheng.common.domain.vo.PageVO<com.zenith.zongheng.demo.domain.vo.UserExamVO>
     */
    PageVO<UserExamVO> queryPage(UserExamDTO dto);

    /**
     * 保存用户试卷
     *
     * @Author tzx
     * @Method queryPage
     * @param dto
     * @return 	com.zenith.zongheng.common.domain.vo.PageVO<com.zenith.zongheng.demo.domain.vo.UserExamVO>
     */
    void saveUserExam(UserExamSaveDTO dto);

    /**
     * 修改用户试卷
     *
     * @Author tzx
     * @Method updateUserExam
     * @param dto
     * @return
     */
    void updateUserExam(UserExamSaveDTO dto);

    /**
     * 删除用户试卷
     *
     * @Author tzx
     * @Method deleteUserExam
     * @param id
     * @return
     */
    void deleteUserExam(Long ... id);

    /**
     * 渲染用户试卷 默认10道题 随机抽取10道 生成试卷
     *
     * @Author tzx
     * @Method getUserExamPaper
     * @return 	java.util.Map<java.lang.String,java.lang.Object>
     */
    Map<String,Object> getUserExamPaper();

    /**
     * 提交考试作业 返回考试得分
     *
     * @Author tzx
     * @Method submitUserExamPaper
     * @param userExamList
     * @return 	java.util.Map<java.lang.String,java.lang.Object>
     */
    Map<String,Object> submitUserExamPaper(List<UserExamVO> userExamList);

    /**
     * 查看试卷对错情况，得分情况
     *
     * @Author tzx
     * @Method getUserExamResult
     * @return 	java.util.List<com.zenith.zongheng.demo.domain.vo.UserExamVO>
     */
    List<UserExamVO> getUserExamResult();

}
