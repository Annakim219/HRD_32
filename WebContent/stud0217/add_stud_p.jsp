<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/DBconn.jsp"%>
<%
	String studno = request.getParameter("studno");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String hobby[] = request.getParameterValues("hobby");
	String chk="";
	for(int i=0; i<hobby.length; i++){
		if((i+1) == hobby.length){
			chk = chk + hobby[i];
		}else{
			chk = chk + hobby[i] + ",";
		}
	}
	System.out.println("hobby 체크 : "+chk);
	
	
	try {
		String sql = "insert into stud0217 values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, studno);
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setString(4, position);
		pstmt.setString(5, address);
		pstmt.setString(6, phone);
		pstmt.setString(7, chk);
		pstmt.executeUpdate();
		System.out.println("등록 성공");
%>
<script>
	alert('등록이 완료되었습니다.');
	location.href = '/HRD_0217/stud0217/select_stud.jsp';
</script>
<%
	} catch (SQLException e) {
		System.out.println("등록 실패");
%>
<script>
	alert('등록 실패');
	history.back(-1);
</script>
<%
	e.printStackTrace();
	}
%>