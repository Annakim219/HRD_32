<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 수정</title>
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
		if(document.form.studno.value==""){
			alert('학번이 입력되지 않았습니다.');
			document.form.studno.focus();
		}else if(document.form.name.value==""){
			alert('성명이 입력되지 않았습니다.');
			document.form.name.focus();
		}else if(document.form.dept.value==""){
			alert('학번이 입력되지 않았습니다.');
			document.form.dept.focus();
		}else if(document.form.position.value==""){
			alert('학년이 입력되지 않았습니다.');
			document.form.position.focus();
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
	String send_studno = request.getParameter("studno");
		try{
			String sql ="select * from stud0217 where studno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_studno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String studno = rs.getString(1);
				String name = rs.getString(2);
				String dept = rs.getString(3);
				String position = rs.getString(4);
				String address = rs.getString(5);
				String phone = rs.getString(6);
				String hobby = rs.getString(7);
				String arr_hobby[] = hobby.split(",");
				%>
		<h2>학사 정보 등록 화면</h2>
		<form name="form" method="post" action="update_stud_p.jsp">
		<table>
			<tr>
				<th>학번</th>
				<td><input id="in1" type="text" name="studno" value="<%=studno %>"></td>				
			</tr>
			
			<tr>
				<th>성명</th>
				<td><input id="in1" type="text" name="name" value="<%=name %>"></td>				
			</tr>
			
			<tr>
				<th>학과</th>
				<td><select id="sel1" name="dept">
					<option value="" <%if(dept.equals("")){%>selected<%}%>>선택하세요.</option>
					<option value="1" <%if(dept.equals("1")){%>selected<%}%>> 컴퓨터공학과</option>
					<option value="2" <%if(dept.equals("2")){%>selected<%}%>>기계공학과</option>
					<option value="3" <%if(dept.equals("3")){%>selected<%}%>>전자과</option>
					<option value="4" <%if(dept.equals("4")){%>selected<%}%>>영문학과</option>
					<option value="5" <%if(dept.equals("5")){%>selected<%}%>>일어과</option>
					<option value="6" <%if(dept.equals("6")){%>selected<%}%>>경영학과</option>
					<option value="7" <%if(dept.equals("7")){%>selected<%}%>>무역학과</option>
					<option value="8" <%if(dept.equals("8")){%>selected<%}%>>교육학과</option>
				</select></td>				
			</tr>
			
			<tr>
				<th>학년</th>
				<td>
					<label><input id="ra1" type="radio" name="position" value="1" <%if(position.equals("1")){%>checked<%}%>>1학년</label>
					<label><input id="ra1" type="radio" name="position" value="2" <%if(position.equals("2")){%>checked<%}%>>2학년</label>
					<label><input id="ra1" type="radio" name="position" value="3" <%if(position.equals("3")){%>checked<%}%>>3학년</label>
					<label><input id="ra1" type="radio" name="position" value="4" <%if(position.equals("4")){%>checked<%}%>>4학년</label>		
				</td>				
			</tr>
			
			<tr>
				<th>취미</th>
				<td>
					<label><input id="chk1" type="checkbox" name="hobby" value="프로그램" <%for(int i=0;i<arr_hobby.length;i++)if("프로그램".equals(arr_hobby[i])){out.print("checked");}%>>프로그램</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="독서" <%for(int i=0;i<arr_hobby.length;i++)if("독서".equals(arr_hobby[i])){out.print("checked");}%>>독서</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="등산" <%for(int i=0;i<arr_hobby.length;i++)if("등산".equals(arr_hobby[i])){out.print("checked");}%>>등산</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="여행" <%for(int i=0;i<arr_hobby.length;i++)if("여행".equals(arr_hobby[i])){out.print("checked");}%>>여행</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="낚시" <%for(int i=0;i<arr_hobby.length;i++)if("낚시".equals(arr_hobby[i])){out.print("checked");}%>>낚시</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="영화보기" <%for(int i=0;i<arr_hobby.length;i++)if("영화보기".equals(arr_hobby[i])){out.print("checked");}%>>영화보기</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="잠자기" <%for(int i=0;i<arr_hobby.length;i++)if("잠자기".equals(arr_hobby[i])){out.print("checked");}%>>잠자기</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="멍때리기" <%for(int i=0;i<arr_hobby.length;i++)if("멍때리기".equals(arr_hobby[i])){out.print("checked");}%>>멍때리기</label>
				</td>				
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input id="in2" type="text" name="address" value="<%=address %>"></td>				
			</tr>
			
			<tr>
				<th>연락처</th>
				<td><input id="in1" type="text" name="phone" value="<%=phone %>"></td>				
			</tr>
			
			<tr id="tr_btn">
				<td colspan=2 align="center">
				<input id="btn1" type="button" value="목록" onclick="location.href='/HRD_0217/stud0217/select_stud.jsp'">
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