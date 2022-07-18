package com.kiri.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.UserDAO;
import com.kiri.dto.Tbl_GroupDTO;

@Service
public class UserService {
    @Autowired
    private UserDAO user_dao;

    // 그룹 전체 조회
    public List<Tbl_GroupDTO> selectAllGroup() throws Exception{
        return user_dao.selectAllGroup();
    }

    // 카테고리 또는 지역으로 그룹 조회 
    public List<Tbl_GroupDTO> groupList(Tbl_GroupDTO tbl_group_dto) {
        return user_dao.groupList(tbl_group_dto);
    }
}