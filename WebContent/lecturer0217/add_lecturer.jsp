<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 추가</title>
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
		if(document.form.name.value==""){
			alert('강사명이 입력되지 않았습니다.');
			document.form.name.focus();
		}else if(document.form.major.value==""){
			alert('전공이 입력되지 않았습니다.');
			document.form.major.focus();
		}else if(document.form.field.value==""){
			alert('세부전공이 입력되지 않았습니다.');
			document.form.field.focus();
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
	<%
			int idx_no = 0;
			try {
				String sql = "select max(idx) from lecturer0217";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					idx_no = rs.getInt(1)+1;
					%>
					<%
				}
			} catch (SQLException e) {
				System.out.println("max no 조회 실패");
				e.printStackTrace();
			}
		%>
	<section>
		<h2>학사 정보 등록 화면</h2>
		<form name="form" method="post" action="add_lecturer_p.jsp">
		<table>
			<tr>
				<th>강사 ID</th>
				<td><input id="in1" type="text" name="idx" value="<%=idx_no %>">
				<span>자동증가(마지막번호)+1</span>	
				</td>					
			</tr>
			
			<tr>
				<th>강사명</th>
				<td><input id="in1" type="text" name="name"></td>				
			</tr>
			
			<tr>
				<th>전공</th>
				<td><input id="in2" type="text" name="major"></td>				
			</tr>
			
			<tr>
				<th>세부 전공</th>
				<td><input id="in1" type="text" name="field"></td>				
			</tr>
			
			<tr id="tr_btn">
				<td colspan=2 align="center">
				<input id="btn1" type="button" value="등록" onclick="check()">
				<input id="btn1" type="button" value="취소" onclick="location.href='/HRD_0217/index.jsp'">
				</td>				
			</tr>
		</table>
		</form>		
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>