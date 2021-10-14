package com.zenith.zongheng.demo.api;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zenith.zongheng.common.domain.vo.PageVO;
import com.zenith.zongheng.demo.domain.dto.QuestionDTO;
import com.zenith.zongheng.demo.domain.dto.QuestionSaveDTO;
import com.zenith.zongheng.demo.domain.entity.Question;
import com.zenith.zongheng.demo.domain.vo.QuestionVO;

import java.util.List;

/**
 * <p>
 * 题目类型	选择、对错、填空	题目标识：1：题干 2：选项	题目 服务类
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
public interface QuestionService extends IService<Question> {

    PageVO<QuestionVO> queryPage(QuestionDTO dto);

    void saveQuestion(QuestionSaveDTO dto);

    void updateQuestion(QuestionSaveDTO dto);

    void deleteQuestion(Long ... id);

    /**
     * 通过题目获取试题的子选项
     *
     * @author tzx
     * @method selectChildQuestionByParentId
     * @param parentId
     * @return 	java.util.List<com.zenith.zongheng.demo.domain.entity.Question>
     */
    List<Question> selectChildQuestionByParentId(Long parentId);
}
