package com.zenith.zongheng.demo.api;

import com.zenith.zongheng.core.exception.ProcessException;
import com.zenith.zongheng.demo.domain.entity.ExamPaper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zenith.zongheng.demo.domain.dto.ExamPaperDTO;
import com.zenith.zongheng.demo.domain.dto.ExamPaperSaveDTO;
import com.zenith.zongheng.demo.domain.vo.ExamPaperVO;
import com.zenith.zongheng.common.domain.vo.PageVO;

import java.util.List;

/**
 * <p>
 * 试卷类型type:	1：期中、2：期末、3、模拟考	学科subject：	1：Jav 服务类
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
public interface ExamPaperService extends IService<ExamPaper> {

    PageVO<ExamPaperVO> queryPage(ExamPaperDTO dto);

    void saveExamPaper(ExamPaperSaveDTO dto);

    /**
     * 修改试卷
     *
     * @author tzx
     * @method updateExamPaper
     * @param dto
     * @return
     */
    void updateExamPaper(ExamPaperSaveDTO dto);

    void deleteExamPaper(Long ... id);

    /**
     * 下拉试卷列表
     *
     * @author tzx
     * @method getExamPaperSelectList
     * @return 	java.util.List<com.zenith.zongheng.demo.domain.entity.ExamPaper>
     */
    List<ExamPaper> getExamPaperSelectList() throws ProcessException, ProcessException;
}
