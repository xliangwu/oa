<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
	<c:choose>
		<c:when test="${reportFormStatusLink =='notSendReportForm'}">未发送报审单</c:when>
		<c:when test="${reportFormStatusLink =='sentToOrgUnitsReportForm'}">待回复的报审单</c:when>
		<c:when test="${reportFormStatusLink =='gotReplyFromUnitsReportForm'}">可发送给分管领导的报审表</c:when>
		<c:when test="${reportFormStatusLink =='sentToLeader1ReportForm'}">需要分管领导批复的报审表</c:when>
		<c:when test="${reportFormStatusLink =='sentToLeader2ReportForm'}">需要主要领导批复的报审表</c:when>
		<c:when test="${reportFormStatusLink =='sentToOfficeReportForm'}">发送到办公室的报审表</c:when>
		<c:when test="${reportFormStatusLink =='passedReportForm'}">发送回报审单位的报审表</c:when>
		<c:when test="${reportFormStatusLink =='deniedReportForm'}">被否决的报审表</c:when>
		<c:otherwise>?</c:otherwise>
	</c:choose>
</title>
</head>
<body>
	<h2>
		<c:choose>
			<c:when test="${reportFormStatusLink =='notSendReportForm'}">未发送报审单</c:when>
			<c:when test="${reportFormStatusLink =='sentToOrgUnitsReportForm'}">待回复的报审单</c:when>
			<c:when test="${reportFormStatusLink =='gotReplyFromUnitsReportForm'}">可发送给分管领导的报审表</c:when>
			<c:when test="${reportFormStatusLink =='sentToLeader1ReportForm'}">需要分管领导批复的报审表</c:when>
			<c:when test="${reportFormStatusLink =='sentToLeader2ReportForm'}">需要主要领导批复的报审表</c:when>
			<c:when test="${reportFormStatusLink =='sentToOfficeReportForm'}">发送到办公室的报审表</c:when>
			<c:when test="${reportFormStatusLink =='passedReportForm'}">发送回报审单位的报审表</c:when>
			<c:when test="${reportFormStatusLink =='deniedReportForm'}">被否决的报审表</c:when>
			<c:otherwise>?</c:otherwise>
		</c:choose>
	</h2>
	<a href="${contextPath}/reportForm">返回报审单管理</a><br>
	<table border="1">
		<thead>
		<tr>
			<td>报审单编号</td>
			<td>报审单名称</td>

		</tr>
		</thead>
		<tbody>
		<c:forEach var="reportForm" items="${reportFormList}">	
			<tr>
				<td>${reportForm.formId}</td>
				<td>${reportForm.title}</td>
				<td>
					<c:choose>
						<c:when test="${reportFormStatusLink =='notSendReportForm'}">
							<td><form action="${contextPath}/reportForm/sendToOrgUnits/${reportForm.id}" method="POST"><input type="submit" value="发送" onclick="return confirm('确认发送?');"></input></form></td>
							<td><form action="${contextPath}/reportForm/editUnsendReportForm/${reportForm.id}" method="POST"><input type="submit" value="编辑"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='sentToOrgUnitsReportForm' || reportFormStatusLink =='sentToLeader1ReportForm' || reportFormStatusLink =='sentToLeader2ReportForm' || reportFormStatusLink =='sentToOfficeReportForm'}">
							<td><form action="${contextPath}/reportForm/responseReportForm/${reportForm.id}" method="POST"><input type="submit" value="回复"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='gotReplyFromUnitsReportForm'}">
							<td><form action="${contextPath}/reportForm/sendToLeader1/${reportForm.id}" method="POST"><select name="leader1Id"><option></option><c:forEach var="leader1" items="${leader1List}"><option value="${leader1.id}">${leader1.username}</option></c:forEach></select><input type="submit" value="发送" onclick="return confirm('确认发送?');"></input></form></td>
							<td><form action="${contextPath}/reportForm/reCreateReportForm/${reportForm.id}" method="POST"><input type="submit" value="重新生成表单"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='passedReportForm'}">
							<td><form action="${contextPath}/reportForm/printReportForm/${reportForm.id}" method="POST"><input type="submit" value="打印"></input></form></td>
						</c:when>
						<c:when test="${reportFormStatusLink =='deniedReportForm'}">
						 	<td><form action="${contextPath}/reportForm/reCreateReportForm/${reportForm.id}" method="POST"><input type="submit" value="重新生成表单"></input></form></td>
						</c:when>
						<c:otherwise>?</c:otherwise>
					</c:choose>				
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>