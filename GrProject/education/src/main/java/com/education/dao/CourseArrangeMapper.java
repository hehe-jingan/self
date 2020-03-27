package com.education.dao;

import com.education.pojo.CourseArrange;
import com.education.pojo.CourseArrangeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CourseArrangeMapper {
    int countByExample(CourseArrangeExample example);

    int deleteByExample(CourseArrangeExample example);

    int deleteByPrimaryKey(Integer indexid);

    int insert(CourseArrange record);

    int insertSelective(CourseArrange record);

    List<CourseArrange> selectByExample(CourseArrangeExample example);

    CourseArrange selectByPrimaryKey(Integer indexid);

    int updateByExampleSelective(@Param("record") CourseArrange record, @Param("example") CourseArrangeExample example);

    int updateByExample(@Param("record") CourseArrange record, @Param("example") CourseArrangeExample example);

    int updateByPrimaryKeySelective(CourseArrange record);

    int updateByPrimaryKey(CourseArrange record);
}