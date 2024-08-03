package com.example.demo.controller;

import com.example.demo.exception.ProblemNotFountException;
import com.example.demo.mapper.ProblemMapper;
import com.example.demo.pojo.Problem;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import com.example.demo.pojo.User;
import javax.servlet.http.HttpServletRequest;

import java.util.List;

@RestController
@RequestMapping("/oj")
public class ProblemController extends BaseController {

    @Autowired
    public ProblemMapper problemMapper;

    @Autowired
    public ObjectMapper objectMapper;


    /**
     * 获取 数据库中 题目列表、题目详情的接口
     * @param id
     * @return
     * @throws ProblemNotFountException
     * @throws JsonProcessingException
     */
    @RequestMapping(value = "/problems",produces = "application/json;charset=utf-8")
     public String getProblems(@RequestParam(value = "id",required = false) String id, HttpServletRequest request) throws ProblemNotFountException, JsonProcessingException {

        // 获取当前会话，不创建新会话
        HttpSession session = request.getSession(false);
        if (session == null) {
            throw new ProblemNotFountException("Session not found. User not logged in.");
        }

        // 获取会话中的 user 对象
        User user = (User) session.getAttribute("user");
        if (user == null) {
            throw new ProblemNotFountException("User not found in session.");
        }

        // 继续使用 user 对象
//        System.out.println(user.getId());

        if(id==null || id.equals("")){// 如果没有参数的话，那么直接查询全部题目
            List<Problem> list = problemMapper.selectAll_userid(user.getId()); //返回所有题目的列表
                return objectMapper.writeValueAsString(list);//前端接收的是JSON格式的数据，所以要将list转化成 json格式的字符串
        }

        // 如果有参数的话，那么查询指定id的题目详情
        int idString = Integer.parseInt(id); // 将 id 转换为整数类型 idString
        Problem problem = problemMapper.selectOne(idString); //返回特定的题目

        if(problem==null){
            throw new ProblemNotFountException();
        }

        return objectMapper.writeValueAsString(problem);

     }


}
