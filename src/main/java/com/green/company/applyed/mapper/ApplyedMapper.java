package com.green.company.applyed.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.applyed.domain.ApplyedVo;
import com.green.company.domain.CompanyVo;

@Mapper
public interface ApplyedMapper {
	
	CompanyVo LgetCom(String com_id);
	
	List<ApplyedVo> getApplyedList(ApplyedVo applyedVo);

	List<ApplyedVo> KgetCheckApplyedList(int ap_id, String user_id, int re_num, int result, String com_id, int po_num);
	
	void KupdateStatus(int re_num, int result, int po_num);

	List<ApplyedVo> KgetofferedList(ApplyedVo applyedVo, String user_id);

	List<ApplyedVo> KgetCheckOfferedList(int of_id, String user_id, int re_num, int result, String com_id, int po_num);

	void KupdateOfferStatus(int re_num, int result, int po_num);

}
