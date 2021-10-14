package com.zenith.zongheng.demo.converter;

import com.zenith.zongheng.demo.domain.dto.UserExamHisSaveDTO;
import com.zenith.zongheng.demo.domain.dto.UserExamHisDTO;
import com.zenith.zongheng.demo.domain.entity.UserExam;
import com.zenith.zongheng.demo.domain.entity.UserExamHis;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.springframework.stereotype.Component;

/**
 * <p>
 *
 * </p>
 *
 * @author tangzx
 * @since 2021-10-06
 */
@Mapper(componentModel = "spring")
@Component
public interface UserExamHisConverter {

    @Mappings({})
    UserExamHis dto2UserExamHis(UserExamHisDTO dto);

    @Mappings({})
    UserExamHis dto2UserExamHis(UserExamHisSaveDTO dto);

    @Mappings({})
    UserExamHis userExamToHis(UserExam userExam);
}
