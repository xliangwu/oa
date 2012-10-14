package org.huamuzhen.oa.server.controller;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.huamuzhen.oa.biz.ReportFormManager;
import org.huamuzhen.oa.biz.ReportFormTypeManager;
import org.huamuzhen.oa.domain.entity.OrgUnit;
import org.huamuzhen.oa.domain.entity.ReportFormType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reportForm")
public class ReportFormController {
	
	@Resource
	private ReportFormManager reportFormManager;
	
	@Resource
	private ReportFormTypeManager reportFormTypeManager;
	
	@RequestMapping(value = { "", "/" })
	public String index(){
		return "reportForm";
	}
	
	@RequestMapping("/addReportForm")
	public ModelAndView addReportForm(){
		ModelAndView mav = new ModelAndView("addReportForm");
		List<ReportFormType> reportFormTypeList = reportFormTypeManager.findAll();
		mav.addObject("reportFormTypeList", reportFormTypeList);
		return mav;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(HttpServletRequest request){
		String reportFormTypeId = request.getParameter("reportFormTypeId");
		ReportFormType reportFormType = reportFormTypeManager.findOne(reportFormTypeId);
		Set<OrgUnit> requiredOrgUnits = reportFormType.getRequiredOrgUnits();
		ModelAndView mav = new ModelAndView("checkRequiredOrgUnits");
		mav.addObject("requiredOrgUnits", requiredOrgUnits);
		
		String title = request.getParameter("title");
		String formId = request.getParameter("formId");
		String landUser = request.getParameter("landUser");
		String originalLandUser = request.getParameter("originalLandUser");
		String landLocation = request.getParameter("landLocation");
		String landArea = request.getParameter("landArea");
		String landUse = request.getParameter("landUse");
		String originalLandUse = request.getParameter("originalLandUse");
		String matter = request.getParameter("matter");
		String matterDetail = request.getParameter("matterDetail");
		String policyBasis = request.getParameter("policyBasis");
		String comment = request.getParameter("comment");
		
		return mav;
	}

}
