package com.zenith.zongheng.demo.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.zenith.zongheng.demo.domain.dto.UserExamHisDTO;
import com.zenith.zongheng.demo.domain.dto.UserExamHisSaveDTO;
import com.zenith.zongheng.demo.api.UserExamHisService;
import com.zenith.zongheng.core.result.R;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author tangzx
 * @since 2021-10-06
 */
@RestController
@RequestMapping("/userExamHis")
public class UserExamHisController {
    @Autowired
    @Reference
    private UserExamHisService userExamHisService;


    @PostMapping("/save")
    public R createUserExamHis(@RequestBody UserExamHisSaveDTO dto) {
        userExamHisService.saveUserExamHis(dto);
        return R.ok();
    }

    @PostMapping("/update")
    public R updateUserExamHis(@RequestBody UserExamHisSaveDTO dto) {
        userExamHisService.updateUserExamHis(dto);
        return R.ok();
    }

    @PostMapping("/delete")
    public R deleteUserExamHis(@RequestBody Long... ids) {
        userExamHisService.deleteUserExamHis(ids);
        return R.ok();
    }

    @GetMapping("/getById/{id}")
    public R getById(@PathVariable Long id) {
        return R.ok(userExamHisService.getById(id));
    }


    @PostMapping("/list")
    public R list(@RequestBody(required = false) UserExamHisDTO dto) {
        return R.ok(userExamHisService.queryPage(dto));
    }
    
}

