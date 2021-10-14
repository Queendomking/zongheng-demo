package com.zenith.zongheng.demo.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zenith.zongheng.core.util.StringUtil;
import com.zenith.zongheng.demo.domain.entity.Question;
import com.zenith.zongheng.demo.dao.QuestionMapper;
import com.zenith.zongheng.demo.api.QuestionService;
import com.zenith.zongheng.demo.domain.dto.QuestionDTO;
import com.zenith.zongheng.demo.domain.dto.QuestionSaveDTO;
import com.zenith.zongheng.demo.domain.vo.QuestionVO;
import com.zenith.zongheng.demo.converter.QuestionConverter;
import com.zenith.zongheng.common.domain.vo.PageVO;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zenith.zongheng.system.api.SysDictService;
import com.zenith.zongheng.system.domain.vo.SysDictVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

/**
 * <p>
 * 题目类型	选择、对错、填空	题目标识：1：题干 2：选项	题目 服务实现类
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */

@Service
@org.apache.dubbo.config.annotation.Service
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question> implements QuestionService {

    @Autowired
    private QuestionConverter questionConverter;

    @Autowired
    private SysDictService sysDictService;

    @Override
    public PageVO<QuestionVO> queryPage(QuestionDTO dto) {
        IPage<QuestionVO> page = baseMapper.selectPage(new Page<>(dto.getCurrPage(), dto.getPageSize()), dto);
        List<SysDictVO> questionTypeList = sysDictService.getByCode("QuestionType");
        page.getRecords().forEach(question->{
            question.setTitleFlagDel("1".equals(question.getTitleFlag())?"题干":"选项");
            if(StringUtil.isNotEmpty(question.getType())){
                String questionTypeName = questionTypeList.stream().filter(dict -> dict.getDictKey().equals(question.getType())).collect(Collectors.toList()).get(0).getDictValue();
                question.setTypeName(questionTypeName);
                question.setChildren(selectChildQuestionByParentId(question.getId()));
            }
        });
        return new PageVO<>(page.getRecords(), (int) page.getTotal(), (int) page.getSize(), (int) page.getCurrent());
    }

    @Override
    @Transactional
    public void saveQuestion(QuestionSaveDTO dto) {
        Question entity = questionConverter.dto2Question(dto);
        baseMapper.insert(entity);
    }


    @Override
    @Transactional
    public void updateQuestion(QuestionSaveDTO dto) {
        Question entity = questionConverter.dto2Question(dto);
        baseMapper.updateById(entity);
    }

    @Override
    @Transactional
    public void deleteQuestion(Long... ids) {
        this.removeByIds(Arrays.asList(ids));
    }

    @Override
    public List<Question> selectChildQuestionByParentId(Long parentId) {
        return this.list(new QueryWrapper<Question>().eq(Question.PARENT_ID,parentId));
    }
}
