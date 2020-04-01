package com.education.dao;

import com.education.pojo.EvaItem;
import com.education.pojo.EvaItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EvaItemMapper {
    int countByExample(EvaItemExample example);

    int deleteByExample(EvaItemExample example);

    int deleteByPrimaryKey(Integer indexid);

    int insert(EvaItem record);

    int insertSelective(EvaItem record);

    List<EvaItem> selectByExample(EvaItemExample example);

    EvaItem selectByPrimaryKey(Integer indexid);

    int updateByExampleSelective(@Param("record") EvaItem record, @Param("example") EvaItemExample example);

    int updateByExample(@Param("record") EvaItem record, @Param("example") EvaItemExample example);

    int updateByPrimaryKeySelective(EvaItem record);

    int updateByPrimaryKey(EvaItem record);
}