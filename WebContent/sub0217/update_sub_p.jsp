<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp"%>
<%
	String id = request.getParameter("id");
	String subject_name = request.getParameter("subject_name");
	String credit = request.getParameter("credit");
	String lecturer = request.getParameter("lecturer");
	String week = request.getParameter("week");
	String start_hour = request.getParameter("start_hour");
	String end_hour = request.getParameter("end_hour");
	
	
	try {
		String sql = "update sub0217 set subject_name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject_name);
		pstmt.setString(2, credit);
		pstmt.setString(3, lecturer);
		pstmt.setString(4, week);
		pstmt.setString(5, start_hour);
		pstmt.setString(6, end_hour);
		pstmt.setString(7, id);
		pstmt.executeUpdate();
		System.out.println("수정 성공");
%>
<script>
	alert('수정이 완료되었습니다.');
	location.href = '/HRD_0217/sub0217/select_sub.jsp';
</script>
<%
	} catch (SQLException e) {
		System.out.println("수정 실패");
%>
<script>
	alert('수정 실패');
	history.back(-1);
</script>
<%
	e.printStackTrace();
	}
%>