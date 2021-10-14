package com.zenith.zongheng.demo.controller;


import com.zenith.zongheng.logs.annotation.Log;
import com.zenith.zongheng.logs.enums.LogOptTypeEnum;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.zenith.zongheng.demo.domain.dto.ExamPaperDTO;
import com.zenith.zongheng.demo.domain.dto.ExamPaperSaveDTO;
import com.zenith.zongheng.demo.api.ExamPaperService;
import com.zenith.zongheng.core.result.R;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
/**
 * <p>
 * 试卷类型type:	1：期中、2：期末、3、模拟考	学科subject：	1：Jav 前端控制器
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@RestController
@RequestMapping("/examPaper")
public class ExamPaperController {
    @Autowired
    @Reference
    private ExamPaperService examPaperService;


    @PostMapping("/save")
    @Log(value = "保存新增试卷",module = "在线考试",optType = LogOptTypeEnum.OPERATE_INSERT)
    public R createExamPaper(@RequestBody ExamPaperSaveDTO dto) {
        examPaperService.saveExamPaper(dto);
        return R.ok();
    }

    @PostMapping("/update")
    public R updateExamPaper(@RequestBody ExamPaperSaveDTO dto) {
        examPaperService.updateExamPaper(dto);
        return R.ok();
    }

    @PostMapping("/delete")
    public R deleteExamPaper(@RequestBody Long... ids) {
        examPaperService.deleteExamPaper(ids);
        return R.ok();
    }

    @GetMapping("/getById/{id}")
    public R getById(@PathVariable Long id) {
        return R.ok(examPaperService.getById(id));
    }

    @GetMapping("/getExamPaperSelectList")
    public R getExamPaperSelectList() {
        return R.ok(examPaperService.getExamPaperSelectList());
    }


    @PostMapping("/list")
    public R list(@RequestBody(required = false) ExamPaperDTO dto) {
        return R.ok(examPaperService.queryPage(dto));
    }

}

