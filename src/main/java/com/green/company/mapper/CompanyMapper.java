package com.green.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.domain.CompanyVo;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;

@Mapper
public interface CompanyMapper {

	CompanyVo LgetCom(CompanyVo companyVo);

	CompanyVo LgetCompany(CompanyVo companyVo);

	CompanyVo LgetComView(CompanyVo companyVo);

	List<CompanyVo> LCheckGetCom_id(CompanyVo companyVo);

	PostVo KgetPost(PostVo postVo);

	void PupdateCInfo(CompanyVo companyVo);

	CompanyVo Pgeteditcompany(CompanyVo companyVo);

	void PCInfoDelete(CompanyVo companyVo);

	List<CompanyVo> KgetCompanyInfoList(CompanyVo companyVo);

	Integer KgetRating(String user_id, String com_id, int rating);

	void KupdateRating(String com_id, String user_id, int rating);

	void KaddRating(String com_id, String user_id, int rating);




}
