package com.zenith.zongheng.demo.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zenith.zongheng.auth.domain.RequestHolder;
import com.zenith.zongheng.auth.domain.UserSimpleInfo;
import com.zenith.zongheng.core.util.DateUtil;
import com.zenith.zongheng.core.util.StringUtil;
import com.zenith.zongheng.demo.api.ExamPaperService;
import com.zenith.zongheng.demo.api.QuestionService;
import com.zenith.zongheng.demo.api.UserExamHisService;
import com.zenith.zongheng.demo.converter.ExamPaperConverter;
import com.zenith.zongheng.demo.converter.QuestionConverter;
import com.zenith.zongheng.demo.converter.UserExamHisConverter;
import com.zenith.zongheng.demo.domain.entity.ExamPaper;
import com.zenith.zongheng.demo.domain.entity.Question;
import com.zenith.zongheng.demo.domain.entity.UserExam;
import com.zenith.zongheng.demo.dao.UserExamMapper;
import com.zenith.zongheng.demo.api.UserExamService;
import com.zenith.zongheng.demo.domain.dto.UserExamDTO;
import com.zenith.zongheng.demo.domain.dto.UserExamSaveDTO;
import com.zenith.zongheng.demo.domain.entity.UserExamHis;
import com.zenith.zongheng.demo.domain.vo.QuestionVO;
import com.zenith.zongheng.demo.domain.vo.UserExamVO;
import com.zenith.zongheng.demo.converter.UserExamConverter;
import com.zenith.zongheng.common.domain.vo.PageVO;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */

@Service
@org.apache.dubbo.config.annotation.Service
public class UserExamServiceImpl extends ServiceImpl<UserExamMapper, UserExam> implements UserExamService {

    @Autowired
    private UserExamConverter userExamConverter;

    @Autowired
    private ExamPaperService examPaperService;

    @Autowired
    private ExamPaperConverter examPaperConverter;

    @Autowired
    private QuestionService questionService;


    @Autowired
    private QuestionConverter questionConverter;

    @Autowired
    private UserExamHisService userExamHisService;

    @Autowired
    private UserExamHisConverter userExamHisConverter;

    @Override
    public PageVO<UserExamVO> queryPage(UserExamDTO dto) {
        IPage<UserExamVO> page = baseMapper.selectPage(new Page<>(dto.getCurrPage(), dto.getPageSize()), dto);
        return new PageVO<>(page.getRecords(), (int) page.getTotal(), (int) page.getSize(), (int) page.getCurrent());
    }

    @Override
    @Transactional
    public void saveUserExam(UserExamSaveDTO dto) {
        UserExam entity = userExamConverter.dto2UserExam(dto);
        baseMapper.insert(entity);
    }


    @Override
    @Transactional
    public void updateUserExam(UserExamSaveDTO dto) {
        UserExam entity = userExamConverter.dto2UserExam(dto);
        baseMapper.updateById(entity);
    }

    @Override
    @Transactional
    public void deleteUserExam(Long... ids) {
        this.removeByIds(Arrays.asList(ids));
    }

    /**
     * @Author tzx
     * @Description 渲染试卷 默认10道题 随机抽取10道 生成试卷
     * @Method getUserExamPaper
     * @return: java.util.Map
     **/
    @Override
    public Map<String,Object> getUserExamPaper() {
        Map<String,Object> data = new HashMap<>();
        UserSimpleInfo user = RequestHolder.getUser();
        // 生成试卷标题
        String userExamTitle = "考生：" + user.getUserName() + "，";
        // 选择考试科目
        int paperNum = (int) Math.round(Math.random()*2);
        List<ExamPaper> examPaperList = examPaperService.list(new QueryWrapper<ExamPaper>().orderByDesc(ExamPaper.ID));
        ExamPaper examPaper = examPaperList.get(paperNum);
        userExamTitle += examPaper.getName();
        // 查询当前用户是否存在考试

        //
        List<UserExam> userExamHisList = this.list(new QueryWrapper<UserExam>().eq(UserExam.USER_ID, user.getId()));
        int totalPoint = userExamHisList.stream().mapToInt(userExam->userExam.getPoint()!=null?userExam.getPoint():0).sum();
        String curTime = DateUtil.getStringDate();
        // 有则存历史
        if(userExamHisList!=null && userExamHisList.size()>0){
            ExamPaper oldExamPaper = examPaperService.getById(questionService.getById(userExamHisList.get(0).getQuestionId()).getExamPaperId());
            for (UserExam userExam: userExamHisList) {
                UserExamHis userExamHis = userExamHisConverter.userExamToHis(userExam);
                userExamHis.setId(null);
                userExamHis.setName(user.getUserName() + "-" + oldExamPaper.getName() + "-" + curTime);
                userExamHis.setTotalPoint(totalPoint);
                userExamHis.setExamPaperId(examPaper.getId());
                userExamHisService.save(userExamHis);
                baseMapper.deleteById(userExam.getId());
            }
        }

        // 生成试卷内容
        // 组装试题 题干+选项
        List<Question> questionList = questionService.list(new QueryWrapper<Question>().eq(Question.EXAM_PAPER_ID,examPaper.getId()).eq(Question.TITLE_FLAG,"1"));
        List<QuestionVO> questionVOList = new ArrayList<>();
        for(Question titleQuestion:questionList){
            QuestionVO questionVO = questionConverter.entityToVO(titleQuestion);
            questionVO.setChildren(questionService.selectChildQuestionByParentId(titleQuestion.getId()));
            questionVOList.add(questionVO);
        }
        List<UserExamVO> userExamList = new ArrayList<>(questionList.size());
        for (QuestionVO question: questionVOList) {
            UserExamVO userExamVO = new UserExamVO();
            userExamVO.setCreateTime(new Date());
            userExamVO.setExamPaper(examPaper);
            userExamVO.setQuestionId(question.getId());
            userExamVO.setQuestion(question);
            userExamVO.setUserId(user.getId());
            userExamVO.setBeginTime(new Date());
            userExamList.add(userExamVO);
            UserExam userExam = userExamConverter.voToEntity(userExamVO);
            baseMapper.insert(userExam);
        }
        data.put("userExamTitle",userExamTitle);
        data.put("userExamList",userExamList);
        return data;
    }


    @Override
    public Map<String,Object> submitUserExamPaper(List<UserExamVO> userExamList) {
        Map<String,Object> resultMap = new HashMap<>();
        UserSimpleInfo user = RequestHolder.getUser();
        // 对比考生试题答案，返回结果
        int point = 0;
        // 获取试卷答案
        List<UserExam> userExamSourceList = baseMapper.selectList(new QueryWrapper<UserExam>().eq(UserExam.USER_ID,user.getId()));
        for (UserExam source: userExamSourceList) {
            Question question = questionService.getById(source.getQuestionId());
            for (UserExamVO fromUserExam: userExamList) {
                if(fromUserExam.getQuestionId().longValue() == question.getId().longValue() ){
                    if(StringUtil.isNotEmpty(fromUserExam.getUserOption()) && fromUserExam.getUserOption().equals(question.getCorrectFlag())){
                        point += question.getPoint();
                        source.setPoint(question.getPoint());
                    }else{
                        source.setPoint(0);
                    }
                    source.setUserOption(fromUserExam.getUserOption());
                    source.setEndTime(new Date());
                    baseMapper.updateById(source);
                }
            }
        }

        String result = "考生：" + user.getUserName() + "，成绩为："+ point+"分！";
        resultMap.put("result",result);
        return resultMap;
    }

    @Override
    public List<UserExamVO> getUserExamResult() {
        return null;
    }

}
