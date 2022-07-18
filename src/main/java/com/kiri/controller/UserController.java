package com.kiri.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    private HttpSession session;

    @Autowired
    private UserService user_service;

    @RequestMapping(value = "/toViewAllGroupList")
    public String toUserViewList(Model model) throws Exception{
        System.out.println("toUserViewList잘들어옴");
        List<Tbl_GroupDTO> selectAllList = user_service.selectAllGroup();
        model.addAttribute("selectAllList", selectAllList);
        return "/user/viewAllGroupList";
    }


    @RequestMapping(value = "/toUserSelectedGroupList")
    public String userViewList(Tbl_GroupDTO tbl_group_dto, Model model) throws Exception{
        System.out.println(tbl_group_dto);
        List<Tbl_GroupDTO> groupList = user_service.groupList(tbl_group_dto);
        System.out.println(groupList.toString());
        System.out.println("잘들어옴");
        model.addAttribute("groupList", groupList);
        return "/user/userSelectedGroupList";
    }
}