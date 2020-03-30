package com.education.dao;

import com.education.pojo.ClassArrange;
import com.education.pojo.ClassArrangeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClassArrangeMapper {
    int countByExample(ClassArrangeExample example);

    int deleteByExample(ClassArrangeExample example);

    int deleteByPrimaryKey(Integer indexid);

    int insert(ClassArrange record);

    int insertSelective(ClassArrange record);

    List<ClassArrange> selectByExample(ClassArrangeExample example);

    ClassArrange selectByPrimaryKey(Integer indexid);

    int updateByExampleSelective(@Param("record") ClassArrange record, @Param("example") ClassArrangeExample example);

    int updateByExample(@Param("record") ClassArrange record, @Param("example") ClassArrangeExample example);

    int updateByPrimaryKeySelective(ClassArrange record);

    int updateByPrimaryKey(ClassArrange record);
}