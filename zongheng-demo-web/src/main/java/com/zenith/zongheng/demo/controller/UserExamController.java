package com.zenith.zongheng.demo.controller;


import com.zenith.zongheng.demo.domain.vo.UserExamVO;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.zenith.zongheng.demo.domain.dto.UserExamDTO;
import com.zenith.zongheng.demo.domain.dto.UserExamSaveDTO;
import com.zenith.zongheng.demo.api.UserExamService;
import com.zenith.zongheng.core.result.R;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@RestController
@RequestMapping("/userExam")
public class UserExamController {
    @Autowired
    @Reference
    private UserExamService userExamService;



    @PostMapping("/getUserExamPaper")
    public R getUserExamPaper() {
        Map<String, Object> userExamPaper = userExamService.getUserExamPaper();
        return R.ok(userExamPaper);
    }

    @PostMapping("/submitUserExamPaper")
    public R submitUserExamPaper(@RequestBody List<UserExamVO> userExamList) {
        Map<String, Object> userExamPaper = userExamService.submitUserExamPaper(userExamList);
        return R.ok(userExamPaper);
    }


    @PostMapping("/save")
    public R createUserExam(@RequestBody UserExamSaveDTO dto) {
        userExamService.saveUserExam(dto);
        return R.ok();
    }

    @PostMapping("/update")
    public R updateUserExam(@RequestBody UserExamSaveDTO dto) {
        userExamService.updateUserExam(dto);
        return R.ok();
    }

    @PostMapping("/delete")
    public R deleteUserExam(@RequestBody Long... ids) {
        userExamService.deleteUserExam(ids);
        return R.ok();
    }

    @GetMapping("/getById/{id}")
    public R getById(@PathVariable Long id) {
        return R.ok(userExamService.getById(id));
    }


    @PostMapping("/list")
    public R list(@RequestBody(required = false) UserExamDTO dto) {
        return R.ok(userExamService.queryPage(dto));
    }

}

