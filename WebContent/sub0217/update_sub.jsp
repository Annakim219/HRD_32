<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 수정</title>
<style>
tr {
	height: 30px;
}

th {
	width: 150px;
	background: whitesmoke;
}

td {
	width: 550px;
}

#in1 {
	width: 30%;
	height: 22px;
	margin-left: 2px;
}

#in2 {
	width: 80%;
	height: 22px;
	margin-left: 2px;
}
</style>
<script>
	function check() {
		if(document.form.id.value==""){
			alert('교과목코드가 입력되지 않았습니다.');
			document.form.id.focus();
		}else if(document.form.subject_name.value==""){
			alert('교과목명이 입력되지 않았습니다.');
			document.form.subject_name.focus();
		}else if(document.form.credit.value==""){
			alert('학점이 입력되지 않았습니다.');
			document.form.credit.focus();
		}else if(document.form.lecturer.value==""){
			alert('강사 선택이 되지 않았습니다.');
			document.form.lecturer.focus();
		}else if(document.form.week.value==""){
			alert('수업요일이 입력되지 않았습니다.');
			document.form.week.focus();
		}else if(document.form.start_hour.value==""){
			alert('시작시간이 입력되지 않았습니다.');
			document.form.start_hour.focus();
		}else if(document.form.end_hour.value==""){
			alert('종료시간이 입력되지 않았습니다.');
			document.form.end_hour.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>	
	<section>
	<%	
	DecimalFormat df = new DecimalFormat("0000");
	String send_id = request.getParameter("id");
	try{
		String sql ="select * from sub0217 where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, send_id);
		rs = pstmt.executeQuery();
		while(rs.next()){
			String id = rs.getString(1);
			String subject_name = rs.getString(2);
			String credit = rs.getString(3);
			String lecturer = rs.getString(4);
			String week = rs.getString(5);
			int start_hour = rs.getInt(6);
			int end_hour = rs.getInt(7);									
			%>

				
		<h2>교과목 수정</h2>
		<form name="form" method="post" action="update_sub_p.jsp">
		<table>
			<tr>
				<th>교과목코드</th>
				<td><input id="in1" type="text" name="id" value="<%=id %>"></td>				
			</tr>
			
			<tr>
				<th>과 목 명</th>
				<td><input id="in1" type="text" name="subject_name" value="<%=subject_name %>"></td>				
			</tr>

			<tr>
				<th>학 점</th>
				<td><input id="in1" type="text" name="credit" value="<%=credit %>"></td>				
			</tr>
						
			<tr>
				<th>담 당 강 사</th>
				<td><select id="sel1" name="lecturer" required>
					<option value="" selected>담당강사 선택</option>
						<%
						try{
							sql ="select * from lecturer0217";
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();
							while(rs.next()){
							String lec_idx = rs.getString(1);
							String lec_name = rs.getString(2);
						%>
					<option value="<%=lec_idx%>" <%if(lec_idx.equals(lecturer)){%>selected<%}%>><%=lec_name %></option>
						<%
							}
						} catch (SQLException e) {
							System.out.println("lecturer 조회 실패");
							e.printStackTrace();
						}
						%>
				</select></td>				
			</tr>
			
			<tr>
				<th>학년</th>
				<td>
					<label><input id="ra1" type="radio" name="week" value="1" <%if(week.equals("1")){%>checked<%}%>>월</label>
					<label><input id="ra1" type="radio" name="week" value="2" <%if(week.equals("2")){%>checked<%}%>>화</label>
					<label><input id="ra1" type="radio" name="week" value="3" <%if(week.equals("3")){%>checked<%}%>>수</label>
					<label><input id="ra1" type="radio" name="week" value="4" <%if(week.equals("4")){%>checked<%}%>>목</label>	
					<label><input id="ra1" type="radio" name="week" value="5" <%if(week.equals("5")){%>checked<%}%>>금</label>
					<label><input id="ra1" type="radio" name="week" value="6" <%if(week.equals("6")){%>checked<%}%>>토</label>	
				</td>				
			</tr>
					
			<tr>
				<th>시 작</th>
				<td><input id="in1" type="text" name="start_hour" value="<%=df.format(start_hour) %>"></td>				
			</tr>
			
			<tr>
				<th>종 료</th>
				<td><input id="in1" type="text" name="end_hour" value="<%=df.format(end_hour) %>"></td>				
			</tr>
			
			<tr id="tr_btn">
				<td colspan=2 align="center">
				<input id="btn1" type="button" value="목록" onclick="location.href='/HRD_0217/sub0217/select_sub.jsp'">
				<input id="btn1" type="button" value="수정" onclick="check()">
				</td>				
			</tr>
		</table>
		</form>
								<%
					}					
				}catch(SQLException e){
					System.out.println("테이블 조회 실패");
					e.printStackTrace();
				}
			%>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>