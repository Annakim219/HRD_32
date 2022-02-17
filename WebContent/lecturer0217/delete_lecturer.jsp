<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp"%>
<%
	String idx = request.getParameter("idx");
	
	
	try {
		String sql = "delete from lecturer0217 where idx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.executeUpdate();
		System.out.println("삭제 성공");
%>
<script>
	alert('삭제가 완료되었습니다.');
	location.href = '/HRD_0217/lecturer0217/select_lecturer.jsp';
</script>
<%
	} catch (SQLException e) {
		System.out.println("삭제 실패");
%>
<script>
	alert('삭제 실패');
	history.back(-1);
</script>
<%
	e.printStackTrace();
	}
%>