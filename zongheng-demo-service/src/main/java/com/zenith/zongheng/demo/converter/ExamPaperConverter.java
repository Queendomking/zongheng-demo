package com.zenith.zongheng.demo.converter;

import com.zenith.zongheng.demo.domain.dto.ExamPaperSaveDTO;
import com.zenith.zongheng.demo.domain.dto.ExamPaperDTO;
import com.zenith.zongheng.demo.domain.entity.ExamPaper;
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
public interface ExamPaperConverter {

    @Mappings({})
    ExamPaper dto2ExamPaper(ExamPaperDTO dto);

    @Mappings({})
    ExamPaper dto2ExamPaper(ExamPaperSaveDTO dto);
}
