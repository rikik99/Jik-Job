package com.green.skill.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;
import com.green.users.resume.domain.ResumeVo;
import com.green.users.resume.mapper.ResumeMapper;

@RestController
@RequestMapping("/Filter")
public class SkillController {
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private ResumeMapper resumeMapper;
	
	@PostMapping("/GetPosts")
    public List<PostVo> getFilteredPosts(@RequestBody PostVo postVo) {
        // 필터링 조건에 따라 적절한 메소드를 호출하여 결과를 반환합니다.
        return postMapper.getFilteredPosts(postVo);
    }
	@PostMapping("/GetPosts1")
    public List<PostVo> getposts1(@RequestBody PostVo postVo) {
        // 필터링 조건에 따라 적절한 메소드를 호출하여 결과를 반환합니다.
        return postMapper.GetPosts1(postVo);
	}
	@PostMapping("/GetResume")
	public List<ResumeVo> getresume(@RequestBody ResumeVo resumeVo) {
		// 필터링 조건에 따라 적절한 메소드를 호출하여 결과를 반환합니다.
		return resumeMapper.LGetFilterResumes(resumeVo);
	}

}
	