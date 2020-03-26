package com.education.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.education.pojo.BookContent;
import com.education.pojo.BookContentExample;

public interface BookContentMapper {
    int countByExample(BookContentExample example);

    int deleteByExample(BookContentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BookContent record);

    int insertSelective(BookContent record);

    List<BookContent> selectByExample(BookContentExample example);

    BookContent selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BookContent record, @Param("example") BookContentExample example);

    int updateByExample(@Param("record") BookContent record, @Param("example") BookContentExample example);

    int updateByPrimaryKeySelective(BookContent record);

    int updateByPrimaryKey(BookContent record);
    
    List<HashMap<String, Object>> getAllBookContent();
    
    
}