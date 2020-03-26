package com.education.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.education.pojo.Borrow;
import com.education.pojo.BorrowExample;

public interface BorrowMapper {
    int countByExample(BorrowExample example);

    int deleteByExample(BorrowExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Borrow record);

    int insertSelective(Borrow record);

    List<Borrow> selectByExample(BorrowExample example);

    Borrow selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Borrow record, @Param("example") BorrowExample example);

    int updateByExample(@Param("record") Borrow record, @Param("example") BorrowExample example);

    int updateByPrimaryKeySelective(Borrow record);

    int updateByPrimaryKey(Borrow record);
    
    List<HashMap<String, Object>> getAllBorrow(String type,Integer userId);
}