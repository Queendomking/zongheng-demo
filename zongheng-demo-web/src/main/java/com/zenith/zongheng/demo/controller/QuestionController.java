package com.zenith.zongheng.demo.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.zenith.zongheng.demo.domain.dto.QuestionDTO;
import com.zenith.zongheng.demo.domain.dto.QuestionSaveDTO;
import com.zenith.zongheng.demo.api.QuestionService;
import com.zenith.zongheng.core.result.R;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
/**
 * <p>
 * 题目类型	选择、对错、填空	题目标识：1：题干 2：选项	题目 前端控制器
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@RestController
@RequestMapping("/question")
public class QuestionController {
    @Autowired
    @Reference
    private QuestionService questionService;


    @PostMapping("/save")
    public R createQuestion(@RequestBody QuestionSaveDTO dto) {
        questionService.saveQuestion(dto);
        return R.ok();
    }

    @PostMapping("/update")
    public R updateQuestion(@RequestBody QuestionSaveDTO dto) {
        questionService.updateQuestion(dto);
        return R.ok();
    }

    @PostMapping("/delete")
    public R deleteQuestion(@RequestBody Long... ids) {
        questionService.deleteQuestion(ids);
        return R.ok();
    }

    @GetMapping("/getById/{id}")
    public R getById(@PathVariable Long id) {
        return R.ok(questionService.getById(id));
    }


    @PostMapping("/list")
    public R list(@RequestBody(required = false) QuestionDTO dto) {
        return R.ok(questionService.queryPage(dto));
    }
    
}

