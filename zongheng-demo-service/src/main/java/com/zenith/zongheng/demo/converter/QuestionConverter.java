package com.zenith.zongheng.demo.converter;

import com.zenith.zongheng.demo.domain.dto.QuestionSaveDTO;
import com.zenith.zongheng.demo.domain.dto.QuestionDTO;
import com.zenith.zongheng.demo.domain.entity.Question;
import com.zenith.zongheng.demo.domain.vo.QuestionVO;
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
public interface QuestionConverter {

    @Mappings({})
    Question dto2Question(QuestionDTO dto);

    @Mappings({})
    Question dto2Question(QuestionSaveDTO dto);

    @Mappings({})
    QuestionVO entityToVO(Question titleQuestion);
}
