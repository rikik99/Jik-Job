package com.green.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Faq")
public class FaqController {

	@RequestMapping("/Home")
	public String home() {
		return "/user/faq";
	}

	@RequestMapping("/Chome")
	public String Cfaq() {
		return "company/cfaq";
	}

	@RequestMapping("/Home2")
	public String home2() {
		return "/user/faq2";
	}

	@RequestMapping("/Chome2")
	public String Cfaq2() {
		return "company/cfaq2";
	}

	@RequestMapping("/Home3")
	public String home3() {
		return "/user/faq3";
	}

	@RequestMapping("/Chome3")
	public String Cfaq3() {
		return "company/cfaq3";
	}

}
