<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 추가</title>
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
	<section>
		<h2>학사 정보 등록 화면</h2>
		<form name="form" method="post" action="add_stud_p.jsp">
		<table>
			<tr>
				<th>학번</th>
				<td><input id="in1" type="text" name="studno"></td>				
			</tr>
			
			<tr>
				<th>성명</th>
				<td><input id="in1" type="text" name="name"></td>				
			</tr>
			
			<tr>
				<th>학과</th>
				<td><select id="sel1" name="dept">
					<option value="" selected>선택하세요.</option>
					<option value="1">컴퓨터공학과</option>
					<option value="2">기계공학과</option>
					<option value="3">전자과</option>
					<option value="4">영문학과</option>
					<option value="5">일어과</option>
					<option value="6">경영학과</option>
					<option value="7">무역학과</option>
					<option value="8">교육학과</option>
				</select></td>				
			</tr>
			
			<tr>
				<th>학년</th>
				<td>
					<label><input id="ra1" type="radio" name="position" value="1">1학년</label>
					<label><input id="ra1" type="radio" name="position" value="2">2학년</label>
					<label><input id="ra1" type="radio" name="position" value="3">3학년</label>
					<label><input id="ra1" type="radio" name="position" value="4">4학년</label>		
				</td>				
			</tr>
			
			<tr>
				<th>취미</th>
				<td>
					<label><input id="chk1" type="checkbox" name="hobby" value="프로그램">프로그램</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="독서">독서</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="등산">등산</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="여행">여행</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="낚시">낚시</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="영화보기">영화보기</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="잠자기">잠자기</label>
					<label><input id="chk1" type="checkbox" name="hobby" value="멍때리기">멍때리기</label>
				</td>				
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input id="in2" type="text" name="address"></td>				
			</tr>
			
			<tr>
				<th>연락처</th>
				<td><input id="in1" type="text" name="phone"></td>				
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