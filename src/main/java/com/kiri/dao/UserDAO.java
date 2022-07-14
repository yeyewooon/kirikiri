package com.kiri.dao;

import java.util.List;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Tbl_GroupDTO;

@Repository
public class UserDAO {
    @Autowired
    private BasicDataSource bds;

    @Autowired
    private SqlSession session;


    // 전체 그룹 조회
    public List<Tbl_GroupDTO> selectAllGroup(){
        return session.selectList("userMapper.selectAllGroup");
    }

    // 카테고리 또는 지역으로 그룹 조회 
    public List<Tbl_GroupDTO> groupList(Tbl_GroupDTO tbl_group_dto) {
        return session.selectList("userMapper.groupList", tbl_group_dto);
    }
}