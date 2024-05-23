package com.green;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.company.domain.CompanyVo;
import com.green.users.domain.UserVo;
import com.green.users.mapper.UserMapper;

@SpringBootTest
public class GreenApplicationTests {
	@Autowired
	private UserMapper userMapper;
	
	@Test
	void comInsert() {
		CompanyVo vo = new CompanyVo();
		vo.setCom_id("test@test.com");
		vo.setCom_pw("1234");
		vo.setCom_name("test");
		vo.setCom_num("010");
		vo.setCom_boss("96/05/01");
		vo.setCom_adr("test");
		vo.setCom_tell("test");
		userMapper.insertCUser(vo);
		System.out.println("test완료");
	}
	@Test
	void userInsert() {
		UserVo vo = new UserVo();
		vo.setUser_id("test@test.com");
		vo.setUser_name("test");
		vo.setUser_pw("1234");
		vo.setUser_tell("test");
		vo.setUser_birth("96/05/01");
		vo.setUser_adr("test");
		userMapper.insertPUser(vo);
		System.out.println("test완료");
	}

}
