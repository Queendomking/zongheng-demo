package com.zenith.zongheng.demo.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zenith.zongheng.core.util.StringUtil;
import com.zenith.zongheng.demo.domain.entity.ExamPaper;
import com.zenith.zongheng.demo.dao.ExamPaperMapper;
import com.zenith.zongheng.demo.api.ExamPaperService;
import com.zenith.zongheng.demo.domain.dto.ExamPaperDTO;
import com.zenith.zongheng.demo.domain.dto.ExamPaperSaveDTO;
import com.zenith.zongheng.demo.domain.vo.ExamPaperVO;
import com.zenith.zongheng.demo.converter.ExamPaperConverter;
import com.zenith.zongheng.common.domain.vo.PageVO;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zenith.zongheng.system.api.SysDictService;
import com.zenith.zongheng.system.domain.vo.SysDictVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 试卷类型type:	1：期中、2：期末、3、模拟考	学科subject：	1：Jav 服务实现类
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */

@Service
@org.apache.dubbo.config.annotation.Service
public class ExamPaperServiceImpl extends ServiceImpl<ExamPaperMapper, ExamPaper> implements ExamPaperService {

    @Autowired
    private ExamPaperConverter examPaperConverter;

    @Autowired
    private SysDictService sysDictService;

    @Override
    public PageVO<ExamPaperVO> queryPage(ExamPaperDTO dto) {
        IPage<ExamPaperVO> page = baseMapper.selectPage(new Page<>(dto.getCurrPage(), dto.getPageSize()), dto);
        return new PageVO<>(page.getRecords(), (int) page.getTotal(), (int) page.getSize(), (int) page.getCurrent());
    }

    @Override
    @Transactional
    public void saveExamPaper(ExamPaperSaveDTO dto) {
        ExamPaper entity = examPaperConverter.dto2ExamPaper(dto);
        // 生成试卷名称
        String examPaperName = createExamPaperName(dto);
        entity.setName(examPaperName);
        baseMapper.insert(entity);
    }

    private String createExamPaperName(ExamPaperSaveDTO dto) {
        List<SysDictVO> examGradeList = sysDictService.getByCode("ExamGrade");
        List<SysDictVO> examTypeList = sysDictService.getByCode("ExamType");
        List<SysDictVO> examSubjectList = sysDictService.getByCode("ExamSubject");

        String gradeName = examGradeList.stream().filter(dict -> dict.getDictKey().equals(dto.getGrade())).collect(Collectors.toList()).get(0).getDictValue();
        String typeName = examTypeList.stream().filter(dict -> dict.getDictKey().equals(dto.getType())).collect(Collectors.toList()).get(0).getDictValue();
        String subjectName = examSubjectList.stream().filter(dict -> dict.getDictKey().equals(dto.getSubject())).collect(Collectors.toList()).get(0).getDictValue();
        // 年级 + 科目 + 试卷类型
        return gradeName+ "《" + subjectName + "》" + typeName ;
    }


    @Override
    @Transactional
    public void updateExamPaper(ExamPaperSaveDTO dto) {
        ExamPaper entity = examPaperConverter.dto2ExamPaper(dto);
        // 生成试卷名称
        String examPaperName = createExamPaperName(dto);
        entity.setName(examPaperName);

        baseMapper.updateById(entity);
    }

    @Override
    @Transactional
    public void deleteExamPaper(Long... ids) {
        this.removeByIds(Arrays.asList(ids));
    }

    @Override
    public List<ExamPaper> getExamPaperSelectList() {
        return baseMapper.selectList(new QueryWrapper<ExamPaper>().orderByDesc(ExamPaper.ID));
    }
}
