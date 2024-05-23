package com.green.users.resume.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.domain.CompanyVo;
import com.green.users.apply.domain.ApplyVo;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.resume.domain.ResumeVo;
@Mapper
public interface ResumeMapper {


	List<ResumeVo> LgetResumeList(ResumeVo resumeVo2);

	void LinsertResume(ResumeVo resumeVo);

	ResumeVo LgetResumes(ResumeVo resumeVo);

	void LResumeUpdate(ResumeVo resumeVo);

	void LResumeDelete(ResumeVo resumeVo);

	List<ResumeVo> KgetResumeList(UserVo sessionPUser);

	List<ResumeVo> KmakeResumeList(ResumeVo resumeVo, String com_id);


	Integer KgetRating(String user_id, String com_id, int rating);

	void KupdateRating(String com_id, String user_id, int rating);

	void KaddRating(String com_id, String user_id, int rating);

	ResumeVo KgetResume(ResumeVo resumeVo);

	List<ResumeVo> KgetResumeBookList(ResumeVo resumeVo, String com_id);

	List<ResumeVo> KgetOfferList(ResumeVo resumeVo, ApplyVo applyVo, CompanyVo companyVo, PostVo postVo, String com_id);

	ResumeVo KgetResumeInfo(ResumeVo resumeVo);

	List<ResumeVo> KmakeResumeView(UserVo userVo, int re_num);

	List<ResumeVo> LGetFilterResumes(ResumeVo resumeVo);


}
