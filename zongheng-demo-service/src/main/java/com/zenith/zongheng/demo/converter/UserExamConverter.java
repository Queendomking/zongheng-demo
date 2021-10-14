package com.zenith.zongheng.demo.converter;

import com.zenith.zongheng.demo.domain.dto.UserExamSaveDTO;
import com.zenith.zongheng.demo.domain.dto.UserExamDTO;
import com.zenith.zongheng.demo.domain.entity.UserExam;
import com.zenith.zongheng.demo.domain.vo.UserExamVO;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.springframework.stereotype.Component;

/**
 * <p>
 *
 * </p>
 *
 * @author tangzx
 * @since 2021-10-04
 */
@Mapper(componentModel = "spring")
@Component
public interface UserExamConverter {

    @Mappings({})
    UserExam dto2UserExam(UserExamDTO dto);

    @Mappings({})
    UserExam dto2UserExam(UserExamSaveDTO dto);

    @Mappings({})
    UserExam voToEntity(UserExamVO userExamVO);
}
