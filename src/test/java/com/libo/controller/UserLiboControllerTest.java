package com.libo.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.our.pojo.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/*.xml")
@WebAppConfiguration
public class UserLiboControllerTest {
	@Autowired
	public WebApplicationContext wac;
	
	public MockMvc mockMvc;
	
	public MockHttpSession session;
	@Before
	public void init(){
		System.out.println("before...");
		mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
		session = new MockHttpSession();
	}
	/**
	 * 测试doLogin方法
	 */
	@Test
	public void testDoLogin(){
		try {
			MvcResult mvcResult = mockMvc.perform(
					MockMvcRequestBuilders.get("/dologin")
					.param("user_name", "libo")
					.session(session)
					)
					.andExpect(MockMvcResultMatchers.status().is(200))
					.andDo(MockMvcResultHandlers.print())
					.andReturn();
			
			System.out.println(session.getAttribute("loginUser"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
