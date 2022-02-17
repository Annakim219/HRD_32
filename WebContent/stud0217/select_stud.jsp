<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 조회</title>
<style>
th {
	height: 35px;
	background: whitesmoke;
}

td {
	height: 25px;
	text-align: center;
}

.cnt{
	display: table;
	margin: 0 auto;
	width: 1100px;
	height: 25px;
	text-align: left;
	font-size: 0.9em;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<%
			int cnt = 0;
			try {
				String sql = "select count(*) from stud0217";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("count 조회 실패");
				e.printStackTrace();
			}
		%>
		<h2>학사 정보 목록</h2>
		<div class="cnt">
		<span>총 <b><%=cnt %>명</b>의 학사정보가 있습니다.</span>
		</div>
		<table>
			<tr>
				<th width=100>학번</th>
				<th width=100>성명</th>
				<th width=70>학과</th>
				<th width=70>학년</th>
				<th width=250>주소</th>
				<th width=120>연락처</th>
				<th width=250>취미</th>
				<th width=140>관리</th>
			</tr>
			<%	
				try{
					String sql ="select * from stud0217 order by studno";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String studno = rs.getString(1);
						String name = rs.getString(2);
						String dept = rs.getString(3);
						String position = rs.getString(4);
						String address = rs.getString(5);
						String phone = rs.getString(6);
						String hobby = rs.getString(7);				
						%>
			<tr>
				<td><%=studno%></td>
				<td><%=name%></td>
				<td><%=dept%></td>
				<td><%=position%></td>
				<td><p id="p1"><%=address%></p></td>
				<td><%=phone %></td>
				<td><p id="p1"><%=hobby%></p></td>
				<td>
				<a href="/HRD_0217/stud0217/update_stud.jsp?studno=<%=studno %>">수정</a>
				<span>|</span>
				<a href="/HRD_0217/stud0217/delete_stud.jsp?studno=<%=studno %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false}">삭제</a>
				</td>				
			</tr>
					<%
					}					
				}catch(SQLException e){
					System.out.println("테이블 조회 실패");
					e.printStackTrace();
				}
			%>
		</table>
		<div class="btn_group" align="center">
			<input id="btn1" type="button" value="학사정보 추가" onclick="location.href='/HRD_0217/stud0217/add_stud.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>